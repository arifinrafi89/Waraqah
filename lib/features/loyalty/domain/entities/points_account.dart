import 'package:freezed_annotation/freezed_annotation.dart';

part 'points_account.freezed.dart';

enum PointsReason { welcome, earned, spent, refunded, reversed }

/// One change to the balance: positive for points in, negative for out.
@freezed
abstract class PointsEntry with _$PointsEntry {
  const factory PointsEntry({
    required int points,
    required PointsReason reason,
    required DateTime at,
    String? orderNumber,
  }) = _PointsEntry;
}

/// The reader's Waraqah points and how they got there, newest first.
@freezed
abstract class PointsAccount with _$PointsAccount {
  const factory PointsAccount({
    @Default(0) int balance,
    @Default(<PointsEntry>[]) List<PointsEntry> entries,
  }) = _PointsAccount;
}
