import '../../../checkout/domain/entities/payment_method.dart';
import '../../domain/entities/earnings.dart';
import '../../domain/entities/handled_sale.dart';
import '../../domain/entities/sale_dispute.dart';
import '../../domain/repositories/handled_sale_repository.dart';
import '../models/earnings_model.dart';
import '../models/handled_sale_model.dart';
import '../sources/handled_sale_remote_source.dart';

/// No cache: a sale moves on whenever the other side acts.
class HandledSaleRepositoryImpl implements HandledSaleRepository {
  HandledSaleRepositoryImpl(this._source);

  final HandledSaleRemoteSource _source;

  @override
  Future<HandledSale> buy(String listingId, PaymentMethod method) async =>
      (await _source.buy(listingId, method)).toEntity();

  @override
  Future<List<HandledSale>> mine() async => [
    for (final m in await _source.mine()) m.toEntity(),
  ];

  @override
  Future<HandledSale?> sale(String id) async =>
      (await _source.sale(id))?.toEntity();

  @override
  Future<HandledSale> step(String id, SaleStep step) async =>
      (await _source.step(id, step)).toEntity();

  @override
  Future<HandledSale> dispute(DisputeDraft draft) async =>
      (await _source.dispute(draft)).toEntity();

  @override
  Future<Earnings> earnings() async => (await _source.earnings()).toEntity();

  @override
  Future<Earnings> payout() async => (await _source.payout()).toEntity();

  @override
  Future<List<SaleDispute>> disputes() async => [
    for (final m in await _source.disputes()) m.toEntity(),
  ];

  @override
  Future<List<SaleDispute>> settle(
    String id, {
    required bool refund,
    required String by,
  }) async => [
    for (final m in await _source.settle(id, refund, by)) m.toEntity(),
  ];
}
