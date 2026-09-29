import '../entities/book_details.dart';

/// Detail data for a single title: vendor offers, reviews and publication
/// facts.
///
/// Kept apart from [BookRepository] so list screens and their test fakes
/// don't have to know about detail data.
abstract interface class BookDetailsRepository {
  /// Offers sorted cheapest first. `null` when [bookId] is not in the catalog.
  Future<BookDetails?> fetchDetails(String bookId);
}
