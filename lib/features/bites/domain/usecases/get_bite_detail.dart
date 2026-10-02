import '../../../../core/usecase/usecase.dart';
import '../entities/bite.dart';
import '../repositories/bite_repository.dart';

/// One Bite with its comments, by id.
class GetBiteDetail extends UseCase<BiteDetail, String> {
  GetBiteDetail(this._repository);

  final BiteRepository _repository;

  @override
  Future<BiteDetail> call(String params) => _repository.detail(params);
}
