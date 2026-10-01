import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/edition.dart';
import '../../../checkout/domain/entities/gift.dart';
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
    String? editionId,
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

    /// Base64 images for now; the Go backend will store uploads and answer
    /// links instead.
    @Default(<String>[]) List<String> photos,
  }) = _ReturnRequestModel;

  factory ReturnRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnRequestModelFromJson(json);
}

@freezed
abstract class OrderGiftModel with _$OrderGiftModel {
  const factory OrderGiftModel({
    required String recipientName,
    @Default('') String message,
    @Default(false) bool wrapped,
  }) = _OrderGiftModel;

  factory OrderGiftModel.fromJson(Map<String, dynamic> json) =>
      _$OrderGiftModelFromJson(json);
}

extension OrderGiftModelX on OrderGiftModel {
  Gift toEntity() =>
      Gift(recipientName: recipientName, message: message, wrapped: wrapped);
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
    editionId: editionId,
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
    photos: [for (final photo in photos) base64Decode(photo)],
  );
}
