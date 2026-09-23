import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'supabase_client.dart';

/// Provider exposing the configured Dio HTTP client for the Go API.
final dioClientProvider = Provider<Dio>((ref) {
  final baseUrl = dotenv.get(
    'GO_API_BASE_URL',
    fallback: 'http://localhost:8080/api/v1',
  );

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = SupabaseClientWrapper.currentAccessToken;
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException error, handler) {
        return handler.next(error);
      },
    ),
  );

  return dio;
});
