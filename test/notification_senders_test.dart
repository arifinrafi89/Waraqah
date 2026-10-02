import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/notifications/domain/entities/notification_kind.dart';

import 'helpers/fake_backend.dart';

void main() {
  late FakeBackend api;

  setUp(() => api = FakeBackend());

  test('staff advance an order, and decide a return', () async {
    await api.post('/admin/orders/advance', {
      'number': 'WQ-100215',
      'status': 'delivered',
    });
    final status = api.sent('me', NotificationKind.orderStatus).single;
    expect(status.params, {'number': 'WQ-100215', 'status': 'delivered'});
    expect(status.target?.kind, NotificationTargetKind.order);

    await api.post('/orders/return', {
      'number': 'WQ-100201',
      'reason': 'damaged',
      'note': '',
      'photos': <String>[],
    });
    await api.post('/admin/orders/return', {
      'number': 'WQ-100201',
      'approve': true,
    });
    expect(
      api.sent('me', NotificationKind.returnDecided).single.params['approved'],
      'true',
    );
  });

  test('a Listing decision, a warning and a ban reach the owner', () async {
    await api.post('/moderation/listings/decide', {
      'listingId': 'p2p-review-1',
      'decision': 'requestChanges',
      'reason': 'Show the copyright page.',
      'by': 'Mod',
    });
    final decided = api.sent('me', NotificationKind.listingDecided).single;
    expect(decided.params['decision'], 'requestChanges');
    expect(decided.params['reason'], 'Show the copyright page.');

    await api.post('/moderation/reports/act', {
      'reportId': 'rp-s1',
      'action': 'warn',
      'by': 'Mod',
    });
    expect(
      api.sent('p-mahi', NotificationKind.moderationWarning).single.params,
      {'strikes': '1', 'max': '3'},
    );
    await api.post('/moderation/reports/act', {
      'reportId': 'rp-s3',
      'action': 'ban',
      'by': 'Mod',
    });
    expect(api.sent('p-rafi', NotificationKind.banned), hasLength(1));
  });

  test('a muted group is not sent; moderation always is', () async {
    api.stores.profile.prefs = api.stores.profile.prefs.copyWith(
      muted: ['orders', 'usedBooks'],
    );
    await api.post('/admin/orders/advance', {
      'number': 'WQ-100215',
      'status': 'delivered',
    });
    expect(api.sent('me', NotificationKind.orderStatus), isEmpty);
    api.stores.notifications.send('me', NotificationKind.moderationWarning);
    expect(api.sent('me', NotificationKind.moderationWarning), hasLength(1));
  });
}
