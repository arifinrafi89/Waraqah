import '../../../../core/usecase/usecase.dart';
import '../entities/bite.dart';
import '../entities/bite_query.dart';
import '../repositories/bite_repository.dart';

/// A feed, newest first.
class GetBites extends UseCase<List<Bite>, BiteQuery> {
  GetBites(this._repository);

  final BiteRepository _repository;

  @override
  Future<List<Bite>> call(BiteQuery params) => _repository.feed(params);
}
