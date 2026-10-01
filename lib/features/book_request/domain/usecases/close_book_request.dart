import '../../../../core/usecase/usecase.dart';
import '../entities/book_request.dart';
import '../repositories/book_request_repository.dart';

class CloseBookRequest extends UseCase<List<BookRequest>, String> {
  CloseBookRequest(this._repository);

  final BookRequestRepository _repository;

  @override
  Future<List<BookRequest>> call(String params) => _repository.close(params);
}
