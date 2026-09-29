import 'package:go_router/go_router.dart';

import '../../features/ai_assistant/ai_assistant_routes.dart';
import '../../features/auth/auth_routes.dart';
import '../../features/bites/bites_routes.dart';
import '../../features/catalog/catalog_routes.dart';
import '../../features/home/home_routes.dart';
import '../../features/p2p/p2p_routes.dart';
import '../../features/profile/profile_routes.dart';
import '../shell/app_shell.dart';

/// The single GoRouter instance. It only assembles what the features export.
///
/// Auth sits outside the shell; the five tabs live inside a
/// [StatefulShellRoute] so each keeps its own navigation stack and scroll
/// position. The AI chat, add-listing and book detail pages push over the
/// shell as full-screen routes. Branch order must match `ShellTabs.paths`.
abstract final class AppRouter {
  static GoRouter create({required bool startSignedIn}) => GoRouter(
    initialLocation: startSignedIn ? HomeRoutes.home : AuthRoutes.login,
    routes: [
      ...AuthRoutes.routes,
      ...AiAssistantRoutes.routes,
      ...P2pRoutes.routes,
      ...CatalogRoutes.routes,
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
