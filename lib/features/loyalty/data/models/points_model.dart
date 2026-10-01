import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/points_account.dart';

part 'points_model.freezed.dart';
part 'points_model.g.dart';

@freezed
abstract class PointsEntryModel with _$PointsEntryModel {
  const factory PointsEntryModel({
    required int points,
    required PointsReason reason,
    required DateTime at,
    String? orderNumber,
  }) = _PointsEntryModel;

  factory PointsEntryModel.fromJson(Map<String, dynamic> json) =>
      _$PointsEntryModelFromJson(json);
}

@freezed
abstract class PointsAccountModel with _$PointsAccountModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory PointsAccountModel({
    @Default(0) int balance,
    @Default(<PointsEntryModel>[]) List<PointsEntryModel> entries,
  }) = _PointsAccountModel;

  factory PointsAccountModel.fromJson(Map<String, dynamic> json) =>
      _$PointsAccountModelFromJson(json);
}

extension PointsAccountModelX on PointsAccountModel {
  PointsAccount toEntity() => PointsAccount(
    balance: balance,
    entries: [
      for (final e in entries)
        PointsEntry(
          points: e.points,
          reason: e.reason,
          at: e.at,
          orderNumber: e.orderNumber,
        ),
    ],
  );
}
