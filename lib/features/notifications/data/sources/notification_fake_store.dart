import 'dart:async';

// Notifications go to readers by their marketplace id.
import '../../../p2p/data/sources/p2p_people.dart';
import '../../domain/entities/notification_kind.dart';
import '../models/app_notification_model.dart';
import 'notification_seed.dart';

/// Every reader's notifications, as the fake backend keeps them. Other
/// features' fake backends call [send] when something happens to a reader;
/// only [P2pPeople.me]'s show in the app.
class NotificationFakeStore {
  NotificationFakeStore({required this.muted, DateTime Function()? clock})
    : now = clock ?? DateTime.now {
    for (final n in notificationSeed(now())) {
      _all.add((P2pPeople.me, n));
    }
  }

  /// Whether "me" muted [NotificationKind]'s group in Settings.
  final bool Function(NotificationKind kind) muted;
  final DateTime Function() now;

  /// Newest first.
  final List<(String, AppNotificationModel)> _all = [];
  final StreamController<int> _changes = StreamController.broadcast();
  int _ids = 0;

  /// "me"'s unread count after each change to their notifications.
  Stream<int> get changes => _changes.stream;

  /// Tells [readerId] that [kind] happened. Dropped when they muted it.
  void send(
    String readerId,
    NotificationKind kind, {
    Map<String, String> params = const {},
    NotificationTargetModel? target,
  }) {
    if (readerId == P2pPeople.me && muted(kind)) return;
    final note = AppNotificationModel(
      id: 'nt-${++_ids}',
      kind: kind,
      createdAt: now(),
      params: params,
      target: target,
    );
    _all.insert(0, (readerId, note));
    if (readerId == P2pPeople.me) _changed();
  }

  /// "me"'s notifications, newest first.
  List<AppNotificationModel> mine() => [
    for (final (reader, note) in _all)
      if (reader == P2pPeople.me) note,
  ];

  /// Everything sent to [readerId], newest first (for tests).
  List<AppNotificationModel> sentTo(String readerId) => [
    for (final (reader, note) in _all)
      if (reader == readerId) note,
  ];

  int get unread => mine().where((n) => !n.read).length;

  /// `false` for an id that isn't one of "me"'s.
  bool markRead(String id) {
    final i = _all.indexWhere((e) => e.$1 == P2pPeople.me && e.$2.id == id);
    if (i < 0) return false;
    _all[i] = (P2pPeople.me, _all[i].$2.copyWith(read: true));
    _changed();
    return true;
  }

  void markAllRead() {
    for (var i = 0; i < _all.length; i++) {
      if (_all[i].$1 == P2pPeople.me) {
        _all[i] = (P2pPeople.me, _all[i].$2.copyWith(read: true));
      }
    }
    _changed();
  }

  void _changed() => _changes.add(unread);
}
