import '../../../checkout/domain/entities/payment_method.dart';
import '../entities/earnings.dart';
import '../entities/handled_sale.dart';
import '../entities/sale_dispute.dart';

/// What happens to a sale next. Each answers the sale as it is now.
enum SaleStep { send, cancel, confirm }

abstract interface class HandledSaleRepository {
  Future<HandledSale> buy(String listingId, PaymentMethod method);

  /// The reader's sales, buying and selling, newest first.
  Future<List<HandledSale>> mine();

  /// `null` when there's no such sale of the reader's.
  Future<HandledSale?> sale(String id);

  Future<HandledSale> step(String id, SaleStep step);

  Future<HandledSale> dispute(DisputeDraft draft);

  Future<Earnings> earnings();

  /// Sends what's available to the seller's bKash.
  Future<Earnings> payout();

  /// Open disputes, for moderators.
  Future<List<SaleDispute>> disputes();

  /// Settles one: [refund] the buyer, or pay the seller. [by] is the
  /// moderator's name for the audit log.
  Future<List<SaleDispute>> settle(
    String id, {
    required bool refund,
    required String by,
  });
}
