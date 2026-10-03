import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/reading_stats.dart';

part 'reading_stats_model.freezed.dart';
part 'reading_stats_model.g.dart';

/// JSON shape of [ReadingStats].
@freezed
abstract class ReadingStatsModel with _$ReadingStatsModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory ReadingStatsModel({
    required int year,
    int? goal,
    required int finishedThisYear,
    required int streakDays,
    required bool readToday,
    required List<int> perMonth,
    required List<CategoryCountModel> topCategories,
  }) = _ReadingStatsModel;

  factory ReadingStatsModel.fromJson(Map<String, dynamic> json) =>
      _$ReadingStatsModelFromJson(json);
}

@freezed
abstract class CategoryCountModel with _$CategoryCountModel {
  const factory CategoryCountModel({
    required String nameEn,
    required String nameBn,
    required int count,
  }) = _CategoryCountModel;

  factory CategoryCountModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryCountModelFromJson(json);
}

extension ReadingStatsModelX on ReadingStatsModel {
  ReadingStats toEntity() => ReadingStats(
    year: year,
    goal: goal,
    finishedThisYear: finishedThisYear,
    streakDays: streakDays,
    readToday: readToday,
    perMonth: perMonth,
    topCategories: [
      for (final c in topCategories)
        CategoryCount(nameEn: c.nameEn, nameBn: c.nameBn, count: c.count),
    ],
  );
}
