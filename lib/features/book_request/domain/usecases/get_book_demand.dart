import '../../../../core/usecase/usecase.dart';
import '../entities/book_request.dart';
import '../repositories/book_request_repository.dart';

class GetBookDemand extends UseCase<List<BookDemand>, NoParams> {
  GetBookDemand(this._repository);

  final BookRequestRepository _repository;

  @override
  Future<List<BookDemand>> call(NoParams params) => _repository.demand();
}
