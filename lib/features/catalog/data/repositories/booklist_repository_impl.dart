import '../../domain/entities/booklist.dart';
import '../../domain/repositories/booklist_repository.dart';
import '../sources/booklist_remote_source.dart';

/// No cache: a Reader wants to see their own change at once.
class BooklistRepositoryImpl implements BooklistRepository {
  BooklistRepositoryImpl(this._source);

  final BooklistRemoteSource _source;

  @override
  Future<List<Booklist>> booklists() => _source.booklists();

  @override
  Future<Booklist?> booklist(String id) => _source.booklist(id);

  @override
  Future<Booklist> saveMine({
    String? id,
    String? name,
    List<String>? bookIds,
  }) => _source.saveMine(id: id, name: name, bookIds: bookIds);

  @override
  Future<void> deleteMine(String id) => _source.deleteMine(id);
}
