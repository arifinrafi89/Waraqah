import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../checkout/domain/entities/payment_method.dart';
import '../../domain/entities/handled_sale.dart';

part 'handled_sale_model.freezed.dart';
part 'handled_sale_model.g.dart';

/// JSON shape of a [HandledSale]. Dispute photos travel as base64.
@freezed
abstract class HandledSaleModel with _$HandledSaleModel {
  const factory HandledSaleModel({
    required String id,
    required String listingId,
    required String title,
    required SaleRole role,
    required String otherName,
    required int priceBdt,
    required int deliveryBdt,
    required int feeBdt,
    required SaleStatus status,
    required PaymentMethod method,
    required DateTime createdAt,
    @Default(0) int coverSeed,
    DisputeReason? disputeReason,
    String? disputeNote,
    @Default(<String>[]) List<String> disputePhotos,
  }) = _HandledSaleModel;

  factory HandledSaleModel.fromJson(Map<String, dynamic> json) =>
      _$HandledSaleModelFromJson(json);
}

extension HandledSaleModelX on HandledSaleModel {
  HandledSale toEntity() => HandledSale(
    id: id,
    listingId: listingId,
    title: title,
    role: role,
    otherName: otherName,
    priceBdt: priceBdt,
    deliveryBdt: deliveryBdt,
    feeBdt: feeBdt,
    status: status,
    method: method,
    createdAt: createdAt,
    coverSeed: coverSeed,
    disputeReason: disputeReason,
    disputeNote: disputeNote,
    disputePhotos: [for (final photo in disputePhotos) base64Decode(photo)],
  );
}
