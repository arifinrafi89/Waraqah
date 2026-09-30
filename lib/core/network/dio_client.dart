import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'api_config.dart';
import 'api_exception.dart';

/// Single configured [Dio] instance for the whole app.
///
/// Logging and error mapping are attached here as interceptors so no feature
/// ever constructs its own client or repeats the base URL.
abstract final class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.timeout,
        receiveTimeout: ApiConfig.timeout,
        headers: const {'Accept': 'application/json'},
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor());
    }
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          handler.next(
            DioException(
              requestOptions: error.requestOptions,
              error: ApiException(
                error.message ?? 'Request failed',
                statusCode: error.response?.statusCode,
              ),
              type: error.type,
            ),
          );
        },
      ),
    );
    return dio;
  }
}
