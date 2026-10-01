import '../../domain/entities/book_request.dart';
import '../../domain/repositories/book_request_repository.dart';
import '../models/book_request_model.dart';
import '../models/wanted_book_model.dart';
import '../sources/book_request_remote_source.dart';

/// No cache: matches change whenever someone lists or sells a copy.
class BookRequestRepositoryImpl implements BookRequestRepository {
  BookRequestRepositoryImpl(this._source);

  final BookRequestRemoteSource _source;

  @override
  Future<BookRequest> create(BookRequestDraft draft) async =>
      (await _source.create(draft)).toEntity();

  @override
  Future<List<BookRequest>> mine() async => [
    for (final m in await _source.mine()) m.toEntity(),
  ];

  @override
  Future<List<BookRequest>> close(String id) async => [
    for (final m in await _source.close(id)) m.toEntity(),
  ];

  @override
  Future<List<WantedBook>> wanted() async => [
    for (final m in await _source.wanted()) m.toEntity(),
  ];

  @override
  Future<List<BookDemand>> demand() async => [
    for (final m in await _source.demand()) m.toEntity(),
  ];
}
