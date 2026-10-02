import '../../../../core/usecase/usecase.dart';
import '../entities/bite.dart';
import '../entities/bite_query.dart';
import '../repositories/bite_repository.dart';

/// Posts a Bite, or saves an edit to "me"'s own.
class SaveBite extends UseCase<Bite, BiteDraft> {
  SaveBite(this._repository);

  final BiteRepository _repository;

  @override
  Future<Bite> call(BiteDraft params) => _repository.save(params);
}
