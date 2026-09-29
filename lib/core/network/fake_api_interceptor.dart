import 'package:dio/dio.dart';

/// Answers requests from a route table instead of a real backend.
///
/// A known path waits ~900 ms (so shimmer skeletons still show) then resolves
/// with a 200 response; an unknown path rejects with 404. This lives in
/// `core/` and must not import any feature — the route table itself (which
/// does import feature fixtures) is wired up in the composition root.
class FakeApiInterceptor extends Interceptor {
  FakeApiInterceptor(this._routes);

  final Map<String, Object? Function(RequestOptions options)> _routes;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final route = _routes[options.path];
    if (route == null) {
      handler.reject(
        DioException(
          requestOptions: options,
          response: Response(requestOptions: options, statusCode: 404),
          type: DioExceptionType.badResponse,
        ),
      );
      return;
    }
    await Future<void>.delayed(const Duration(milliseconds: 900));
    handler.resolve(
      Response(requestOptions: options, data: route(options), statusCode: 200),
    );
  }
}
