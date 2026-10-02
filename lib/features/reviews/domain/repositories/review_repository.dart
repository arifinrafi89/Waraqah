import '../entities/review.dart';

/// Reviews of one Book. Changes answer the Book's reviews again.
abstract interface class ReviewRepository {
  Future<BookReviews> reviews(String bookId);

  /// Writes "me"'s review, or edits it when there is one.
  Future<BookReviews> save(String bookId, int stars, String text);

  Future<BookReviews> delete(String bookId);
}
