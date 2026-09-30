import 'package:dio/dio.dart';

import 'offers_fake_store.dart';

/// Offers' fake endpoint, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`.
abstract final class OffersFakeApi {
  /// The flash sale, bundles and pre-orders running now.
  static const String offers = '/offers';

  static Map<String, Object? Function(RequestOptions)> routes(
    OffersFakeStore store,
  ) => {offers: (_) => store.toModel().toJson()};
}
