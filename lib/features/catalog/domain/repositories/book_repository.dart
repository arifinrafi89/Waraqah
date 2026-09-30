import '../../../../core/models/book.dart';

/// What the catalog LEGO block promises to the rest of the app.
///
/// Home and the AI assistant depend on this interface, never on the Dio
/// implementation, so the Go backend can replace the fixtures without any of
/// them changing.
abstract interface class BookRepository {
  /// Newest arrivals for the home screen, cheapest From-price first.
  Future<List<Book>> fetchNewArrivals();

  /// Full catalog, optionally narrowed by category, Section, Author id, Publisher id and free-text query.
  Future<List<Book>> searchCatalog({
    String? category,
    Section? section,
    String? author,
    String? publisher,
    String query = '',
  });

  /// A single title, used by the AI assistant's recommendation cards.
  Future<Book?> findById(String id);
}
