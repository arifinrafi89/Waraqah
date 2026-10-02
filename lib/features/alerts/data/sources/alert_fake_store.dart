// The fake backend sees the whole catalog, like the real server will, and
// tells the reader when an alert first fires.
import '../../../../core/models/edition.dart';
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../notifications/data/sources/notification_fake_store.dart';
import '../../../notifications/data/sources/notification_sends.dart';
import '../../domain/entities/book_alert.dart';
import '../models/book_alert_model.dart';

/// The signed-in reader's price and stock alerts. Each is checked against
/// the catalog when read, and [sweep] (after Staff change prices or stock)
/// notifies once per alert when it first fires.
class AlertFakeStore {
  AlertFakeStore([this.notifications]);

  final NotificationFakeStore? notifications;
  final List<Map<String, dynamic>> _saved = [];

  /// Alerts already firing, so each notifies once.
  final Set<String> _notified = {};
  int _nextId = 1;

  List<BookAlertModel> all() => [for (final alert in _saved) ?_checked(alert)];

  /// Replaces an alert of the same kind on the same Edition. One that
  /// already fires when set needs no notification: the page shows it.
  void set(Map<String, dynamic> body) {
    final alert = Map<String, dynamic>.of(body)..['id'] = 'al-${_nextId++}';
    _saved
      ..removeWhere(
        (a) =>
            a['kind'] == alert['kind'] && a['editionId'] == alert['editionId'],
      )
      ..add(alert);
    if (_checked(alert)?.isTriggered ?? false) _notified.add(alert['id']);
  }

  void remove(String id) => _saved.removeWhere((a) => a['id'] == id);

  void sweep() {
    for (final alert in all()) {
      if (!alert.isTriggered || !_notified.add(alert.id)) continue;
      notifications?.alertTriggered(
        alert.bookId,
        alert.bookTitle,
        inStock: alert.kind == AlertKind.backInStock,
      );
    }
  }

  /// The alert as it stands today, or `null` if its book is gone.
  static BookAlertModel? _checked(Map<String, dynamic> alert) {
    for (final book in BookFixtures.all) {
      for (final edition in book.editions) {
        if (edition.id != alert['editionId']) continue;
        final kind = AlertKind.values.byName(alert['kind'] as String);
        final target = alert['targetPriceBdt'] as int?;
        return BookAlertModel(
          id: alert['id'] as String,
          kind: kind,
          bookId: book.id,
          editionId: edition.id,
          bookTitle: book.title,
          currentPriceBdt: edition.priceBdt,
          targetPriceBdt: target,
          isTriggered: switch (kind) {
            AlertKind.backInStock => edition.isOrderable,
            AlertKind.priceDrop => target != null && edition.priceBdt <= target,
          },
        );
      }
    }
    return null;
  }
}
