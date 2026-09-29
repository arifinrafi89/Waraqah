import '../../../../core/usecase/usecase.dart';
import '../entities/ayah.dart';
import '../repositories/ayah_repository.dart';

/// Islamic curation block: the verse shown at the top of Home each day.
class GetAyahOfTheDay extends UseCase<Ayah, NoParams> {
  GetAyahOfTheDay(this._repository);

  final AyahRepository _repository;

  @override
  Future<Ayah> call(NoParams params) => _repository.fetchAyahOfTheDay();
}
