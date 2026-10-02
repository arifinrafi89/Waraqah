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
  static const String deleteAccount = '/auth/delete';

  /// A fresh table per fake backend: it remembers the name each sign-up
  /// typed until the code is verified.
  static Map<String, Object? Function(RequestOptions)> routes() {
    final names = <String, String>{};
    return {
      login: _login,
      google: _google,
      requestSignUpOtp: (options) {
        final body = _body(options);
        names[_contact(body)] = (body['name'] as String? ?? '').trim();
        return {'ok': true};
      },
      verifySignUpOtp: (options) {
        final body = _body(options);
        if (body['otp'] != AuthFixtures.demoOtp) return null;
        final contact = _contact(body);
        return AuthFixtures.signUp(contact, names[contact] ?? '');
      },
      requestPasswordReset: _acknowledge,
      resetPassword: (options) =>
          _body(options)['otp'] == AuthFixtures.demoOtp ? {'ok': true} : null,
      deleteAccount: _acknowledge,
    };
  }

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};

  static String _contact(Map<String, dynamic> body) =>
      (body['contact'] as String? ?? '').trim().toLowerCase();

  static Object _login(RequestOptions options) {
    final email = (_body(options)['email'] as String? ?? '').trim();
    return AuthFixtures.accountFor(email.toLowerCase());
  }

  static Object _google(RequestOptions options) =>
      AuthFixtures.accountFor('reader@waraqah.test');

  static Object _acknowledge(RequestOptions options) => {'ok': true};
}
