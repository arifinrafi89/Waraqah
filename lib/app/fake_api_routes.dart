import '../core/network/fake_api_interceptor.dart';
import '../features/alerts/data/sources/alert_fake_api.dart';
import '../features/auth/data/sources/auth_fake_api.dart';
import '../features/cart/data/sources/cart_fake_api.dart';
import '../features/cart/data/sources/cart_fake_store.dart';
import '../features/catalog/data/sources/book_fake_api.dart';
import '../features/catalog/data/sources/book_questions_fake_api.dart';
import '../features/checkout/data/sources/checkout_fake_api.dart';
import '../features/checkout/data/sources/coupon_admin_fake_api.dart';
import '../features/checkout/data/sources/coupon_fake_store.dart';
import '../features/home/data/sources/ayah_fake_api.dart';
import '../features/offers/data/sources/offers_fake_api.dart';
import '../features/offers/data/sources/offers_fake_store.dart';
import '../features/orders/data/sources/order_admin_fake_api.dart';
import '../features/orders/data/sources/order_fake_api.dart';
import '../features/orders/data/sources/order_fake_store.dart';
import '../features/wishlist/data/sources/wishlist_fake_api.dart';

/// The composition root's route table for [FakeApiInterceptor]: one line per
/// feature. This is the only place allowed to import both `core/network` and
/// feature fake APIs — `core/` itself must never import a feature.
abstract final class FakeApiRoutes {
  static FakeApiInterceptor interceptor() {
    // Checkout turns the cart into an order, the cart prices flash sales and
    // bundles, and staff change orders and coupons, so these are shared.
    final offers = OffersFakeStore();
    final cart = CartFakeStore(offers: offers);
    final orders = OrderFakeStore();
    final coupons = CouponFakeStore();
    return FakeApiInterceptor({
      ...AuthFakeApi.routes,
      ...BookFakeApi.routes,
      ...BookQuestionsFakeApi.routes(),
      ...AyahFakeApi.routes,
      ...CartFakeApi.routes(cart),
      ...WishlistFakeApi.routes(),
      ...AlertFakeApi.routes(),
      ...CheckoutFakeApi.routes(cart, orders, coupons),
      ...OrderFakeApi.routes(orders),
      ...OrderAdminFakeApi.routes(orders),
      ...CouponAdminFakeApi.routes(coupons),
      ...OffersFakeApi.routes(offers),
    });
  }
}
