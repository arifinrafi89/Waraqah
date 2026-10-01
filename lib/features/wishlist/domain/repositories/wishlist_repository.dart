import '../../../../core/models/book.dart';
import '../entities/shared_wishlist.dart';

/// Books the reader saved for later, newest first. Every call answers the
/// whole list.
abstract interface class WishlistRepository {
  Future<List<Book>> fetch();

  Future<List<Book>> save(String bookId);

  Future<List<Book>> remove(String bookId);

  /// Turns on the link to the reader's list, showing them as [ownerName].
  Future<SharedWishlist> share(String ownerName);

  /// Someone's list from its link id, or `null` if there's none.
  Future<SharedWishlist?> shared(String id);
}
