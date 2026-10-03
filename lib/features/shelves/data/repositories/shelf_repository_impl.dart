import '../../domain/entities/shelf_entry.dart';
import '../../domain/repositories/shelf_repository.dart';
import '../models/shelf_entry_model.dart';
import '../sources/shelf_remote_source.dart';

/// No cache: moving a Book changes the shelves at once.
class ShelfRepositoryImpl implements ShelfRepository {
  ShelfRepositoryImpl(this._source);

  final ShelfRemoteSource _source;

  @override
  Future<List<ShelfEntry>> mine() async => [
    for (final entry in await _source.mine()) entry.toEntity(),
  ];

  @override
  Future<List<ShelfEntry>> move(ShelfMove move) async => [
    for (final entry in await _source.move(move)) entry.toEntity(),
  ];
}
