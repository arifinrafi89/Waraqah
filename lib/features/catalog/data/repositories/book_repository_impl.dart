import '../../../../core/cache/ttl_cache.dart';
import '../../../../core/models/book.dart';
import '../../domain/entities/catalog_filters.dart';
import '../../domain/repositories/book_repository.dart';
import '../sources/book_remote_source.dart';

/// Wraps [BookRemoteSource] with a TTL cache and the app's sort rules.
class BookRepositoryImpl implements BookRepository {
  BookRepositoryImpl(this._source);

  final BookRemoteSource _source;
  final TtlCache<List<Book>> _cache = TtlCache(ttl: const Duration(minutes: 5));

  @override
  Future<List<Book>> fetchNewArrivals() =>
      _cache.resolve('new-arrivals', () async {
        final books = await _source.fetchBooks();
        return _sortByValue(books).take(4).toList();
      });

  @override
  Future<List<Book>> searchCatalog([
    CatalogFilters filters = const CatalogFilters(),
  ]) => _cache.resolve('catalog:${filters.cacheKey}', () async {
    final books = await _source.fetchBooks(filters);
    // A chosen sort or a query keeps the API's relevance order; Section, Category, Author and
    // Publisher pages list newest first.
    if (filters.sort != null || filters.query.isNotEmpty) return books;
    return filters.isScoped ? _sortNewest(books) : _sortByValue(books);
  });

  @override
  Future<Book?> findById(String id) async {
    final books = await searchCatalog();
    return books.where((book) => book.id == id).firstOrNull;
  }

  /// Project rule: cheapest From-price first, ties broken by the better review score.
  List<Book> _sortByValue(List<Book> books) {
    final sorted = [...books];
    sorted.sort((a, b) {
      final byPrice = a.fromPriceBdt.compareTo(b.fromPriceBdt);
      return byPrice != 0 ? byPrice : b.rating.compareTo(a.rating);
    });
    return sorted;
  }

  List<Book> _sortNewest(List<Book> books) =>
      [...books]..sort((a, b) => b.addedAt.compareTo(a.addedAt));

  void invalidate() => _cache.clear();
}
