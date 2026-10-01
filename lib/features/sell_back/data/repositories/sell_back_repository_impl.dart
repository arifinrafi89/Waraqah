import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/sell_back.dart';
import '../../domain/repositories/sell_back_repository.dart';
import '../models/sell_back_model.dart';
import '../sources/sell_back_remote_source.dart';

class SellBackRepositoryImpl implements SellBackRepository {
  SellBackRepositoryImpl(this._source);

  final SellBackRemoteSource _source;

  @override
  Future<List<SellBackBook>> books(String query) async => [
    for (final m in await _source.books(query)) m.toEntity(),
  ];

  @override
  Future<SellBackBook?> book(String bookId) async =>
      (await _source.book(bookId))?.toEntity();

  @override
  Future<SellBack> create(SellBackDraft draft) async =>
      (await _source.create(draft)).toEntity();

  @override
  Future<List<SellBack>> mine() async => [
    for (final m in await _source.mine()) m.toEntity(),
  ];

  @override
  Future<List<SellBack>> queue() async => [
    for (final m in await _source.queue()) m.toEntity(),
  ];

  @override
  Future<List<SellBack>> grade(
    String id, {
    required BookCondition condition,
    required bool accept,
    required String by,
  }) async => [
    for (final m in await _source.grade(id, condition, accept, by))
      m.toEntity(),
  ];
}
