import 'package:dio/dio.dart';

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
    return AppUserModel.fromJson(response.data!);
  }

  Future<AppUserModel> signInWithGoogle() async {
    final response = await _dio.post<Map<String, dynamic>>(AuthFakeApi.google);
    return AppUserModel.fromJson(response.data!);
  }

  Future<void> requestSignUpOtp({
    required String name,
    required String contact,
    required String password,
  }) async {
    await _dio.post<void>(
      AuthFakeApi.requestSignUpOtp,
      data: {'name': name, 'contact': contact, 'password': password},
    );
  }

  Future<AppUserModel> verifySignUpOtp({
    required String contact,
    required String otp,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      AuthFakeApi.verifySignUpOtp,
      data: {'contact': contact, 'otp': otp},
    );
    return AppUserModel.fromJson(response.data!);
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
    await _dio.post<void>(
      AuthFakeApi.resetPassword,
      data: {'contact': contact, 'otp': otp, 'password': password},
    );
  }
}
