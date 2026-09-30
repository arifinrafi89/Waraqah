import '../entities/coupon.dart';
import '../entities/order_receipt.dart';
import '../entities/payment_method.dart';
import '../entities/saved_address.dart';

class PlaceOrderRequest {
  const PlaceOrderRequest({
    required this.addressId,
    required this.payment,
    this.couponCode,
    this.usePoints = false,
  });

  final String addressId;
  final PaymentMethod payment;
  final String? couponCode;

  /// Pay part of the books with Waraqah points, as far as the rules allow.
  final bool usePoints;
}

/// Everything checkout asks the server. Placing an order turns the cart into
/// an order and empties the cart.
abstract interface class CheckoutRepository {
  Future<List<SavedAddress>> addresses();

  /// `null` when no coupon has that code.
  Future<Coupon?> findCoupon(String code);

  Future<OrderReceipt> placeOrder(PlaceOrderRequest request);
}
