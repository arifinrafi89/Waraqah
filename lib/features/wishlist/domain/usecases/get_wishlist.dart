import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/wishlist_repository.dart';

class GetWishlist extends UseCase<List<Book>, NoParams> {
  GetWishlist(this._repository);

  final WishlistRepository _repository;

  @override
  Future<List<Book>> call(NoParams params) => _repository.fetch();
}
