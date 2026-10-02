import '../../domain/entities/bite.dart';
import '../../domain/entities/bite_query.dart';
import '../../domain/repositories/bite_repository.dart';
import '../models/bite_model.dart';
import '../sources/bite_remote_source.dart';

/// No cache: likes and comments change what every feed shows.
class BiteRepositoryImpl implements BiteRepository {
  BiteRepositoryImpl(this._source);

  final BiteRemoteSource _source;

  @override
  Future<List<Bite>> feed(BiteQuery query) async => [
    for (final m in await _source.feed(query)) m.toEntity(),
  ];

  @override
  Future<BiteDetail> detail(String id) async =>
      (await _source.detail(id)).toEntity();

  @override
  Future<Bite> save(BiteDraft draft) async =>
      (await _source.save(draft)).toEntity();

  @override
  Future<void> delete(String id) => _source.delete(id);

  @override
  Future<Bite> like(String id, {required bool liked}) async =>
      (await _source.like(id, liked: liked)).toEntity();

  @override
  Future<BiteDetail> comment(
    String biteId,
    String text, {
    String? parentId,
  }) async =>
      (await _source.comment(biteId, text, parentId: parentId)).toEntity();

  @override
  Future<BiteDetail> deleteComment(String id) async =>
      (await _source.deleteComment(id)).toEntity();
}
