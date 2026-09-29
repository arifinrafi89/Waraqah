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
}
