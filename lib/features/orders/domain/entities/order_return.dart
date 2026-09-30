import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_return.freezed.dart';

enum ReturnReason { damaged, wrongBook, other }

/// Support reviews every return (the admin side comes in the next PR).
enum ReturnStatus { requested, approved, rejected }

/// A reader asking to send a delivered order back.
@freezed
abstract class ReturnRequest with _$ReturnRequest {
  const factory ReturnRequest({
    required ReturnReason reason,
    required ReturnStatus status,
    required DateTime requestedAt,
    @Default('') String note,
  }) = _ReturnRequest;
}
