import '../../../../core/models/book.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../sources/wishlist_remote_source.dart';

/// No cache: the list changes with every tap, and the server owns it.
class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRepositoryImpl(this._source);

  final WishlistRemoteSource _source;

  @override
  Future<List<Book>> fetch() => _source.fetch();

  @override
  Future<List<Book>> save(String bookId) => _source.save(bookId);

  @override
  Future<List<Book>> remove(String bookId) => _source.remove(bookId);
}
