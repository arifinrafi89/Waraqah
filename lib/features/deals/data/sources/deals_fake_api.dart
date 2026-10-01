import 'package:dio/dio.dart';

import 'deals_fake_store.dart';

/// Deals' fake endpoint, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`.
abstract final class DealsFakeApi {
  /// The flash sale, bundles and pre-orders running now.
  static const String deals = '/deals';

  static Map<String, Object? Function(RequestOptions)> routes(
    DealsFakeStore store,
  ) => {deals: (_) => store.toModel().toJson()};
}
