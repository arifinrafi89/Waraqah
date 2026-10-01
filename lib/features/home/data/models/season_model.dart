import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/season.dart';

part 'season_model.freezed.dart';
part 'season_model.g.dart';

/// JSON shape of a [SeasonInfo], as `/home/season` answers it.
@freezed
abstract class SeasonModel with _$SeasonModel {
  const factory SeasonModel({
    required Season season,
    required String titleEn,
    required String titleBn,
    required String subtitleEn,
    required String subtitleBn,
    required int seed,
    required String collectionId,
  }) = _SeasonModel;

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);
}

extension SeasonModelX on SeasonModel {
  SeasonInfo toEntity() => SeasonInfo(
    season: season,
    titleEn: titleEn,
    titleBn: titleBn,
    subtitleEn: subtitleEn,
    subtitleBn: subtitleBn,
    seed: seed,
    collectionId: collectionId,
  );
}
