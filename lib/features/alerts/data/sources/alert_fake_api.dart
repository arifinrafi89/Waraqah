import 'package:dio/dio.dart';

import 'alert_fake_store.dart';

/// Alerts' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Each alert is checked against the catalog
/// every time it's read, the way the real server's job will check it.
abstract final class AlertFakeApi {
  static const String alerts = '/alerts';

  /// Body: `{kind, bookId, editionId, targetPriceBdt?}`.
  static const String set = '/alerts/set';

  /// Body: `{id}`.
  static const String remove = '/alerts/remove';

  /// Answers from [store], built once per interceptor, so every test starts
  /// clean.
  static Map<String, Object? Function(RequestOptions)> routes(
    AlertFakeStore store,
  ) {
    List<Object?> answer() => [for (final alert in store.all()) alert.toJson()];
    return {
      alerts: (_) => answer(),
      set: (options) {
        store.set(options.data as Map<String, dynamic>);
        return answer();
      },
      remove: (options) {
        store.remove((options.data as Map)['id'] as String? ?? '');
        return answer();
      },
    };
  }
}
