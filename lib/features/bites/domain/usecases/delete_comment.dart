import '../../../../core/usecase/usecase.dart';
import '../entities/bite.dart';
import '../repositories/bite_repository.dart';

/// Deletes one of "me"'s comments (a top comment takes its replies).
class DeleteComment extends UseCase<BiteDetail, String> {
  DeleteComment(this._repository);

  final BiteRepository _repository;

  @override
  Future<BiteDetail> call(String params) => _repository.deleteComment(params);
}
