import '../core/network/fake_api_interceptor.dart';
import '../features/alerts/data/sources/alert_fake_api.dart';
import '../features/auth/data/sources/auth_fake_api.dart';
import '../features/book_request/data/sources/book_request_fake_api.dart';
import '../features/book_request/data/sources/book_request_fake_store.dart';
import '../features/cart/data/sources/cart_fake_api.dart';
import '../features/cart/data/sources/cart_fake_store.dart';
import '../features/catalog/data/sources/book_fake_api.dart';
import '../features/catalog/data/sources/book_questions_fake_api.dart';
import '../features/catalog/data/sources/book_suggest_fake_api.dart';
import '../features/catalog/data/sources/booklist_fake_api.dart';
import '../features/catalog/data/sources/collection_fake_api.dart';
import '../features/catalog_admin/data/sources/catalog_admin_fake_api.dart';
import '../features/catalog_admin/data/sources/catalog_admin_fake_store.dart';
import '../features/catalog_admin/data/sources/catalog_tools_fake_api.dart';
import '../features/checkout/data/sources/checkout_fake_api.dart';
import '../features/checkout/data/sources/coupon_admin_fake_api.dart';
import '../features/checkout/data/sources/coupon_fake_store.dart';
import '../features/handled_sale/data/sources/handled_sale_fake_api.dart';
import '../features/handled_sale/data/sources/handled_sale_fake_store.dart';
import '../features/home/data/sources/ayah_fake_api.dart';
import '../features/home/data/sources/home_fake_api.dart';
import '../features/loyalty/data/sources/points_fake_api.dart';
import '../features/loyalty/data/sources/points_fake_store.dart';
import '../features/deals/data/sources/deals_fake_api.dart';
import '../features/donate/data/sources/donate_fake_api.dart';
import '../features/deals/data/sources/deals_fake_store.dart';
import '../features/inbox/data/sources/inbox_fake_api.dart';
import '../features/inbox/data/sources/inbox_fake_store.dart';
import '../features/moderation/data/sources/moderation_fake_api.dart';
import '../features/moderation/data/sources/moderation_fake_store.dart';
import '../features/orders/data/sources/order_admin_fake_api.dart';
import '../features/orders/data/sources/order_fake_api.dart';
import '../features/orders/data/sources/order_fake_store.dart';
import '../features/p2p/data/sources/p2p_fake_api.dart';
import '../features/p2p/data/sources/p2p_fake_store.dart';
import '../features/report/data/sources/report_fake_api.dart';
import '../features/scan/data/sources/scan_fake_api.dart';
import '../features/sell_back/data/sources/sell_back_fake_api.dart';
import '../features/sell_back/data/sources/sell_back_fake_store.dart';
import '../features/report/data/sources/report_fake_store.dart';
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
    // Offers in the inbox reserve and sell marketplace listings.
    final p2p = P2pFakeStore();
    final inbox = InboxFakeStore(p2p);
    // Blocking a reader hides their listings from the marketplace.
    final reports = ReportFakeStore(p2p);
    // Moderators approve listings, act on reports and ban readers.
    final moderation = ModerationFakeStore(p2p, reports, inbox: inbox);
    // Staff edit the catalog's and Home's fixture lists in place, and can
    // force Home's Season.
    final catalogAdmin = CatalogAdminFakeStore();
    return FakeApiInterceptor({
      ...AuthFakeApi.routes,
      ...BookFakeApi.routes,
      ...BookSuggestFakeApi.routes,
      ...BookQuestionsFakeApi.routes(),
      ...CollectionFakeApi.routes,
      ...BooklistFakeApi.routes,
      ...CatalogAdminFakeApi.routes(catalogAdmin),
      ...CatalogToolsFakeApi.routes(catalogAdmin),
      ...AyahFakeApi.routes,
      ...HomeFakeApi.routes(() => catalogAdmin.seasonOverride),
      ...CartFakeApi.routes(cart),
      ...WishlistFakeApi.routes(),
      ...AlertFakeApi.routes(),
      ...CheckoutFakeApi.routes(cart, orders, coupons, points, wallet),
      ...OrderFakeApi.routes(orders, points, wallet, cart),
      ...PointsFakeApi.routes(points),
      ...OrderAdminFakeApi.routes(orders, wallet),
      ...CouponAdminFakeApi.routes(coupons),
      ...DealsFakeApi.routes(deals),
      ...DonateFakeApi.routes(orders),
      ...WalletFakeApi.routes(wallet),
      ...P2pFakeApi.routes(
        p2p,
        isBlocked: (id) => reports.isBlocked(id) || moderation.isBanned(id),
      ),
      ...InboxFakeApi.routes(inbox),
      ...ReportFakeApi.routes(reports),
      ...ModerationFakeApi.routes(moderation),
      ...ScanFakeApi.routes,
      // Requests are matched against marketplace Listings.
      ...BookRequestFakeApi.routes(BookRequestFakeStore(p2p)),
      // Handled sales hold money, refund into the wallet and log
      // moderators' decisions.
      ...HandledSaleFakeApi.routes(
        HandledSaleFakeStore(p2p, wallet, moderation: moderation),
      ),
      // Sell Back pays into the wallet and stocks Certified Used.
      ...SellBackFakeApi.routes(SellBackFakeStore(wallet)),
    });
  }
}
