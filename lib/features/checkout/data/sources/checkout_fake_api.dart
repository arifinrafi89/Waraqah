import 'package:dio/dio.dart';

// The fake backend sees the cart, like the real server will.
import '../../../cart/data/models/cart_model.dart';
import '../../../cart/data/sources/cart_fake_store.dart';
import '../../../cart/domain/entities/cart.dart';
import '../../domain/entities/checkout_totals.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/entities/saved_address.dart';
import '../models/coupon_model.dart';
import '../models/order_receipt_model.dart';
import '../models/saved_address_model.dart';
import 'checkout_fixtures.dart';

/// Checkout's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`, sharing the fake cart.
abstract final class CheckoutFakeApi {
  static const String addresses = '/addresses';

  /// `?code=EID100`; answers the coupon or `null`.
  static const String coupon = '/coupons/check';

  /// Body: `{addressId, payment, couponCode?}`. Works out the totals the
  /// same way the app does, empties the cart and answers a receipt; `null`
  /// when the cart is empty or the address unknown.
  static const String placeOrder = '/orders/place';

  static Map<String, Object? Function(RequestOptions)> routes(
    CartFakeStore cart,
  ) {
    var nextNumber = 100231;
    return {
      addresses: (_) => [
        for (final address in CheckoutFixtures.addresses) address.toJson(),
      ],
      coupon: (options) => CheckoutFixtures.coupon(
        options.queryParameters['code'] as String? ?? '',
      )?.toJson(),
      placeOrder: (options) {
        final body = options.data as Map<String, dynamic>? ?? const {};
        final address = CheckoutFixtures.address(
          body['addressId'] as String? ?? '',
        )?.toEntity();
        final lines = CartModel.fromJson(cart.toJson()).toEntity();
        if (address == null || lines.isEmpty) return null;
        final totals = CheckoutTotals.of(
          lines,
          address.area,
          coupon: CheckoutFixtures.coupon(body['couponCode'] as String? ?? '')
              ?.toEntity(),
        );
        cart.clear();
        return OrderReceiptModel(
          number: 'WQ-${nextNumber++}',
          totalBdt: totals.totalBdt,
          itemCount: lines.itemCount,
          payment: PaymentMethod.values.byName(body['payment'] as String),
          needsDelivery: totals.needsDelivery,
          insideDhaka: address.district == 'Dhaka',
          hasPreorders: lines.lines.any((line) => line.isPreorder),
        ).toJson();
      },
    };
  }
}
