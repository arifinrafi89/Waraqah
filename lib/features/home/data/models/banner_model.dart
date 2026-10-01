import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/banner.dart';
import '../../domain/entities/season.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

/// JSON shape of a [Banner], as it comes off the wire (or a fixture).
@freezed
abstract class BannerModel with _$BannerModel {
  // Deep toJson: the fake API serialises the target inside each Banner.
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory BannerModel({
    required String id,
    required String titleEn,
    required String titleBn,
    required String subtitleEn,
    required String subtitleBn,
    required int seed,
    required BannerTargetModel target,
    // Shown only while this Season is on; `null` = all year.
    Season? season,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

@freezed
abstract class BannerTargetModel with _$BannerTargetModel {
  const factory BannerTargetModel({
    required BannerTargetKind kind,
    required String value,
  }) = _BannerTargetModel;

  factory BannerTargetModel.fromJson(Map<String, dynamic> json) =>
      _$BannerTargetModelFromJson(json);
}

extension BannerModelX on BannerModel {
  Banner toEntity() => Banner(
    id: id,
    titleEn: titleEn,
    titleBn: titleBn,
    subtitleEn: subtitleEn,
    subtitleBn: subtitleBn,
    seed: seed,
    target: BannerTarget(target.kind, target.value),
    season: season,
  );
}
