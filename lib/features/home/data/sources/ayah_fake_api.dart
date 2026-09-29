import 'package:dio/dio.dart';

import 'ayah_fixtures.dart';

/// Home's fake endpoints: paths and fixture handlers, merged into
/// `FakeApiInterceptor` by `app/fake_api_routes.dart`.
abstract final class AyahFakeApi {
  static const String ayahOfTheDay = '/islamic/ayah-of-the-day';

  static final Map<String, Object? Function(RequestOptions)> routes = {
    ayahOfTheDay: (_) => AyahFixtures.forDate(DateTime.now()).toJson(),
  };
}
