import '../../../../core/usecase/usecase.dart';
import '../../../home/domain/entities/banner.dart';
import '../repositories/catalog_admin_repository.dart';

/// Every Banner, every Season's too, in display order.
class GetAdminBanners extends UseCase<List<Banner>, NoParams> {
  GetAdminBanners(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<List<Banner>> call(NoParams params) => _repository.banners();
}
