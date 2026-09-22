/// Every route path and name in one place, so no widget hard-codes a string.
abstract final class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String catalog = '/catalog';
  static const String p2p = '/p2p';
  static const String bites = '/bites';
  static const String profile = '/profile';
  static const String aiChat = '/ai-chat';
}

abstract final class RouteNames {
  static const String login = 'login';
  static const String home = 'home';
  static const String catalog = 'catalog';
  static const String p2p = 'p2p';
  static const String bites = 'bites';
  static const String profile = 'profile';
  static const String aiChat = 'aiChat';
}

/// Order of the branches inside the shell — the bottom nav reads this.
abstract final class ShellTabs {
  static const List<String> paths = [
    AppRoutes.home,
    AppRoutes.catalog,
    AppRoutes.p2p,
    AppRoutes.bites,
    AppRoutes.profile,
  ];
}
