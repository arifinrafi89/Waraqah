import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/ai_assistant/presentation/pages/ai_chat_page.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/bites/presentation/pages/bites_page.dart';
import '../../features/catalog/presentation/pages/catalog_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/p2p/presentation/pages/p2p_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../shell/app_shell.dart';
import 'app_routes.dart';

/// The single GoRouter instance.
///
/// Auth sits outside the shell; the five tabs live inside a
/// [StatefulShellRoute] so each keeps its own navigation stack and scroll
/// position. The AI chat pushes over the shell as a full-screen route.
abstract final class AppRouter {
  static GoRouter create({required bool startSignedIn}) => GoRouter(
    initialLocation: startSignedIn ? AppRoutes.home : AppRoutes.login,
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
