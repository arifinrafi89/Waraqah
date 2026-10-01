import 'package:dio/dio.dart';

import 'auth_fixtures.dart';

/// Auth's fake endpoints: paths and fixture handlers, merged into
/// `FakeApiInterceptor` by `app/fake_api_routes.dart`.
abstract final class AuthFakeApi {
  static const String login = '/auth/login';
  static const String google = '/auth/google';
  static const String requestSignUpOtp = '/auth/signup/request-otp';
  static const String verifySignUpOtp = '/auth/signup/verify-otp';
  static const String requestPasswordReset = '/auth/password/request-otp';
  static const String resetPassword = '/auth/password/reset';

  static final Map<String, Object? Function(RequestOptions)> routes = {
    login: _login,
    google: _google,
    requestSignUpOtp: _acknowledge,
    verifySignUpOtp: _verifySignUpOtp,
    requestPasswordReset: _acknowledge,
    resetPassword: _acknowledge,
  };

  static Object _login(RequestOptions options) {
    final body = options.data as Map<String, dynamic>? ?? const {};
    final email = (body['email'] as String? ?? '').trim().toLowerCase();
    return AuthFixtures.accountFor(email);
  }

  static Object _google(RequestOptions options) =>
      AuthFixtures.accountFor('reader@waraqah.test');

  static Object _acknowledge(RequestOptions options) => {'ok': true};

  static Object _verifySignUpOtp(RequestOptions options) {
    final body = options.data as Map<String, dynamic>? ?? const {};
    final contact = (body['contact'] as String? ?? '').trim().toLowerCase();
    return AuthFixtures.accountFor(
      contact.contains('@') ? contact : 'reader@waraqah.test',
    );
  }
}
