import '../core/network/fake_api_interceptor.dart';
import '../features/alerts/data/sources/alert_fake_api.dart';
import '../features/auth/data/sources/auth_fake_api.dart';
import '../features/book_request/data/sources/book_request_fake_api.dart';
import '../features/cart/data/sources/cart_fake_api.dart';
import '../features/catalog/data/sources/book_fake_api.dart';
import '../features/catalog/data/sources/book_questions_fake_api.dart';
import '../features/catalog/data/sources/book_suggest_fake_api.dart';
import '../features/catalog/data/sources/booklist_fake_api.dart';
import '../features/catalog/data/sources/collection_fake_api.dart';
import '../features/catalog_admin/data/sources/catalog_admin_fake_api.dart';
import '../features/catalog_admin/data/sources/catalog_tools_fake_api.dart';
import '../features/checkout/data/sources/checkout_fake_api.dart';
import '../features/checkout/data/sources/coupon_admin_fake_api.dart';
import '../features/handled_sale/data/sources/handled_sale_fake_api.dart';
import '../features/home/data/sources/ayah_fake_api.dart';
import '../features/home/data/sources/home_fake_api.dart';
import '../features/loyalty/data/sources/points_fake_api.dart';
import '../features/deals/data/sources/deals_fake_api.dart';
import '../features/donate/data/sources/donate_fake_api.dart';
import '../features/inbox/data/sources/inbox_fake_api.dart';
import '../features/moderation/data/sources/moderation_fake_api.dart';
import '../features/notifications/data/sources/notification_fake_api.dart';
import '../features/orders/data/sources/order_admin_fake_api.dart';
import '../features/orders/data/sources/order_fake_api.dart';
import '../features/p2p/data/sources/p2p_fake_api.dart';
import '../features/profile/data/sources/profile_fake_api.dart';
import '../features/report/data/sources/report_fake_api.dart';
import '../features/scan/data/sources/scan_fake_api.dart';
import '../features/sell_back/data/sources/sell_back_fake_api.dart';
import '../features/wallet/data/sources/wallet_fake_api.dart';
import '../features/wishlist/data/sources/wishlist_fake_api.dart';
import 'fake_stores.dart';

/// The composition root's route table for [FakeApiInterceptor]: one line per
/// feature. This is the only place allowed to import both `core/network` and
/// feature fake APIs — `core/` itself must never import a feature.
abstract final class FakeApiRoutes {
  static FakeApiInterceptor interceptor() {
    final s = FakeStores();
    return FakeApiInterceptor({
      ...AuthFakeApi.routes(),
      ...ProfileFakeApi.routes(s.profile, s.addresses),
      ...NotificationFakeApi.routes(s.notifications),
      ...BookFakeApi.routes,
      ...BookSuggestFakeApi.routes,
      ...BookQuestionsFakeApi.routes(),
      ...CollectionFakeApi.routes,
      ...BooklistFakeApi.routes,
      ...CatalogAdminFakeApi.routes(s.catalogAdmin),
      ...CatalogToolsFakeApi.routes(s.catalogAdmin),
      ...AyahFakeApi.routes,
      ...HomeFakeApi.routes(() => s.catalogAdmin.seasonOverride),
      ...CartFakeApi.routes(s.cart),
      ...WishlistFakeApi.routes(),
      ...AlertFakeApi.routes(),
      ...CheckoutFakeApi.routes(
        s.cart,
        s.orders,
        s.coupons,
        s.points,
        s.wallet,
        s.addresses,
      ),
      ...OrderFakeApi.routes(s.orders, s.points, s.wallet, s.cart),
      ...PointsFakeApi.routes(s.points),
      ...OrderAdminFakeApi.routes(s.orders, s.wallet),
      ...CouponAdminFakeApi.routes(s.coupons),
      ...DealsFakeApi.routes(s.deals),
      ...DonateFakeApi.routes(s.orders),
      ...WalletFakeApi.routes(s.wallet),
      ...P2pFakeApi.routes(
        s.p2p,
        isBlocked: (id) => s.reports.isBlocked(id) || s.moderation.isBanned(id),
      ),
      ...InboxFakeApi.routes(s.inbox),
      ...ReportFakeApi.routes(s.reports),
      ...ModerationFakeApi.routes(s.moderation),
      ...ScanFakeApi.routes,
      ...BookRequestFakeApi.routes(s.bookRequests),
      ...HandledSaleFakeApi.routes(s.handledSales),
      ...SellBackFakeApi.routes(s.sellBack),
    });
  }
}
