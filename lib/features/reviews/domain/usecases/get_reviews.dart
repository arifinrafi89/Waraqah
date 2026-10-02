import '../../../../core/usecase/usecase.dart';
import '../entities/review.dart';
import '../repositories/review_repository.dart';

/// A Book's reviews, newest first, by Book id.
class GetReviews extends UseCase<BookReviews, String> {
  GetReviews(this._repository);

  final ReviewRepository _repository;

  @override
  Future<BookReviews> call(String params) => _repository.reviews(params);
}
