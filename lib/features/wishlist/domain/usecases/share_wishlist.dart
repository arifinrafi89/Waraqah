import '../../../../core/usecase/usecase.dart';
import '../entities/shared_wishlist.dart';
import '../repositories/wishlist_repository.dart';

/// Turns on the reader's wishlist link, showing them as [String] (their
/// name), and answers it. Sharing again answers the same link.
class ShareWishlist extends UseCase<SharedWishlist, String> {
  ShareWishlist(this._repository);

  final WishlistRepository _repository;

  @override
  Future<SharedWishlist> call(String params) =>
      _repository.share(params.trim());
}
