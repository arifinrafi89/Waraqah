import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';

part 'shelf_entry.freezed.dart';

/// The reader's three shelves.
enum Shelf { wantToRead, reading, finished }

/// A Book on one of the reader's shelves.
@freezed
abstract class ShelfEntry with _$ShelfEntry {
  const factory ShelfEntry({
    required Book book,
    required Shelf shelf,
    required DateTime addedAt,

    /// When it moved to Finished.
    DateTime? finishedAt,

    /// How far the reader got, 0–100, and the pages when they count them.
    @Default(0) int progress,
    int? pagesRead,
    int? totalPages,
  }) = _ShelfEntry;
}

/// Puts a Book on [shelf], or takes it off every shelf when `null`.
typedef ShelfMove = ({String bookId, Shelf? shelf});

/// How far the reader got in a Book: a percentage, or pages read of the
/// Book's total (which sets the percentage).
typedef ProgressUpdate = ({
  String bookId,
  int percent,
  int? pagesRead,
  int? totalPages,
});
