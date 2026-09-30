import '../../../../core/cache/ttl_cache.dart';
import '../../domain/entities/book_series.dart';
import '../../domain/entities/look_inside.dart';
import '../../domain/repositories/book_extras_repository.dart';
import '../models/book_extras_model.dart';
import '../sources/book_extras_source.dart';

/// Contents, sample pages and series rarely change, so each is kept for a
/// while after it loads.
class BookExtrasRepositoryImpl implements BookExtrasRepository {
  BookExtrasRepositoryImpl(this._source);

  final BookExtrasSource _source;
  final _looks = TtlCache<LookInside?>(ttl: const Duration(minutes: 30));
  final _series = TtlCache<BookSeries?>(ttl: const Duration(minutes: 30));
  final _seriesById = TtlCache<BookSeries?>(ttl: const Duration(minutes: 30));

  @override
  Future<LookInside?> lookInside(String bookId) => _looks.resolve(
    bookId,
    () async => (await _source.lookInside(bookId))?.toEntity(),
  );

  /// Not cached: prices change.
  @override
  Future<Map<String, int>> priceLows(String bookId) =>
      _source.priceLows(bookId);

  @override
  Future<BookSeries?> series(String bookId) => _series.resolve(
    bookId,
    () async => (await _source.series(bookId))?.toEntity(),
  );

  @override
  Future<BookSeries?> seriesById(String id) => _seriesById.resolve(
    id,
    () async => (await _source.seriesById(id))?.toEntity(),
  );
}
