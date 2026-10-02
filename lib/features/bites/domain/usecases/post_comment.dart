import '../../../../core/usecase/usecase.dart';
import '../entities/bite.dart';
import '../repositories/bite_repository.dart';

/// Comments on a Bite, or replies to a comment.
class PostComment
    extends
        UseCase<BiteDetail, ({String biteId, String text, String? parentId})> {
  PostComment(this._repository);

  final BiteRepository _repository;

  @override
  Future<BiteDetail> call(
    ({String biteId, String text, String? parentId}) params,
  ) => _repository.comment(
    params.biteId,
    params.text,
    parentId: params.parentId,
  );
}
