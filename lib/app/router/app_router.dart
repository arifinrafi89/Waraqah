import 'package:flutter/foundation.dart' show ValueListenable;
import 'package:go_router/go_router.dart';

import '../../features/admin/admin_routes.dart';
import '../../features/ai_assistant/ai_assistant_routes.dart';
import '../../features/alerts/alerts_routes.dart';
import '../../features/auth/auth_routes.dart';
import '../../features/auth/domain/entities/app_user.dart';
import '../../features/bites/bites_routes.dart';
import '../../features/cart/cart_routes.dart';
import '../../features/catalog/catalog_routes.dart';
import '../../features/checkout/checkout_routes.dart';
import '../../features/home/home_routes.dart';
import '../../features/loyalty/loyalty_routes.dart';
import '../../features/offers/offers_routes.dart';
import '../../features/orders/orders_routes.dart';
import '../../features/p2p/p2p_routes.dart';
import '../../features/profile/profile_routes.dart';
import '../../features/wishlist/wishlist_routes.dart';
import '../shell/app_shell.dart';
import 'route_access.dart';

/// The single GoRouter instance. It only assembles what the features export.
///
/// Auth sits outside the shell; the five tabs live inside a
/// [StatefulShellRoute] so each keeps its own navigation stack and scroll
/// position. The AI chat, add-listing and book detail pages push over the
/// shell as full-screen routes, and so does the
/// staff-only Admin area. Branch order must match `ShellTabs.paths`.
///
/// With a [session], every navigation goes through [RouteAccess], and the
/// router re-checks whenever the session changes. The app always passes one
/// (see `routerProvider`); tests can leave it out.
abstract final class AppRouter {
  static GoRouter create({
    bool startSignedIn = false,
    ValueListenable<AppUser?>? session,
  }) => GoRouter(
    initialLocation: (startSignedIn || session?.value != null)
        ? HomeRoutes.home
        : AuthRoutes.login,
    refreshListenable: session,
    redirect: session == null
        ? null
        : (_, state) => RouteAccess.redirect(state.uri.path, session.value),
    routes: [
      ...AuthRoutes.routes,
      ...AiAssistantRoutes.routes,
      ...P2pRoutes.routes,
      ...CatalogRoutes.routes,
      ...CartRoutes.routes,
      ...WishlistRoutes.routes,
      ...CheckoutRoutes.routes,
      ...OrdersRoutes.routes,
      ...AlertsRoutes.routes,
      ...OffersRoutes.routes,
      ...LoyaltyRoutes.routes,
      ...AdminRoutes.routes,
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) => AppShell(shell: shell),
        branches: [
          HomeRoutes.branch,
          CatalogRoutes.branch,
          P2pRoutes.branch,
          BitesRoutes.branch,
          ProfileRoutes.branch,
        ],
      ),
    ],
  );
}
