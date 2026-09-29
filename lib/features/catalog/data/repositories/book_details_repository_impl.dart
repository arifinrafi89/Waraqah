import 'dart:async';

import '../../../../core/cache/ttl_cache.dart';
import '../../domain/entities/book_details.dart';
import '../../domain/entities/vendor_offer.dart';
import '../../domain/repositories/book_details_repository.dart';
import '../../domain/repositories/book_repository.dart';
import '../sources/book_details_source.dart';

/// Joins the catalog entry with its detail data, cached for five minutes.
class BookDetailsRepositoryImpl implements BookDetailsRepository {
  BookDetailsRepositoryImpl(this._books, this._source);

  final BookRepository _books;
  final BookDetailsSource _source;
  final TtlCache<BookDetails> _cache = TtlCache(
    ttl: const Duration(minutes: 5),
  );

  @override
  Future<BookDetails?> fetchDetails(String bookId) async {
    final cached = _cache.read(bookId);
    if (cached != null) return cached;
    // Both can wait on the network, so run them side by side.
    final (book, fetched) = await (
      _books.findById(bookId),
      _source.fetch(bookId),
    ).wait;
    if (book == null) return null;
    // No seed or API data yet: show the one offer we actually know about
    // rather than inventing competitor prices.
    final details =
        fetched ??
        BookDetails(
          bookId: bookId,
          offers: [VendorOffer(vendor: book.vendor, priceBdt: book.priceBdt)],
        );
    final sorted = details.copyWith(
      offers: [...details.offers]
        ..sort((a, b) => a.priceBdt.compareTo(b.priceBdt)),
    );
    _cache.write(bookId, sorted);
    return sorted;
  }
}
