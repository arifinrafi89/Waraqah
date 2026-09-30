import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/order_receipt.dart';
import '../../domain/entities/payment_method.dart';

part 'order_receipt_model.freezed.dart';
part 'order_receipt_model.g.dart';

@freezed
abstract class OrderReceiptModel with _$OrderReceiptModel {
  const factory OrderReceiptModel({
    required String number,
    required int totalBdt,
    required int itemCount,
    required PaymentMethod payment,
    required bool needsDelivery,
    required bool insideDhaka,
    @Default(false) bool hasPreorders,
  }) = _OrderReceiptModel;

  factory OrderReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$OrderReceiptModelFromJson(json);
}

extension OrderReceiptModelX on OrderReceiptModel {
  OrderReceipt toEntity() => OrderReceipt(
    number: number,
    totalBdt: totalBdt,
    itemCount: itemCount,
    payment: payment,
    needsDelivery: needsDelivery,
    insideDhaka: insideDhaka,
    hasPreorders: hasPreorders,
  );
}
