import '../core/network/fake_api_interceptor.dart';
import '../features/alerts/data/sources/alert_fake_api.dart';
import '../features/auth/data/sources/auth_fake_api.dart';
import '../features/cart/data/sources/cart_fake_api.dart';
import '../features/cart/data/sources/cart_fake_store.dart';
import '../features/catalog/data/sources/book_fake_api.dart';
import '../features/catalog/data/sources/book_questions_fake_api.dart';
import '../features/catalog/data/sources/collection_fake_api.dart';
import '../features/checkout/data/sources/checkout_fake_api.dart';
import '../features/checkout/data/sources/coupon_admin_fake_api.dart';
import '../features/checkout/data/sources/coupon_fake_store.dart';
import '../features/home/data/sources/ayah_fake_api.dart';
import '../features/home/data/sources/home_fake_api.dart';
import '../features/loyalty/data/sources/points_fake_api.dart';
import '../features/loyalty/data/sources/points_fake_store.dart';
import '../features/deals/data/sources/deals_fake_api.dart';
import '../features/donate/data/sources/donate_fake_api.dart';
import '../features/deals/data/sources/deals_fake_store.dart';
import '../features/orders/data/sources/order_admin_fake_api.dart';
import '../features/orders/data/sources/order_fake_api.dart';
import '../features/orders/data/sources/order_fake_store.dart';
import '../features/wallet/data/sources/wallet_fake_api.dart';
import '../features/wallet/data/sources/wallet_fake_store.dart';
import '../features/wishlist/data/sources/wishlist_fake_api.dart';

/// The composition root's route table for [FakeApiInterceptor]: one line per
/// feature. This is the only place allowed to import both `core/network` and
/// feature fake APIs — `core/` itself must never import a feature.
abstract final class FakeApiRoutes {
  static FakeApiInterceptor interceptor() {
    // Checkout turns the cart into an order and spends and earns points, the
    // cart prices flash sales and bundles, and staff change orders and
    // coupons, so these are shared.
    final deals = DealsFakeStore();
    final cart = CartFakeStore(deals: deals);
    final orders = OrderFakeStore();
    final coupons = CouponFakeStore();
    final points = PointsFakeStore();
    final wallet = WalletFakeStore();
    return FakeApiInterceptor({
      ...AuthFakeApi.routes,
      ...BookFakeApi.routes,
      ...BookQuestionsFakeApi.routes(),
      ...CollectionFakeApi.routes,
      ...AyahFakeApi.routes,
      ...HomeFakeApi.routes,
      ...CartFakeApi.routes(cart),
      ...WishlistFakeApi.routes(),
      ...AlertFakeApi.routes(),
      ...CheckoutFakeApi.routes(cart, orders, coupons, points, wallet),
      ...OrderFakeApi.routes(orders, points, wallet),
      ...PointsFakeApi.routes(points),
      ...OrderAdminFakeApi.routes(orders, wallet),
      ...CouponAdminFakeApi.routes(coupons),
      ...DealsFakeApi.routes(deals),
      ...DonateFakeApi.routes(orders),
      ...WalletFakeApi.routes(wallet),
    });
  }
}
