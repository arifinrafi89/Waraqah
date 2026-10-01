import 'package:go_router/go_router.dart';

import 'presentation/pages/auth_page.dart';

abstract final class AuthRoutes {
  static const String login = '/login';

  static final List<RouteBase> routes = [
    GoRoute(
      path: login,
      builder: (_, state) =>
          AuthPage(forgotPassword: state.uri.queryParameters['forgot'] == '1'),
    ),
  ];
}
