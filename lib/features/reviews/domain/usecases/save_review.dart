import '../../../../core/usecase/usecase.dart';
import '../entities/review.dart';
import '../repositories/review_repository.dart';

/// Writes or edits "me"'s review of a Book.
class SaveReview
    extends UseCase<BookReviews, ({String bookId, int stars, String text})> {
  SaveReview(this._repository);

  final ReviewRepository _repository;

  @override
  Future<BookReviews> call(({String bookId, int stars, String text}) params) =>
      _repository.save(params.bookId, params.stars, params.text);
}
