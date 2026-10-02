import '../entities/coupon.dart';
import '../entities/gift.dart';
import '../entities/order_receipt.dart';
import '../entities/payment_method.dart';

class PlaceOrderRequest {
  const PlaceOrderRequest({
    required this.addressId,
    required this.payment,
    this.couponCode,
    this.usePoints = false,
    this.gift,
    this.useWallet = false,
  });

  final String addressId;
  final PaymentMethod payment;
  final String? couponCode;

  /// Pay part of the books with Waraqah points, as far as the rules allow.
  final bool usePoints;

  /// Set when the order is a gift.
  final Gift? gift;

  /// Pay what the wallet can cover from it.
  final bool useWallet;
}

/// Everything checkout asks the server. Addresses come from Profile's
/// `addressesProvider`. Placing an order turns the cart into
/// an order and empties the cart.
abstract interface class CheckoutRepository {
  /// `null` when no coupon has that code.
  Future<Coupon?> findCoupon(String code);

  Future<OrderReceipt> placeOrder(PlaceOrderRequest request);
}
