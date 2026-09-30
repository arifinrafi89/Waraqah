import '../../../../core/models/book.dart';

/// Books the reader saved for later, newest first. Every call answers the
/// whole list.
abstract interface class WishlistRepository {
  Future<List<Book>> fetch();

  Future<List<Book>> save(String bookId);

  Future<List<Book>> remove(String bookId);
}
