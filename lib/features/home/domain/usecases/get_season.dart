import '../../../../core/usecase/usecase.dart';
import '../entities/season.dart';
import '../repositories/banner_repository.dart';

/// The Season Home shows its hero card for, or `null`.
class GetSeason extends UseCase<SeasonInfo?, NoParams> {
  GetSeason(this._repository);

  final BannerRepository _repository;

  @override
  Future<SeasonInfo?> call(NoParams params) => _repository.fetchSeason();
}
