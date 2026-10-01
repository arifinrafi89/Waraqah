import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status.freezed.dart';

/// Where an order is. The first five are the tracking steps, in order;
/// cancelled can happen any time before shipping.
enum OrderStatus { placed, confirmed, packed, shipped, delivered, cancelled }

extension OrderStatusX on OrderStatus {
  /// The steps the tracking timeline shows.
  static const List<OrderStatus> steps = [
    OrderStatus.placed,
    OrderStatus.confirmed,
    OrderStatus.packed,
    OrderStatus.shipped,
    OrderStatus.delivered,
  ];

  /// The step after this one, or `null` once delivered or cancelled.
  OrderStatus? get next {
    final i = steps.indexOf(this);
    return i < 0 || i == steps.length - 1 ? null : steps[i + 1];
  }

  /// Readers can cancel until the order leaves the warehouse.
  bool get canCancel =>
      this == OrderStatus.placed ||
      this == OrderStatus.confirmed ||
      this == OrderStatus.packed;
}

/// One step an order went through, and when.
@freezed
abstract class StatusChange with _$StatusChange {
  const factory StatusChange({
    required OrderStatus status,
    required DateTime at,
  }) = _StatusChange;
}
