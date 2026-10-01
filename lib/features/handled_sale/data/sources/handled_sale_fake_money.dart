import '../../../moderation/domain/entities/audit_entry.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../wallet/domain/entities/wallet.dart';
import '../../domain/entities/handled_sale.dart';
import '../models/earnings_model.dart';
import 'fake_sale.dart';
import 'handled_sale_fake_store.dart';

/// Disputes, and the seller's earnings and payouts.
extension HandledSaleFakeMoney on HandledSaleFakeStore {
  /// `null` unless the reader bought it and it's been sent.
  FakeSale? dispute(
    String id,
    DisputeReason reason,
    String? note,
    List<String> photos,
  ) {
    final s = sales[id];
    if (s == null ||
        s.buyerId != HandledSaleFakeStore.me ||
        s.status != SaleStatus.sent) {
      return null;
    }
    return s
      ..status = SaleStatus.disputed
      ..disputeReason = reason
      ..disputeNote = note
      ..disputePhotos = photos;
  }

  Iterable<FakeSale> get _selling =>
      sales.values.where((s) => s.sellerId == HandledSaleFakeStore.me);

  Map<String, dynamic> earningsJson() {
    int sum(bool Function(FakeSale) which) =>
        _selling.where(which).fold(0, (t, s) => t + s.sellerGetsBdt);
    return EarningsModel(
      heldBdt: sum(
        (s) => const [
          SaleStatus.paid,
          SaleStatus.sent,
          SaleStatus.disputed,
        ].contains(s.status),
      ),
      earnedBdt: sum(
        (s) =>
            s.status == SaleStatus.completed || s.status == SaleStatus.released,
      ),
      paidOutBdt: payouts.fold(0, (t, p) => t + p.amountBdt),
      payouts: payouts.reversed.toList(),
    ).toJson();
  }

  /// `false` when there's nothing to pay out.
  bool payout() {
    final earnings = EarningsModel.fromJson(earningsJson());
    final available = earnings.earnedBdt - earnings.paidOutBdt;
    if (available <= 0) return false;
    payouts.add(PayoutModel(amountBdt: available, at: now()));
    return true;
  }

  List<Map<String, dynamic>> disputesJson() => [
    for (final s in sales.values)
      if (s.status == SaleStatus.disputed)
        {
          'sale': json(s, s.buyerId),
          'buyerName': nameOf(s.buyerId),
          'sellerName': nameOf(s.sellerId),
        },
  ];

  /// A moderator's decision: [refund] the buyer (the book goes back), or
  /// pay the seller. `false` when it isn't disputed.
  bool settle(String id, {required bool refund, required String by}) {
    final s = sales[id];
    if (s == null || s.status != SaleStatus.disputed) return false;
    final title = p2p.find(s.listingId)?.title ?? s.id;
    if (refund) {
      s.status = SaleStatus.refunded;
      p2p.setStatus(s.listingId, P2pListingStatus.live);
      // Only the signed-in reader's wallet lives on this fake backend.
      if (s.buyerId == HandledSaleFakeStore.me) {
        wallet.credit(
          s.buyerPaysBdt,
          WalletReason.returnRefund,
          orderNumber: s.id,
        );
      }
    } else {
      s.status = SaleStatus.released;
      p2p.setStatus(s.listingId, P2pListingStatus.sold, buyerId: s.buyerId);
    }
    moderation?.record(
      by,
      refund ? AuditAction.refunded : AuditAction.paidSeller,
      title,
      s.disputeReason?.name,
    );
    return true;
  }
}
