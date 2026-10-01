import '../../../../core/usecase/usecase.dart';
import '../entities/seller_profile.dart';
import '../repositories/p2p_repository.dart';

/// A reader's seller page by their id, or `null`.
class GetSeller extends UseCase<SellerProfile?, String> {
  GetSeller(this._repository);

  final P2pRepository _repository;

  @override
  Future<SellerProfile?> call(String params) => _repository.fetchSeller(params);
}
