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
  }) = _ShelfEntry;
}

/// Puts a Book on [shelf], or takes it off every shelf when `null`.
typedef ShelfMove = ({String bookId, Shelf? shelf});
