import 'package:dio/dio.dart';

import 'api_config.dart';

/// Single configured [Dio] instance for the whole app.
///
/// Auth tokens and logging are attached here as interceptors so no feature ever
/// constructs its own client or repeats the base URL.
abstract final class DioClient {
  static Dio create({String? authToken}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.timeout,
        receiveTimeout: ApiConfig.timeout,
        headers: const {'Accept': 'application/json'},
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (authToken != null) {
            options.headers['Authorization'] = 'Bearer $authToken';
          }
          handler.next(options);
        },
      ),
    );
    return dio;
  }
}
