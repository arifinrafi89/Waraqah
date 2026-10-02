import 'package:dio/dio.dart';

// The fake backend sees the cart, like the real server will.
import '../../../cart/data/models/cart_model.dart';
import '../../../cart/data/sources/cart_fake_store.dart';
import '../../../cart/domain/entities/cart.dart';
import '../../../loyalty/data/sources/points_fake_store.dart';
import '../../../orders/data/models/order_parts_model.dart';
// Orders go to one of the Reader's saved addresses, kept by Profile.
import '../../../profile/data/models/saved_address_model.dart';
import '../../../profile/data/sources/address_fake_store.dart';
import '../../../profile/domain/entities/saved_address.dart';
import '../../../orders/data/sources/order_fake_store.dart';
import '../../../wallet/data/sources/wallet_fake_store.dart';
import '../../domain/entities/checkout_totals.dart';
import '../../domain/entities/payment_method.dart';
import '../models/coupon_model.dart';
import '../models/order_receipt_model.dart';
import 'coupon_fake_store.dart';
import 'placed_order.dart';

/// Checkout's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`, sharing the fake cart, orders, coupons and
/// points.
abstract final class CheckoutFakeApi {
  /// `?code=EID100`; answers the coupon or `null`.
  static const String coupon = '/coupons/check';

  /// Body: `{addressId, payment, couponCode?, usePoints, useWallet, gift?}`.
  /// Works out the totals the same way the app does, spends the wallet,
  /// saves the order, empties the cart and answers a receipt; `null` when
  /// the cart is empty, the address unknown or a gift has no name.
  static const String placeOrder = '/orders/place';

  static Map<String, Object? Function(RequestOptions)> routes(
    CartFakeStore cart,
    OrderFakeStore orders,
    CouponFakeStore coupons,
    PointsFakeStore points,
    WalletFakeStore wallet,
    AddressFakeStore addresses,
  ) {
    return {
      coupon: (options) => coupons
          .find(options.queryParameters['code'] as String? ?? '')
          ?.toJson(),
      placeOrder: (options) {
        final body = options.data as Map<String, dynamic>? ?? const {};
        final address = addresses
            .find(body['addressId'] as String? ?? '')
            ?.toEntity();
        final lines = CartModel.fromJson(cart.toJson()).toEntity();
        final giftJson = body['gift'] as Map<String, dynamic>?;
        final gift = giftJson == null
            ? null
            : OrderGiftModel.fromJson(giftJson);
        if (address == null || lines.isEmpty) return null;
        if (gift != null && gift.recipientName.isEmpty) return null;
        final totals = CheckoutTotals.of(
          lines,
          address.area,
          // An expired code simply gives no discount.
          coupon: coupons
              .usable(body['couponCode'] as String? ?? '')
              ?.toEntity(),
          pointsBalance: points.balance,
          usePoints: body['usePoints'] == true,
          giftWrap: gift?.wrapped ?? false,
          walletBalance: wallet.balance,
          useWallet: body['useWallet'] == true,
        );
        final number = orders.nextNumber();
        final order = placedOrder(
          number: number,
          at: orders.now(),
          cart: lines,
          address: address,
          totals: totals,
          payment: PaymentMethod.values.byName(body['payment'] as String),
          gift: totals.needsDelivery ? gift : null,
          pointsUsed: points.spend(
            number,
            totals.pointsDiscountBdt,
            booksBdt: totals.subtotalBdt - totals.couponOnBooksBdt,
          ),
          pointsEarned: points.earn(number, totals.booksPaidBdt),
          walletUsed: wallet.spend(number, totals.walletBdt),
        );
        orders.add(order);
        cart.clear();
        return OrderReceiptModel(
          number: order.number,
          totalBdt: totals.totalBdt,
          itemCount: lines.itemCount,
          payment: order.payment,
          needsDelivery: totals.needsDelivery,
          insideDhaka: address.district == 'Dhaka',
          hasPreorders: lines.lines.any((line) => line.isPreorder),
          pointsEarned: order.pointsEarned,
          giftFor: order.gift?.recipientName,
          walletUsedBdt: order.walletUsedBdt,
        ).toJson();
      },
    };
  }
}
