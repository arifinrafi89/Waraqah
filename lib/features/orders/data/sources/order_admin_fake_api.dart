import 'package:dio/dio.dart';

// Refunds go to the reader's wallet on the fake backend, and the reader
// hears about every change.
import '../../../notifications/data/sources/notification_fake_store.dart';
import '../../../notifications/data/sources/notification_sends.dart';
import '../../../wallet/data/sources/wallet_fake_store.dart';
import '../../../wallet/domain/entities/wallet.dart';
import '../../domain/entities/order_refunds.dart';
import '../../domain/entities/order_status.dart';
import '../models/order_model.dart';
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
  /// waiting return. Approving refunds the books to the reader's wallet.
  static const String decideReturn = '/admin/orders/return';

  static Map<String, Object? Function(RequestOptions)> routes(
    OrderFakeStore store,
    WalletFakeStore wallet,
    NotificationFakeStore notifications,
  ) => {
    orders: (_) => [for (final order in store.all) order.toJson()],
    advance: (options) {
      final body = _body(options);
      final order = store.advance(
        body['number'] as String? ?? '',
        OrderStatus.values.byName(body['status'] as String),
      );
      if (order != null) {
        notifications.orderChanged(order.number, body['status'] as String);
      }
      return order?.toJson();
    },
    decideReturn: (options) {
      final body = _body(options);
      final approve = body['approve'] == true;
      final order = store.decideReturn(
        body['number'] as String? ?? '',
        approve: approve,
      );
      if (order != null) {
        notifications.returnDecided(order.number, approved: approve);
      }
      if (order == null || !approve) return order?.toJson();
      final refund = order.toEntity().returnRefundBdt;
      wallet.credit(
        refund,
        WalletReason.returnRefund,
        orderNumber: order.number,
      );
      return store.refund(order.number, refund)?.toJson();
    },
  };

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};
}
