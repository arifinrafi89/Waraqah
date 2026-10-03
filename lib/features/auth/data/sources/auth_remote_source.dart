import 'package:dio/dio.dart';

import '../../domain/entities/auth_failure.dart';
import '../models/app_user_model.dart';
import 'auth_fake_api.dart';

/// Talks to `POST /auth/login`, answered by the `FakeApiInterceptor`
/// installed on `dioProvider` (see `app/fake_api_routes.dart`).
class AuthRemoteSource {
  AuthRemoteSource(this._dio);

  final Dio _dio;

  Future<AppUserModel> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      AuthFakeApi.login,
      data: {'email': email, 'password': password},
    );
    final data = response.data;
    if (data == null) throw AuthFailure.wrongCredentials;
    return AppUserModel.fromJson(data);
  }

  /// [idToken] is the Google ID token from `google_sign_in`; the real backend verifies it.
  /// The fake API ignores the body.
  Future<AppUserModel> signInWithGoogle({String? idToken}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      AuthFakeApi.google,
      data: {'idToken': ?idToken},
    );
    final data = response.data;
    if (data == null) throw AuthFailure.googleFailed;
    return AppUserModel.fromJson(data);
  }

  Future<void> requestSignUpOtp({
    required String name,
    required String contact,
    required String password,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      AuthFakeApi.requestSignUpOtp,
      data: {'name': name, 'contact': contact, 'password': password},
    );
    if (response.data == null) throw AuthFailure.signUpRefused;
  }

  Future<AppUserModel> verifySignUpOtp({
    required String contact,
    required String otp,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      AuthFakeApi.verifySignUpOtp,
      data: {'contact': contact, 'otp': otp},
    );
    final data = response.data;
    if (data == null) throw AuthFailure.wrongCode;
    return AppUserModel.fromJson(data);
  }

  Future<void> requestPasswordReset(String contact) async {
    await _dio.post<void>(
      AuthFakeApi.requestPasswordReset,
      data: {'contact': contact},
    );
  }

  Future<void> resetPassword({
    required String contact,
    required String otp,
    required String password,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      AuthFakeApi.resetPassword,
      data: {'contact': contact, 'otp': otp, 'password': password},
    );
    if (response.data == null) throw AuthFailure.wrongCode;
  }
}
