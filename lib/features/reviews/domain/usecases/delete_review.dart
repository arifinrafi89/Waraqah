import '../../../../core/usecase/usecase.dart';
import '../entities/review.dart';
import '../repositories/review_repository.dart';

/// Deletes "me"'s review of a Book, by Book id.
class DeleteReview extends UseCase<BookReviews, String> {
  DeleteReview(this._repository);

  final ReviewRepository _repository;

  @override
  Future<BookReviews> call(String params) => _repository.delete(params);
}
