import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/handled_sale.dart';

/// Reader-facing words for handled sales.
extension SaleLabels on AppL10n {
  String saleStatus(SaleStatus status) => switch (status) {
    SaleStatus.paid => usedSaleStatusPaid,
    SaleStatus.sent => usedSaleStatusSent,
    SaleStatus.completed => usedSaleStatusCompleted,
    SaleStatus.disputed => usedSaleStatusDisputed,
    SaleStatus.refunded => usedSaleStatusRefunded,
    SaleStatus.released => usedSaleStatusReleased,
    SaleStatus.cancelled => usedSaleStatusCancelled,
  };

  /// What's happening now and what to do, from the reader's side.
  String saleHint(HandledSale sale) {
    final name = sale.otherName;
    final held = Bdt.format(sale.buyerPaysBdt);
    final yours = Bdt.format(sale.sellerGetsBdt);
    final buying = sale.isBuying;
    return switch (sale.status) {
      SaleStatus.paid =>
        buying
            ? usedSaleHintBuyerPaid(name, held)
            : usedSaleHintSellerPaid(name, yours),
      SaleStatus.sent =>
        buying ? usedSaleHintBuyerSent : usedSaleHintSellerSent(name, yours),
      SaleStatus.disputed => usedSaleHintDisputed,
      SaleStatus.completed =>
        buying ? usedSaleHintBuyerDone(name) : usedSaleHintSellerDone(yours),
      SaleStatus.refunded =>
        buying ? usedSaleHintBuyerRefunded(held) : usedSaleHintSellerRefunded,
      SaleStatus.released =>
        buying ? usedSaleHintBuyerReleased : usedSaleHintSellerReleased(yours),
      SaleStatus.cancelled => usedSaleHintCancelled,
    };
  }

  String disputeReason(DisputeReason reason) => switch (reason) {
    DisputeReason.notAsDescribed => usedDisputeNotAsDescribed,
    DisputeReason.damaged => usedDisputeDamaged,
    DisputeReason.photocopy => usedDisputePhotocopy,
    DisputeReason.wrongBook => usedDisputeWrongBook,
    DisputeReason.notReceived => usedDisputeNotReceived,
  };
}
