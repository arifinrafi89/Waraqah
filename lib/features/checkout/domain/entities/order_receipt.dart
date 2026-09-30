import 'package:freezed_annotation/freezed_annotation.dart';

import 'payment_method.dart';

part 'order_receipt.freezed.dart';

/// What the reader sees right after placing an order. The full order, with
/// tracking, comes with the Orders PR.
@freezed
abstract class OrderReceipt with _$OrderReceipt {
  const factory OrderReceipt({
    /// "WQ-100231", said to support on the phone.
    required String number,
    required int totalBdt,
    required int itemCount,
    required PaymentMethod payment,
    required bool needsDelivery,
    required bool insideDhaka,
    @Default(false) bool hasPreorders,
    @Default(0) int pointsEarned,

    /// Who the order is a gift for, if it is one.
    String? giftFor,
  }) = _OrderReceipt;
}
