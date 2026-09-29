import '../../../../core/cache/ttl_cache.dart';
import '../../../../core/models/book.dart';
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
  Future<List<Book>> searchCatalog({String? category, String query = ''}) =>
      _cache.resolve('catalog:${category ?? 'all'}:$query', () async {
        final books = await _source.fetchBooks(
          category: category,
          query: query,
        );
        return _sortByValue(books);
      });

  @override
  Future<Book?> findById(String id) async {
    final books = await searchCatalog();
    return books.where((book) => book.id == id).firstOrNull;
  }

  /// Project rule: cheapest first, ties broken by the better review score.
  List<Book> _sortByValue(List<Book> books) {
    final sorted = [...books];
    sorted.sort((a, b) {
      final byPrice = a.priceBdt.compareTo(b.priceBdt);
      return byPrice != 0 ? byPrice : b.rating.compareTo(a.rating);
    });
    return sorted;
  }

  void invalidate() => _cache.clear();
}
