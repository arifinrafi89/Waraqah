import 'package:flutter/foundation.dart' show ValueListenable;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/entities/app_user.dart';

import '../../features/ai_assistant/presentation/pages/ai_chat_page.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/bites/presentation/pages/bites_page.dart';
import '../../features/catalog/presentation/pages/book_detail_page.dart';
import '../../features/catalog/presentation/pages/catalog_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/p2p/presentation/pages/p2p_add_listing_page.dart';
import '../../features/p2p/presentation/pages/p2p_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../shell/app_shell.dart';
import 'app_routes.dart';
import 'route_access.dart';

/// The single GoRouter instance.
///
/// Auth sits outside the shell; the five tabs live inside a
/// [StatefulShellRoute] so each keeps its own navigation stack and scroll
/// position. The AI chat, add-listing and book detail pages push over the
/// shell as full-screen routes.
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
        ? AppRoutes.home
        : AppRoutes.login,
    refreshListenable: session,
    redirect: session == null
        ? null
        : (_, state) => RouteAccess.redirect(state.uri.path, session.value),
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: RouteNames.login,
        builder: (_, _) => const AuthPage(),
      ),
      GoRoute(
        path: AppRoutes.aiChat,
        name: RouteNames.aiChat,
        builder: (_, _) => const AiChatPage(),
      ),
      GoRoute(
        path: AppRoutes.p2pAddListing,
        name: RouteNames.p2pAddListing,
        builder: (_, _) => const P2pAddListingPage(),
      ),
      GoRoute(
        path: AppRoutes.bookDetail,
        name: RouteNames.bookDetail,
        builder: (_, state) =>
            BookDetailPage(bookId: state.pathParameters['id']!),
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) => AppShell(shell: shell),
        branches: [
          _branch(AppRoutes.home, RouteNames.home, const HomePage()),
          _branch(AppRoutes.catalog, RouteNames.catalog, const CatalogPage()),
          _branch(AppRoutes.p2p, RouteNames.p2p, const P2pPage()),
          _branch(AppRoutes.bites, RouteNames.bites, const BitesPage()),
          _branch(AppRoutes.profile, RouteNames.profile, const ProfilePage()),
        ],
      ),
    ],
  );

  static StatefulShellBranch _branch(String path, String name, Widget page) =>
      StatefulShellBranch(
        routes: [GoRoute(path: path, name: name, builder: (_, _) => page)],
      );
}
