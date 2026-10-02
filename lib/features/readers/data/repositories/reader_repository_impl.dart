import '../../domain/entities/reader_profile.dart';
import '../../domain/repositories/reader_repository.dart';
import '../models/reader_model.dart';
import '../sources/reader_remote_source.dart';

class ReaderRepositoryImpl implements ReaderRepository {
  ReaderRepositoryImpl(this._source);

  final ReaderRemoteSource _source;

  @override
  Future<ReaderProfile> reader(String id) async =>
      (await _source.reader(id)).toEntity();

  @override
  Future<ReaderProfile> follow(String id, {required bool follow}) async =>
      (await _source.follow(id, follow: follow)).toEntity();
}
