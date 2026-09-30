import '../../../../core/models/book.dart';
import '../../domain/entities/shared_wishlist.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../models/shared_wishlist_model.dart';
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

  @override
  Future<SharedWishlist> share(String ownerName) async =>
      (await _source.share(ownerName)).toEntity();

  @override
  Future<SharedWishlist?> shared(String id) async =>
      (await _source.shared(id))?.toEntity();
}
