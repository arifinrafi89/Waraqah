import '../../../../core/usecase/usecase.dart';
import '../entities/banner.dart';
import '../repositories/banner_repository.dart';

/// The Banners at the top of Home, in display order.
class GetBanners extends UseCase<List<Banner>, NoParams> {
  GetBanners(this._repository);

  final BannerRepository _repository;

  @override
  Future<List<Banner>> call(NoParams params) => _repository.fetchBanners();
}
