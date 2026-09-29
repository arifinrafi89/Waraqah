import 'dart:async';

import '../../../../core/cache/ttl_cache.dart';
import '../../../../core/models/book.dart';
import '../../domain/entities/book_details.dart';
import '../../domain/entities/vendor_offer.dart';
import '../../domain/repositories/book_repository.dart';
import '../sources/book_details_source.dart';
import '../sources/book_remote_source.dart';

/// Wraps [BookRemoteSource] with a TTL cache and the app's sort rules.
class BookRepositoryImpl implements BookRepository {
  BookRepositoryImpl(this._source, this._detailsSource);

  final BookRemoteSource _source;
  final BookDetailsSource _detailsSource;
  final TtlCache<List<Book>> _cache = TtlCache(ttl: const Duration(minutes: 5));
  final TtlCache<BookDetails> _detailsCache = TtlCache(
    ttl: const Duration(minutes: 5),
  );

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

  @override
  Future<BookDetails?> fetchDetails(String id) async {
    final cached = _detailsCache.read(id);
    if (cached != null) return cached;
    final (book, fetched) = await (findById(id), _detailsSource.fetch(id)).wait;
    if (book == null) return null;
    // No seed or API data yet: show the one offer we actually know about
    // rather than inventing competitor prices.
    final details =
        fetched ??
        BookDetails(
          bookId: id,
          offers: [VendorOffer(vendor: book.vendor, priceBdt: book.priceBdt)],
        );
    final sorted = details.copyWith(
      offers: [...details.offers]
        ..sort((a, b) => a.priceBdt.compareTo(b.priceBdt)),
    );
    _detailsCache.write(id, sorted);
    return sorted;
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
