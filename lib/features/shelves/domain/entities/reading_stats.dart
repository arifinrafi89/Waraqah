import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_stats.freezed.dart';

/// The reader's year in books: the goal, the streak, Books finished per
/// month and their favourite Categories.
@freezed
abstract class ReadingStats with _$ReadingStats {
  const factory ReadingStats({
    required int year,
    int? goal,
    required int finishedThisYear,
    required int streakDays,
    required bool readToday,

    /// Books finished in each month of [year], January first.
    required List<int> perMonth,
    required List<CategoryCount> topCategories,
  }) = _ReadingStats;
}

/// A Category and how many finished Books were in it.
@freezed
abstract class CategoryCount with _$CategoryCount {
  const factory CategoryCount({
    required String nameEn,
    required String nameBn,
    required int count,
  }) = _CategoryCount;
}
