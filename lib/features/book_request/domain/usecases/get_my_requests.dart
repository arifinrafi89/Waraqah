import '../../../../core/usecase/usecase.dart';
import '../entities/book_request.dart';
import '../repositories/book_request_repository.dart';

class GetMyRequests extends UseCase<List<BookRequest>, NoParams> {
  GetMyRequests(this._repository);

  final BookRequestRepository _repository;

  @override
  Future<List<BookRequest>> call(NoParams params) => _repository.mine();
}
