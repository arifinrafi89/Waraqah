import '../entities/book_series.dart';
import '../entities/look_inside.dart';

/// The extras on a book's page: Look Inside, its series and price history.
abstract interface class BookExtrasRepository {
  /// `null` when there's nothing to look at for this book.
  Future<LookInside?> lookInside(String bookId);

  /// `null` when the book isn't part of a series.
  Future<BookSeries?> series(String bookId);

  /// Each Edition's lowest price in the last 30 days, by Edition id.
  Future<Map<String, int>> priceLows(String bookId);
}
