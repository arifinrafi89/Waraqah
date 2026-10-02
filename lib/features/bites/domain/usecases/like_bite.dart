import '../../../../core/usecase/usecase.dart';
import '../entities/bite.dart';
import '../repositories/bite_repository.dart';

/// Likes or unlikes a Bite; answers it with the new count.
class LikeBite extends UseCase<Bite, ({String id, bool liked})> {
  LikeBite(this._repository);

  final BiteRepository _repository;

  @override
  Future<Bite> call(({String id, bool liked}) params) =>
      _repository.like(params.id, liked: params.liked);
}
