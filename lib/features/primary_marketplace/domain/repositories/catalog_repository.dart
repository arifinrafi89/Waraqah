import '../../../../core/domain/entities/book.dart';
import '../entities/primary_listing.dart';

/// Repository interface for catalog browsing and edition price comparisons.
abstract class CatalogRepository {
  /// Fetches catalog books sorted by price (cheapest first) with rating tie-break.
  Future<List<Book>> getBooks({String? searchQuery, String? category});

  /// Fetches a specific book by ID.
  Future<Book?> getBookById(String bookId);

  /// Fetches purchasable edition/format listings for a given book.
  Future<List<PrimaryListing>> getListingsForBook(String bookId);
}

