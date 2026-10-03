import 'package:dio/dio.dart';

import 'session_tokens.dart';

/// Sends the access token with every request, and on a `401` refreshes it once and retries.
///
/// Requests that fail together share one refresh. A request that fails again after the retry is
/// passed on as it is. (Not a `QueuedInterceptor`: retrying through the same client from inside
/// its own queue would wait for itself.)
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokens, this._dio);

  final SessionTokens _tokens;

  /// The client to retry on (it carries this interceptor and the base URL).
  final Dio _dio;

  static const String _retried = 'authRetried';

  Future<String?>? _refreshing;

  Future<String?> _refreshOnce() =>
      _refreshing ??= _tokens.refresh().whenComplete(() => _refreshing = null);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _tokens.accessToken;
    if (token != null) options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;
    final refusable =
        err.response?.statusCode == 401 &&
        request.extra[_retried] != true &&
        request.path != '/auth/refresh' &&
        _tokens.accessToken != null;
    if (!refusable) return handler.next(err);

    // Another request may already have refreshed since this one was sent.
    var token = _tokens.accessToken;
    if ('Bearer $token' == request.headers['Authorization']) {
      token = await _refreshOnce();
    }
    if (token == null) return handler.next(err);

    request.headers['Authorization'] = 'Bearer $token';
    request.extra[_retried] = true;
    try {
      handler.resolve(await _dio.fetch<dynamic>(request));
    } on DioException catch (e) {
      handler.next(e);
    }
  }
}
