import '../../../../core/usecase/usecase.dart';
import '../entities/reader_profile.dart';
import '../repositories/reader_repository.dart';

/// A Reader's page, by id (`me` for the signed-in Reader).
class GetReader extends UseCase<ReaderProfile, String> {
  GetReader(this._repository);

  final ReaderRepository _repository;

  @override
  Future<ReaderProfile> call(String params) => _repository.reader(params);
}
