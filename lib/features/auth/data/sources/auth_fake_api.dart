import 'package:dio/dio.dart';

import 'auth_fixtures.dart';

/// Auth's fake endpoints: paths and fixture handlers, merged into
/// `FakeApiInterceptor` by `app/fake_api_routes.dart`.
abstract final class AuthFakeApi {
  static const String login = '/auth/login';

  static final Map<String, Object? Function(RequestOptions)> routes = {
    login: _login,
  };

  static Object _login(RequestOptions options) {
    final body = options.data as Map<String, dynamic>? ?? const {};
    final email = (body['email'] as String? ?? '').trim().toLowerCase();
    return AuthFixtures.accountFor(email);
  }
}
