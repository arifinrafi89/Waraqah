import 'package:dio/dio.dart';

import 'banner_fixtures.dart';

/// Home's own fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`.
abstract final class HomeFakeApi {
  /// Every Banner, in display order.
  static const String banners = '/home/banners';

  static final Map<String, Object? Function(RequestOptions)> routes = {
    banners: (_) => [for (final b in BannerFixtures.all) b.toJson()],
  };
}
