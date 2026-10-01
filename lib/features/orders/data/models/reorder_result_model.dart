import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/reorder_result.dart';

part 'reorder_result_model.freezed.dart';
part 'reorder_result_model.g.dart';

@freezed
abstract class ReorderResultModel with _$ReorderResultModel {
  const factory ReorderResultModel({
    @Default(0) int added,
    @Default(0) int skipped,
  }) = _ReorderResultModel;

  factory ReorderResultModel.fromJson(Map<String, dynamic> json) =>
      _$ReorderResultModelFromJson(json);
}

extension ReorderResultModelX on ReorderResultModel {
  ReorderResult toEntity() => ReorderResult(added: added, skipped: skipped);
}
