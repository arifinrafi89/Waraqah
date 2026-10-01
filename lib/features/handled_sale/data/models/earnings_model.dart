import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/earnings.dart';
import '../../domain/entities/sale_dispute.dart';
import 'handled_sale_model.dart';

part 'earnings_model.freezed.dart';
part 'earnings_model.g.dart';

/// JSON shapes of [Earnings], [Payout] and [SaleDispute].
@freezed
abstract class PayoutModel with _$PayoutModel {
  const factory PayoutModel({required int amountBdt, required DateTime at}) =
      _PayoutModel;

  factory PayoutModel.fromJson(Map<String, dynamic> json) =>
      _$PayoutModelFromJson(json);
}

@freezed
abstract class EarningsModel with _$EarningsModel {
  // Deep toJson: the fake API answers nested models as JSON.
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory EarningsModel({
    required int heldBdt,
    required int earnedBdt,
    required int paidOutBdt,
    @Default(<PayoutModel>[]) List<PayoutModel> payouts,
  }) = _EarningsModel;

  factory EarningsModel.fromJson(Map<String, dynamic> json) =>
      _$EarningsModelFromJson(json);
}

@freezed
abstract class SaleDisputeModel with _$SaleDisputeModel {
  // Deep toJson: the fake API answers nested models as JSON.
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory SaleDisputeModel({
    required HandledSaleModel sale,
    required String buyerName,
    required String sellerName,
  }) = _SaleDisputeModel;

  factory SaleDisputeModel.fromJson(Map<String, dynamic> json) =>
      _$SaleDisputeModelFromJson(json);
}

extension EarningsModelX on EarningsModel {
  Earnings toEntity() => Earnings(
    heldBdt: heldBdt,
    earnedBdt: earnedBdt,
    paidOutBdt: paidOutBdt,
    payouts: [
      for (final p in payouts) Payout(amountBdt: p.amountBdt, at: p.at),
    ],
  );
}

extension SaleDisputeModelX on SaleDisputeModel {
  SaleDispute toEntity() => SaleDispute(
    sale: sale.toEntity(),
    buyerName: buyerName,
    sellerName: sellerName,
  );
}
