import 'package:go_router/go_router.dart';

import 'presentation/pages/wallet_page.dart';

abstract final class WalletRoutes {
  /// Signed-in only (see `RouteAccess.signedInOnly`).
  static const String wallet = '/wallet';

  static final List<RouteBase> routes = [
    GoRoute(path: wallet, builder: (_, _) => const WalletPage()),
  ];
}
