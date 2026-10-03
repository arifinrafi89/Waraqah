import 'package:dio/dio.dart';

import '../../../checkout/domain/entities/payment_method.dart';
import '../../domain/entities/handled_sale.dart';
import '../../domain/repositories/handled_sale_repository.dart';
import 'fake_sale.dart';
import 'handled_sale_fake_money.dart';
import 'handled_sale_fake_steps.dart';
import 'handled_sale_fake_store.dart';

/// Waraqah-handled sales' fake endpoints, merged into `FakeApiInterceptor`
/// by `app/fake_api_routes.dart`. Changes answer the sale, or `null` when
/// refused.
abstract final class HandledSaleFakeApi {
  /// Body `{listingId, method}`.
  static const String buy = '/sales/buy';
  static const String mine = '/sales/mine';

  /// `?id=HS-101`.
  static const String sale = '/sales/detail';

  /// Body `{id, step}`: send, cancel or confirm.
  static const String step = '/sales/step';

  /// Body `{id, reason, note?, photos}`, photos as base64 images.
  static const String dispute = '/sales/dispute';
  static const String earnings = '/sales/earnings';
  static const String payout = '/sales/payout';

  /// Open disputes, for moderators.
  static const String disputes = '/sales/disputes';

  /// Body `{id, refund, by}`: answers the open disputes.
  static const String settle = '/sales/disputes/settle';

  /// Server-sent events: `data: {seq, saleId}` per change, so a sale's
  /// page follows the other side's moves.
  static const String live = '/sales/live';

  static Map<String, Object? Function(RequestOptions)> routes(
    HandledSaleFakeStore store,
  ) {
    Map<String, dynamic>? answer(FakeSale? sale) {
      if (sale == null) return null;
      store.live.sale(sale.id);
      return store.json(sale);
    }

    return {
      buy: (o) => answer(
        store.buy(
          _text(o, 'listingId'),
          PaymentMethod.values.byName(_text(o, 'method')),
        ),
      ),
      mine: (_) => [
        for (final s
            in store.sales.values.toList()
              ..sort((a, b) => b.createdAt.compareTo(a.createdAt)))
          if (s.buyerId == HandledSaleFakeStore.me ||
              s.sellerId == HandledSaleFakeStore.me)
            store.json(s),
      ],
      sale: (o) => switch (store.sales[o.queryParameters['id']]) {
        final s?
            when s.buyerId == HandledSaleFakeStore.me ||
                s.sellerId == HandledSaleFakeStore.me =>
          store.json(s),
        _ => null,
      },
      step: (o) => answer(
        store.step(_text(o, 'id'), SaleStep.values.byName(_text(o, 'step'))),
      ),
      dispute: (o) => answer(
        store.dispute(
          _text(o, 'id'),
          DisputeReason.values.byName(_text(o, 'reason')),
          _body(o)['note'] as String?,
          [...?(_body(o)['photos'] as List?)?.cast<String>()],
        ),
      ),
      earnings: (_) => store.earningsJson(),
      payout: (_) => store.payout() ? store.earningsJson() : null,
      disputes: (_) => store.disputesJson(),
      settle: (o) {
        final id = _text(o, 'id');
        final done = store.settle(
          id,
          refund: _body(o)['refund'] == true,
          by: _text(o, 'by'),
        );
        if (done) store.live.sale(id);
        return done ? store.disputesJson() : null;
      },
      live: (_) => store.live.stream(),
    };
  }

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};

  static String _text(RequestOptions options, String key) =>
      _body(options)[key] as String? ?? '';
}
