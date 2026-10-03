import 'package:dio/dio.dart';

import 'dashboard_fake_store.dart';

/// The Admin dashboard's fake endpoint, merged into `FakeApiInterceptor`
/// by `app/fake_api_routes.dart`.
abstract final class DashboardFakeApi {
  /// Today's numbers, what's waiting, top searches and most requested.
  static const String dashboard = '/admin/dashboard';

  static Map<String, Object? Function(RequestOptions)> routes(
    DashboardFakeStore store,
  ) => {dashboard: (_) => store.json()};
}
