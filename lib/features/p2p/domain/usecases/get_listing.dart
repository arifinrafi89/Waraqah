import '../../../../core/usecase/usecase.dart';
import '../entities/p2p_listing.dart';
import '../repositories/p2p_repository.dart';

/// One listing by id, or `null`.
class GetListing extends UseCase<P2pListing?, String> {
  GetListing(this._repository);

  final P2pRepository _repository;

  @override
  Future<P2pListing?> call(String params) => _repository.fetchListing(params);
}
