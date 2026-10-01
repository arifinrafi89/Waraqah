import '../../../../core/usecase/usecase.dart';
import '../entities/p2p_listing.dart';
import '../repositories/p2p_repository.dart';

class FetchListingsForBookUseCase implements UseCase<List<P2pListing>, String> {
  final P2pRepository _repository;

  FetchListingsForBookUseCase(this._repository);

  @override
  Future<List<P2pListing>> call(String bookId) {
    return _repository.fetchListingsForBook(bookId);
  }
}
