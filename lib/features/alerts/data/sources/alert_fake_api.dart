import 'package:dio/dio.dart';

import '../../../../core/models/edition.dart';
// The fake backend sees the whole catalog, like the real server will.
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../domain/entities/book_alert.dart';
import '../models/book_alert_model.dart';

/// Alerts' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Each alert is checked against the catalog
/// every time it's read, the way the real server's job will check it.
abstract final class AlertFakeApi {
  static const String alerts = '/alerts';

  /// Body: `{kind, bookId, editionId, targetPriceBdt?}`.
  static const String set = '/alerts/set';

  /// Body: `{id}`.
  static const String remove = '/alerts/remove';

  /// A fresh, empty list per interceptor, so every test starts clean.
  static Map<String, Object? Function(RequestOptions)> routes() {
    final saved = <Map<String, dynamic>>[];
    var nextId = 1;
    List<Object?> answer() => [
      for (final alert in saved) ?_checked(alert)?.toJson(),
    ];
    return {
      alerts: (_) => answer(),
      set: (options) {
        final body = Map<String, dynamic>.of(
          options.data as Map<String, dynamic>,
        );
        saved
          ..removeWhere(
            (a) =>
                a['kind'] == body['kind'] &&
                a['editionId'] == body['editionId'],
          )
          ..add(body..['id'] = 'al-${nextId++}');
        return answer();
      },
      remove: (options) {
        saved.removeWhere((a) => a['id'] == (options.data as Map)['id']);
        return answer();
      },
    };
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
