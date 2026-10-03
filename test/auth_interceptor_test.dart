import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/network/auth_interceptor.dart';
import 'package:waraqah/core/network/session_tokens.dart';

class _Tokens implements SessionTokens {
  _Tokens(this.accessToken, {this.next});

  @override
  String? accessToken;
  String? next;
  int refreshes = 0;

  @override
  Future<String?> refresh() async {
    refreshes++;
    accessToken = next;
    return next;
  }
}

/// A server that accepts only "Bearer good".
class _Server implements HttpClientAdapter {
  final List<String?> seen = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final auth = options.headers['Authorization'] as String?;
    seen.add(auth);
    final ok = auth == 'Bearer good';
    return ResponseBody.fromString(
      jsonEncode({'ok': ok}),
      ok ? 200 : 401,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Dio _dio(_Tokens tokens, _Server server) {
  final dio = Dio(BaseOptions(baseUrl: 'http://api.test/v1'))
    ..httpClientAdapter = server;
  dio.interceptors.add(AuthInterceptor(tokens, dio));
  return dio;
}

void main() {
  test('a guest sends no Authorization header', () async {
    final server = _Server();
    final dio = _dio(_Tokens(null), server)
      ..options.validateStatus = (_) => true;
    await dio.get<dynamic>('/cart');
    expect(server.seen, [null]);
  });

  test('a 401 refreshes once and retries with the new token', () async {
    final tokens = _Tokens('stale', next: 'good');
    final server = _Server();
    final response = await _dio(tokens, server).get<dynamic>('/cart');
    expect(response.statusCode, 200);
    expect(tokens.refreshes, 1);
    expect(server.seen, ['Bearer stale', 'Bearer good']);
  });

  test('requests that fail together share one refresh', () async {
    final tokens = _Tokens('stale', next: 'good');
    final server = _Server();
    final dio = _dio(tokens, server);
    final results = await Future.wait([
      dio.get<dynamic>('/cart'),
      dio.get<dynamic>('/orders'),
      dio.get<dynamic>('/wallet'),
    ]);
    expect(results.map((r) => r.statusCode), [200, 200, 200]);
    expect(tokens.refreshes, 1);
  });

  test('when refreshing fails the 401 is passed on', () async {
    final tokens = _Tokens('stale'); // refresh answers null
    final server = _Server();
    await expectLater(
      _dio(tokens, server).get<dynamic>('/cart'),
      throwsA(
        isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status',
          401,
        ),
      ),
    );
    expect(tokens.refreshes, 1);
    expect(server.seen, ['Bearer stale']);
  });

  test('a retried request that fails again is not retried forever', () async {
    final tokens = _Tokens('stale', next: 'still-bad');
    final server = _Server();
    await expectLater(
      _dio(tokens, server).get<dynamic>('/cart'),
      throwsA(isA<DioException>()),
    );
    expect(tokens.refreshes, 1);
    expect(server.seen.length, 2);
  });

  test('a guest 401 is not refreshed', () async {
    final tokens = _Tokens(null, next: 'good');
    final server = _Server();
    await expectLater(
      _dio(tokens, server).get<dynamic>('/cart'),
      throwsA(isA<DioException>()),
    );
    expect(tokens.refreshes, 0);
  });
}
