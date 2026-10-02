import '../features/alerts/data/sources/alert_fake_store.dart';
import '../features/bites/data/sources/bite_fake_store.dart';
import '../features/book_request/data/sources/book_request_fake_store.dart';
import '../features/cart/data/sources/cart_fake_store.dart';
import '../features/catalog_admin/data/sources/catalog_admin_fake_store.dart';
import '../features/checkout/data/sources/coupon_fake_store.dart';
import '../features/deals/data/sources/deals_fake_store.dart';
import '../features/handled_sale/data/sources/handled_sale_fake_store.dart';
import '../features/inbox/data/sources/inbox_fake_store.dart';
import '../features/loyalty/data/sources/points_fake_store.dart';
import '../features/moderation/data/sources/moderation_fake_store.dart';
import '../features/notifications/data/sources/notification_fake_store.dart';
import '../features/notifications/domain/entities/notification_kind.dart';
import '../features/profile/data/models/profile_prefs_model.dart';
import '../features/orders/data/sources/order_fake_store.dart';
import '../features/p2p/data/sources/p2p_fake_store.dart';
import '../features/p2p/data/sources/p2p_people.dart';
import '../features/profile/data/sources/address_fake_store.dart';
import '../features/profile/data/sources/profile_fake_store.dart';
import '../features/readers/data/sources/follow_fake_store.dart';
import '../features/report/data/sources/report_fake_store.dart';
import '../features/reviews/data/sources/review_fake_store.dart';
import '../features/sell_back/data/sources/sell_back_fake_store.dart';
import '../features/wallet/data/sources/wallet_fake_store.dart';

/// The fake backend's memory: one set per `FakeApiRoutes.interceptor()`, so
/// every test starts clean. Stores that several features change are built
/// here once and handed to each feature's routes.
class FakeStores {
  FakeStores() {
    // Staff price and stock changes can fire the reader's alerts.
    catalogAdmin.onChanged = alerts.sweep;
  }

  // Checkout turns the cart into an order and spends and earns points, the
  // cart prices flash sales and bundles, and staff change orders and
  // coupons, so these are shared.
  final deals = DealsFakeStore();
  late final cart = CartFakeStore(deals: deals);
  final orders = OrderFakeStore();
  final coupons = CouponFakeStore();
  final points = PointsFakeStore();
  final wallet = WalletFakeStore();

  /// The Reader's profile and saved addresses; checkout delivers to these.
  final profile = ProfileFakeStore();
  final addresses = AddressFakeStore();

  /// Other fake backends send notifications here; "me"'s muted groups come
  /// from Profile's settings.
  late final notifications = NotificationFakeStore(
    muted: (kind) => kind.group != null && profile.prefs.mutes(kind.group!),
  );

  // Offers in the inbox reserve and sell marketplace listings.
  final p2p = P2pFakeStore();
  late final inbox = InboxFakeStore(p2p);

  // Blocking a reader hides their listings from the marketplace.
  late final reports = ReportFakeStore(p2p);

  // Feeds leave out blocked and banned readers; a banned "me" can't post.
  // Following shows who "me" follows; authors hear about comments.
  late final BiteFakeStore bites = BiteFakeStore(
    isHidden: (id) => reports.isBlocked(id) || moderation.isBanned(id),
    isBanned: (id) => moderation.isBanned(id),
    follows: (id) => follows.follows(P2pPeople.me, id),
    notifications: notifications,
  );

  /// Blocked readers can't be followed; the followed reader is told.
  late final follows = FollowFakeStore(
    notifications: notifications,
    isBlocked: reports.isBlocked,
  );

  // Verified Purchase reads orders; a banned "me" can't review.
  late final ReviewFakeStore reviews = ReviewFakeStore(
    orders,
    isBanned: (id) => moderation.isBanned(id),
  );

  // Moderators approve listings, act on reports, delete removed Bites,
  // comments and reviews, and ban readers.
  late final moderation = ModerationFakeStore(
    p2p,
    reports,
    inbox: inbox,
    bites: bites,
    reviews: reviews,
    notifications: notifications,
  );

  // Staff edit the catalog's and Home's fixture lists in place, and can
  // force Home's Season.
  final catalogAdmin = CatalogAdminFakeStore();

  // Requests are matched against marketplace Listings.
  late final bookRequests = BookRequestFakeStore(
    p2p,
    notifications: notifications,
  );

  // Handled sales hold money, refund into the wallet and log moderators'
  // decisions.
  late final handledSales = HandledSaleFakeStore(
    p2p,
    wallet,
    moderation: moderation,
    notifications: notifications,
  );

  // Sell Back pays into the wallet and stocks Certified Used.
  late final sellBack = SellBackFakeStore(wallet, notifications: notifications);

  /// Price and stock alerts notify the reader when they first fire.
  late final alerts = AlertFakeStore(notifications);
}
