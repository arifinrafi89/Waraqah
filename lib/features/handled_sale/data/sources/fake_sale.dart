import '../../../checkout/domain/entities/payment_method.dart';
import '../../domain/entities/handled_sale.dart';
import '../../domain/entities/sale_math.dart';

/// A handled sale as the fake backend stores it, once for both sides.
class FakeSale {
  FakeSale({
    required this.id,
    required this.listingId,
    required this.buyerId,
    required this.sellerId,
    required this.priceBdt,
    required this.method,
    required this.createdAt,
    this.status = SaleStatus.paid,
  }) : feeBdt = SaleMath.feeFor(priceBdt);

  final String id;
  final String listingId;
  final String buyerId;
  final String sellerId;
  final int priceBdt;
  final int feeBdt;
  final PaymentMethod method;
  final DateTime createdAt;
  SaleStatus status;
  DisputeReason? disputeReason;
  String? disputeNote;
  List<String> disputePhotos = const [];

  int get buyerPaysBdt => SaleMath.buyerPays(priceBdt);

  int get sellerGetsBdt => SaleMath.sellerGets(priceBdt);
}
