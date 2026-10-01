import '../../../../core/usecase/usecase.dart';
import '../entities/book_request.dart';
import '../entities/request_rules.dart';
import '../repositories/book_request_repository.dart';

/// Sends a request after checking [RequestRules]. The server tells the
/// readers who have the book.
class CreateBookRequest extends UseCase<BookRequest, BookRequestDraft> {
  CreateBookRequest(this._repository);

  final BookRequestRepository _repository;

  @override
  Future<BookRequest> call(BookRequestDraft params) {
    final problem = RequestRules.check(params);
    if (problem != null) throw ArgumentError(problem.name);
    String? clean(String? text) =>
        text == null || text.trim().isEmpty ? null : text.trim();
    return _repository.create(
      params.copyWith(
        title: params.title.trim(),
        author: clean(params.author),
        note: clean(params.note),
      ),
    );
  }
}
