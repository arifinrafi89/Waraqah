import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../checkout/domain/entities/payment_method.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import 'order_parts_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

/// JSON shape of an [Order], as every orders endpoint sends it.
@freezed
abstract class OrderModel with _$OrderModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory OrderModel({
    required String number,
    required DateTime placedAt,
    required OrderStatus status,
    required List<OrderLineModel> lines,
    required List<StatusChangeModel> history,
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
    ReturnRequestModel? returnRequest,
    OrderGiftModel? gift,
    @Default(0) int giftWrapBdt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

extension OrderModelX on OrderModel {
  Order toEntity() => Order(
    number: number,
    placedAt: placedAt,
    status: status,
    lines: [for (final line in lines) line.toEntity()],
    history: [for (final change in history) change.toEntity()],
    addressLabel: addressLabel,
    addressLine: addressLine,
    payment: payment,
    subtotalBdt: subtotalBdt,
    deliveryFeeBdt: deliveryFeeBdt,
    discountBdt: discountBdt,
    totalBdt: totalBdt,
    needsDelivery: needsDelivery,
    pointsUsed: pointsUsed,
    pointsEarned: pointsEarned,
    returnRequest: returnRequest?.toEntity(),
    gift: gift?.toEntity(),
    giftWrapBdt: giftWrapBdt,
  );

  /// Moves the order to [next] and notes when.
  OrderModel advanceTo(OrderStatus next, DateTime at) => copyWith(
    status: next,
    history: [
      ...history,
      StatusChangeModel(status: next, at: at),
    ],
  );
}
