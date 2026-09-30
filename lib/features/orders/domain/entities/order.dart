import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../checkout/domain/entities/gift.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import 'order_line.dart';
import 'order_return.dart';
import 'order_status.dart';

part 'order.freezed.dart';

/// A placed order: what was bought, where it goes, what it cost and where
/// it is now.
@freezed
abstract class Order with _$Order {
  const factory Order({
    /// "WQ-100231".
    required String number,
    required DateTime placedAt,
    required OrderStatus status,
    required List<OrderLine> lines,
    required List<StatusChange> history,
    required String addressLabel,
    required String addressLine,
    required PaymentMethod payment,
    required int subtotalBdt,
    required int deliveryFeeBdt,
    required int discountBdt,
    required int totalBdt,
    @Default(true) bool needsDelivery,
    @Default(0) int pointsUsed,
    @Default(0) int pointsEarned,
    ReturnRequest? returnRequest,

    /// Set when the order is a gift: pack it with the card, no prices.
    Gift? gift,
    @Default(0) int giftWrapBdt,

    /// A donation to a verified place; [gift] says which.
    @Default(false) bool isDonation,
  }) = _Order;
}

extension OrderX on Order {
  /// Returns are open for this long after delivery.
  static const Duration returnWindow = Duration(days: 7);

  int get itemCount => lines.fold(0, (sum, line) => sum + line.quantity);

  /// When the order reached [step], or `null` if it hasn't.
  DateTime? reachedAt(OrderStatus step) =>
      history.where((change) => change.status == step).firstOrNull?.at;

  bool get canCancel => status.canCancel;

  /// Delivered in the last 7 days, printed books, and not asked yet.
  bool canRequestReturn(DateTime now) {
    final delivered = reachedAt(OrderStatus.delivered);
    return needsDelivery &&
        returnRequest == null &&
        delivered != null &&
        now.difference(delivered) <= returnWindow;
  }
}
