import '../../../../core/usecase/usecase.dart';
import '../entities/shared_wishlist.dart';
import '../repositories/wishlist_repository.dart';

/// Someone's wishlist from its link id; `null` if no list has that id.
class GetSharedWishlist extends UseCase<SharedWishlist?, String> {
  GetSharedWishlist(this._repository);

  final WishlistRepository _repository;

  @override
  Future<SharedWishlist?> call(String params) => _repository.shared(params);
}
