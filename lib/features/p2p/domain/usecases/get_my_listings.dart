import '../../../../core/usecase/usecase.dart';
import '../entities/p2p_listing.dart';
import '../repositories/p2p_repository.dart';

/// The signed-in reader's own listings, in any status.
class GetMyListings extends UseCase<List<P2pListing>, NoParams> {
  GetMyListings(this._repository);

  final P2pRepository _repository;

  @override
  Future<List<P2pListing>> call(NoParams params) =>
      _repository.fetchMyListings();
}
