import '../../../../core/usecase/usecase.dart';
import '../entities/reader_profile.dart';
import '../repositories/reader_repository.dart';

/// Follows or unfollows a Reader.
class FollowReader extends UseCase<ReaderProfile, ({String id, bool follow})> {
  FollowReader(this._repository);

  final ReaderRepository _repository;

  @override
  Future<ReaderProfile> call(({String id, bool follow}) params) =>
      _repository.follow(params.id, follow: params.follow);
}
