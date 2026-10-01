import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/expert.dart';

part 'expert_model.freezed.dart';
part 'expert_model.g.dart';

@freezed
abstract class ExpertModel with _$ExpertModel {
  const factory ExpertModel({
    required String id,
    required String name,
    required String nameBn,
    required String credentialEn,
    required String credentialBn,
    required ExpertKind kind,
    @Default(false) bool verified,
  }) = _ExpertModel;

  factory ExpertModel.fromJson(Map<String, dynamic> json) =>
      _$ExpertModelFromJson(json);
}

extension ExpertModelX on ExpertModel {
  Expert toEntity() => Expert(
    id: id,
    name: name,
    nameBn: nameBn,
    credentialEn: credentialEn,
    credentialBn: credentialBn,
    kind: kind,
    verified: verified,
  );
}
