import '../../../../core/usecase/usecase.dart';
import '../../../home/domain/entities/banner.dart';
import '../entities/catalog_admin_rules.dart';
import '../repositories/catalog_admin_repository.dart';

/// Adds a Banner to Home (empty id) or saves changes to one.
class SaveBanner extends UseCase<void, Banner> {
  SaveBanner(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<void> call(Banner params) {
    final problems = CatalogAdminRules.banner(params);
    if (problems.isNotEmpty) {
      throw ArgumentError.value(params, 'banner', problems.first.name);
    }
    return _repository.saveBanner(params);
  }
}
