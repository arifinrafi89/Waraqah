import '../../../../core/usecase/usecase.dart';
import '../entities/p2p_listing.dart';
import '../repositories/p2p_repository.dart';

class ListingsQuery {
  const ListingsQuery({this.onlyAvailable = false, this.limit});

  /// Just what others can buy now, for Home's strip.
  final bool onlyAvailable;
  final int? limit;
}

/// The marketplace: listings on sale or reserved.
class GetListings extends UseCase<List<P2pListing>, ListingsQuery> {
  GetListings(this._repository);

  final P2pRepository _repository;

  @override
  Future<List<P2pListing>> call(ListingsQuery params) => _repository
      .fetchListings(onlyAvailable: params.onlyAvailable, limit: params.limit);
}
