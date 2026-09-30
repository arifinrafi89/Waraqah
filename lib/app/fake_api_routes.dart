import '../core/network/fake_api_interceptor.dart';
import '../features/auth/data/sources/auth_fake_api.dart';
import '../features/cart/data/sources/cart_fake_api.dart';
import '../features/cart/data/sources/cart_fake_store.dart';
import '../features/catalog/data/sources/book_fake_api.dart';
import '../features/checkout/data/sources/checkout_fake_api.dart';
import '../features/home/data/sources/ayah_fake_api.dart';
import '../features/wishlist/data/sources/wishlist_fake_api.dart';

/// The composition root's route table for [FakeApiInterceptor]: one line per
/// feature. This is the only place allowed to import both `core/network` and
/// feature fake APIs — `core/` itself must never import a feature.
abstract final class FakeApiRoutes {
  static FakeApiInterceptor interceptor() {
    // Checkout turns this cart into an order, so both share it.
    final cart = CartFakeStore();
    return FakeApiInterceptor({
      ...AuthFakeApi.routes,
      ...BookFakeApi.routes,
      ...AyahFakeApi.routes,
      ...CartFakeApi.routes(cart),
      ...WishlistFakeApi.routes(),
      ...CheckoutFakeApi.routes(cart),
    });
  }
}
