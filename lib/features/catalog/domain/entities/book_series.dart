import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_series.freezed.dart';

/// One book in a series. [bookId] is `null` when Waraqah doesn't sell it yet.
@freezed
abstract class SeriesEntry with _$SeriesEntry {
  const factory SeriesEntry({
    required int position,
    required String title,
    String? bookId,
    @Default(0) int coverSeed,
  }) = _SeriesEntry;
}

/// A series and all its books, in reading order.
@freezed
abstract class BookSeries with _$BookSeries {
  const factory BookSeries({
    required String id,
    required String name,
    required List<SeriesEntry> entries,
  }) = _BookSeries;
}

extension BookSeriesX on BookSeries {
  /// Where [bookId] sits in the series, or `null` if it isn't in it.
  int? positionOf(String bookId) =>
      entries.where((e) => e.bookId == bookId).firstOrNull?.position;

  int get inStore => entries.where((e) => e.bookId != null).length;
}
