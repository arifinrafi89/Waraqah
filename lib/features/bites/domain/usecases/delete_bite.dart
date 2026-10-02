import '../../../../core/usecase/usecase.dart';
import '../repositories/bite_repository.dart';

/// Deletes one of "me"'s Bites, with its comments.
class DeleteBite extends UseCase<void, String> {
  DeleteBite(this._repository);

  final BiteRepository _repository;

  @override
  Future<void> call(String params) => _repository.delete(params);
}
