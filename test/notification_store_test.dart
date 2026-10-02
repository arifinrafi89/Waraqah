import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/notifications/data/models/app_notification_model.dart';
import 'package:waraqah/features/notifications/data/sources/notification_fake_store.dart';
import 'package:waraqah/features/notifications/domain/entities/notification_kind.dart';

NotificationFakeStore _store({Set<NotificationKind> muted = const {}}) =>
    NotificationFakeStore(
      muted: muted.contains,
      clock: () => DateTime(2026, 10, 3, 12),
    );

void main() {
  test('starts with the seeds, three unread', () {
    final store = _store();
    expect(store.mine(), hasLength(7));
    expect(store.unread, 3);
  });

  test('send puts the newest first; only "me"\'s are mine', () {
    final store = _store()
      ..send(
        'me',
        NotificationKind.orderStatus,
        params: {'number': 'WQ-1', 'status': 'packed'},
        target: const NotificationTargetModel(
          kind: NotificationTargetKind.order,
          id: 'WQ-1',
        ),
      )
      ..send('p-tanvir', NotificationKind.bookWanted, params: {'title': 'X'});
    expect(store.mine().first.params['number'], 'WQ-1');
    expect(store.mine(), hasLength(8));
    expect(store.sentTo('p-tanvir').single.kind, NotificationKind.bookWanted);
  });

  test('markRead and markAllRead; an unknown id is refused', () {
    final store = _store();
    expect(store.markRead(store.mine().first.id), isTrue);
    expect(store.unread, 2);
    expect(store.markRead('nope'), isFalse);
    store.markAllRead();
    expect(store.unread, 0);
  });

  test('a muted kind is dropped, others still arrive', () {
    final store = _store(muted: {NotificationKind.alertTriggered})
      ..send('me', NotificationKind.alertTriggered)
      ..send('me', NotificationKind.moderationWarning);
    expect(store.mine().first.kind, NotificationKind.moderationWarning);
    expect(store.unread, 4);
  });

  test('changes fires with the new unread count', () async {
    final store = _store();
    final counts = <int>[];
    final sub = store.changes.listen(counts.add);
    store
      ..send('me', NotificationKind.saleSent)
      ..send('p-arif', NotificationKind.saleSent)
      ..markAllRead();
    await Future<void>.delayed(Duration.zero);
    expect(counts, [4, 0]);
    await sub.cancel();
  });
}
