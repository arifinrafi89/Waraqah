import 'package:dio/dio.dart';

import 'points_fake_store.dart';

/// Points' fake endpoint, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Checkout and orders change the same store.
abstract final class PointsFakeApi {
  /// The balance and its history, newest first.
  static const String points = '/points';

  static Map<String, Object? Function(RequestOptions)> routes(
    PointsFakeStore store,
  ) => {points: (_) => store.toModel().toJson()};
}
