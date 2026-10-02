import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../wallet/domain/entities/wallet.dart';
import '../../domain/entities/handled_sale.dart';
import '../../domain/repositories/handled_sale_repository.dart';
import '../../../notifications/data/sources/notification_sale_sends.dart';
import 'fake_sale.dart';
import 'handled_sale_fake_store.dart';

/// The seller sends; the buyer cancels before that, or confirms after.
extension HandledSaleFakeSteps on HandledSaleFakeStore {
  /// `null` when it isn't the reader's move.
  FakeSale? step(String id, SaleStep step) {
    final s = sales[id];
    if (s == null) return null;
    final buying = s.buyerId == HandledSaleFakeStore.me;
    switch (step) {
      case SaleStep.send when !buying && s.status == SaleStatus.paid:
        s.status = SaleStatus.sent;
        notifications?.saleSent(s.buyerId, s.id, titleOf(s));
      case SaleStep.cancel when buying && s.status == SaleStatus.paid:
        s.status = SaleStatus.cancelled;
        wallet.credit(
          s.buyerPaysBdt,
          WalletReason.cancelRefund,
          orderNumber: s.id,
        );
        p2p.setStatus(s.listingId, P2pListingStatus.live);
      case SaleStep.confirm when buying && s.status == SaleStatus.sent:
        s.status = SaleStatus.completed;
        p2p.setStatus(
          s.listingId,
          P2pListingStatus.sold,
          buyerId: HandledSaleFakeStore.me,
        );
        notifications?.saleCompleted(
          s.sellerId,
          s.id,
          titleOf(s),
          s.sellerGetsBdt,
        );
      default:
        return null;
    }
    return s;
  }
}
