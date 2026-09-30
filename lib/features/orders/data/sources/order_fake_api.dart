import 'package:dio/dio.dart';

import '../../domain/entities/order_return.dart';
import '../../../loyalty/data/sources/points_fake_store.dart';
import '../../../wallet/data/sources/wallet_fake_store.dart';
import '../../../wallet/domain/entities/wallet.dart';
import '../../domain/entities/order_refunds.dart';
import '../models/order_model.dart';
import 'order_fake_store.dart';

/// Orders' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Placing an order lives with checkout
/// (`/orders/place`), which adds to the same store.
abstract final class OrderFakeApi {
  /// The reader's orders, newest first.
  static const String orders = '/orders';

  /// `?number=WQ-100231`; answers the order or `null`.
  static const String details = '/orders/details';

  /// Body: `{number}`. Answers the cancelled order, or `null` if it can't be.
  static const String cancel = '/orders/cancel';

  /// Body: `{number, reason, note, photos}`, photos as base64 images. Answers the order, or `null` if a
  /// return can't be asked for.
  static const String requestReturn = '/orders/return';

  /// Cancelling gives back the order's [points] spent and takes back those
  /// it earned, and puts what was paid back in the [wallet].
  static Map<String, Object? Function(RequestOptions)> routes(
    OrderFakeStore store,
    PointsFakeStore points,
    WalletFakeStore wallet,
  ) => {
    orders: (_) => [for (final order in store.all) order.toJson()],
    details: (options) => store
        .find(options.queryParameters['number'] as String? ?? '')
        ?.toJson(),
    cancel: (options) {
      final order = store.cancel(_body(options)['number'] as String? ?? '');
      if (order == null) return null;
      points.undo(
        order.number,
        spent: order.pointsUsed,
        earned: order.pointsEarned,
      );
      final refund = order.toEntity().cancelRefundBdt;
      wallet.credit(
        refund,
        WalletReason.cancelRefund,
        orderNumber: order.number,
      );
      return store.refund(order.number, refund)?.toJson();
    },
    requestReturn: (options) {
      final body = _body(options);
      return store
          .requestReturn(
            body['number'] as String? ?? '',
            ReturnReason.values.byName(body['reason'] as String),
            body['note'] as String? ?? '',
            photos: [...?(body['photos'] as List?)?.cast<String>()],
          )
          ?.toJson();
    },
  };

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};
}
