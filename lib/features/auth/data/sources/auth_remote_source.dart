import 'package:dio/dio.dart';

import '../../../../core/network/api_config.dart';
import '../models/app_user_model.dart';

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
      ApiRoutes.authLogin,
      data: {'email': email, 'password': password},
    );
    return AppUserModel.fromJson(response.data!);
  }
}
