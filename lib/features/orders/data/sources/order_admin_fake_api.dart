import 'package:dio/dio.dart';

import '../../domain/entities/order_status.dart';
import 'order_fake_store.dart';

/// The Admin area's order endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. The real backend checks the caller is staff.
abstract final class OrderAdminFakeApi {
  /// Every order, newest first.
  static const String orders = '/admin/orders';

  /// Body: `{number, status}`, where status must be the order's next step.
  /// Answers the order, or `null` if that step isn't next any more.
  static const String advance = '/admin/orders/advance';

  /// Body: `{number, approve}`. Answers the order, or `null` if it has no
  /// waiting return.
  static const String decideReturn = '/admin/orders/return';

  static Map<String, Object? Function(RequestOptions)> routes(
    OrderFakeStore store,
  ) => {
    orders: (_) => [for (final order in store.all) order.toJson()],
    advance: (options) {
      final body = _body(options);
      return store
          .advance(
            body['number'] as String? ?? '',
            OrderStatus.values.byName(body['status'] as String),
          )
          ?.toJson();
    },
    decideReturn: (options) {
      final body = _body(options);
      return store
          .decideReturn(
            body['number'] as String? ?? '',
            approve: body['approve'] == true,
          )
          ?.toJson();
    },
  };

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};
}
