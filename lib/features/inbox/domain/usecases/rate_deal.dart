import '../../../../core/usecase/usecase.dart';
import '../entities/inbox_thread.dart';
import '../entities/rating_rules.dart';
import '../repositories/inbox_repository.dart';

class RateDealParams {
  const RateDealParams({
    required this.threadId,
    required this.stars,
    this.comment = '',
  });

  final String threadId;
  final int stars;
  final String comment;
}

/// After the sale, the reader rates the other person (see [RatingRules]).
/// It shows on their seller page.
class RateDeal extends UseCase<InboxThread, RateDealParams> {
  RateDeal(this._repository);

  final InboxRepository _repository;

  @override
  Future<InboxThread> call(RateDealParams params) {
    final problem = RatingRules.check(
      stars: params.stars,
      comment: params.comment,
    );
    if (problem != null) throw ArgumentError.value(problem, 'rating');
    final comment = params.comment.trim();
    return _repository.rate(
      params.threadId,
      params.stars,
      comment.isEmpty ? null : comment,
    );
  }
}
