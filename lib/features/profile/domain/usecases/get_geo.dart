import '../../../../core/usecase/usecase.dart';
import '../entities/geo.dart';
import '../repositories/profile_repository.dart';

/// Bangladesh's divisions, districts and upazilas, for the address pickers.
class GetGeo extends UseCase<List<GeoDivision>, NoParams> {
  GetGeo(this._repository);

  final ProfileRepository _repository;

  @override
  Future<List<GeoDivision>> call(NoParams params) => _repository.geo();
}
