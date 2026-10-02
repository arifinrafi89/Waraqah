import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog_admin/data/models/book_draft_json.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/book_draft.dart';
import 'package:waraqah/features/notifications/domain/entities/notification_kind.dart';

import 'helpers/fake_backend.dart';

void main() {
  late FakeBackend api;

  setUp(() => api = FakeBackend());

  test('handled sales: sent, completed and settled', () async {
    await api.post('/sales/step', {'id': 'HS-103', 'step': 'send'});
    expect(api.sent('p-mahi', NotificationKind.saleSent), hasLength(1));

    await api.post('/sales/step', {'id': 'HS-101', 'step': 'confirm'});
    expect(
      api
          .sent('p-arif', NotificationKind.saleCompleted)
          .single
          .params['amount'],
      '361',
    );

    await api.post('/sales/disputes/settle', {
      'id': 'HS-104',
      'refund': true,
      'by': 'Mod',
    });
    expect(
      api.sent('p-sadia', NotificationKind.saleSettled).single.params['role'],
      'buyer',
    );
    expect(api.sent('p-tanvir', NotificationKind.saleSettled), hasLength(1));
  });

  test('Sell Back paid and sent back', () async {
    await api.post('/sell-back/grade', {
      'id': 'SB-203',
      'condition': 'good',
      'accept': true,
      'by': 'Staff',
    });
    final paid = api.sent('me', NotificationKind.sellBackPaid).single;
    expect(paid.params['title'], contains('Sapiens'));

    await api.post('/sell-back/grade', {
      'id': 'SB-202',
      'condition': 'good',
      'accept': false,
      'by': 'Staff',
    });
    expect(
      api.sent('p-nabila', NotificationKind.sellBackReturned),
      hasLength(1),
    );
  });

  test('a price drop notifies exactly once', () async {
    await api.post('/alerts/set', {
      'kind': 'priceDrop',
      'bookId': 'bk-atomic',
      'editionId': 'bk-atomic-pb-en',
      'targetPriceBdt': 500,
    });
    final atomic = BookFixtures.all.firstWhere((b) => b.id == 'bk-atomic');
    final cheaper = BookDraft.of(atomic).copyWith(
      editions: [
        for (final e in atomic.editions)
          e.id == 'bk-atomic-pb-en' ? e.copyWith(priceBdt: 480) : e,
      ],
    );
    await api.post('/admin/catalog/books/save', cheaper.toJson());
    await api.post('/admin/catalog/books/save', cheaper.toJson());
    final alert = api.sent('me', NotificationKind.alertTriggered).single;
    expect(alert.params, {'title': 'Atomic Habits', 'reason': 'priceDrop'});
  });

  test('a book request tells the sellers who have it', () async {
    await api.post('/requests', {'title': 'Digital Logic Design'});
    expect(api.sent('p-mahi', NotificationKind.bookWanted), hasLength(1));
    expect(api.sent('me', NotificationKind.bookWanted), isEmpty);
  });
}
