import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanned_book.freezed.dart';

/// The catalog Book an ISBN belongs to: enough to open its page or start
/// a used Listing with it filled in.
@freezed
abstract class ScannedBook with _$ScannedBook {
  const factory ScannedBook({
    required String bookId,
    required String title,
    required String author,
    required String isbn,
    @Default(0) int coverSeed,

    /// The Book's From-price, `null` when no Edition can be ordered.
    int? newPriceBdt,
  }) = _ScannedBook;
}
