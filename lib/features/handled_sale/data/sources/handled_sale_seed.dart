import '../../../checkout/domain/entities/payment_method.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../../domain/entities/handled_sale.dart';
import '../models/earnings_model.dart';
import 'fake_sale.dart';

/// Sales already under way, for the Listings in `p2p_handled_seed.dart`.
List<FakeSale> handledSaleSeed(DateTime now) {
  FakeSale sale(
    String id,
    String listingId,
    String buyer,
    String seller,
    int price,
    PaymentMethod method,
    SaleStatus status,
    Duration ago,
  ) => FakeSale(
    id: id,
    listingId: listingId,
    buyerId: buyer,
    sellerId: seller,
    priceBdt: price,
    method: method,
    createdAt: now.subtract(ago),
    status: status,
  );
  const me = P2pPeople.me;
  return [
    sale(
      'HS-101',
      'p2p-hs-1',
      me,
      'p-arif',
      380,
      PaymentMethod.bkash,
      SaleStatus.sent,
      const Duration(days: 2),
    ),
    sale(
      'HS-102',
      'p2p-hs-2',
      'p-talha',
      me,
      300,
      PaymentMethod.nagad,
      SaleStatus.completed,
      const Duration(days: 10),
    ),
    sale(
      'HS-103',
      'p2p-hs-3',
      'p-mahi',
      me,
      220,
      PaymentMethod.card,
      SaleStatus.paid,
      const Duration(hours: 3),
    ),
    sale(
        'HS-104',
        'p2p-hs-4',
        'p-sadia',
        'p-tanvir',
        450,
        PaymentMethod.bkash,
        SaleStatus.disputed,
        const Duration(days: 4),
      )
      ..disputeReason = DisputeReason.damaged
      ..disputeNote = 'Water damage on the back cover that the photos hid.',
  ];
}

/// Deep Work's money, already sent to the reader's bKash.
List<PayoutModel> payoutSeed(DateTime now) => [
  PayoutModel(amountBdt: 285, at: now.subtract(const Duration(days: 3))),
];
