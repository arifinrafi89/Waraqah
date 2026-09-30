import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/edition.dart';
import '../../domain/entities/order_line.dart';
import '../../domain/entities/order_return.dart';
import '../../domain/entities/order_status.dart';

part 'order_parts_model.freezed.dart';
part 'order_parts_model.g.dart';

@freezed
abstract class OrderLineModel with _$OrderLineModel {
  const factory OrderLineModel({
    required String bookId,
    required String title,
    required String author,
    required int quantity,
    required int unitPriceBdt,
    BookFormat? format,
    BookLanguage? language,
    @Default(0) int coverSeed,
  }) = _OrderLineModel;

  factory OrderLineModel.fromJson(Map<String, dynamic> json) =>
      _$OrderLineModelFromJson(json);
}

@freezed
abstract class StatusChangeModel with _$StatusChangeModel {
  const factory StatusChangeModel({
    required OrderStatus status,
    required DateTime at,
  }) = _StatusChangeModel;

  factory StatusChangeModel.fromJson(Map<String, dynamic> json) =>
      _$StatusChangeModelFromJson(json);
}

@freezed
abstract class ReturnRequestModel with _$ReturnRequestModel {
  const factory ReturnRequestModel({
    required ReturnReason reason,
    required ReturnStatus status,
    required DateTime requestedAt,
    @Default('') String note,
  }) = _ReturnRequestModel;

  factory ReturnRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnRequestModelFromJson(json);
}

extension OrderLineModelX on OrderLineModel {
  OrderLine toEntity() => OrderLine(
    bookId: bookId,
    title: title,
    author: author,
    quantity: quantity,
    unitPriceBdt: unitPriceBdt,
    format: format,
    language: language,
    coverSeed: coverSeed,
  );
}

extension StatusChangeModelX on StatusChangeModel {
  StatusChange toEntity() => StatusChange(status: status, at: at);
}

extension ReturnRequestModelX on ReturnRequestModel {
  ReturnRequest toEntity() => ReturnRequest(
    reason: reason,
    status: status,
    requestedAt: requestedAt,
    note: note,
  );
}
