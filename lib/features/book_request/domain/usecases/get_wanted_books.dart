import '../../../../core/usecase/usecase.dart';
import '../entities/book_request.dart';
import '../repositories/book_request_repository.dart';

class GetWantedBooks extends UseCase<List<WantedBook>, NoParams> {
  GetWantedBooks(this._repository);

  final BookRequestRepository _repository;

  @override
  Future<List<WantedBook>> call(NoParams params) => _repository.wanted();
}
