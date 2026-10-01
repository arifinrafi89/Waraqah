import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/wishlist_repository.dart';

class SetWishlistedParams {
  const SetWishlistedParams({required this.bookId, required this.saved});

  final String bookId;
  final bool saved;
}

/// Saves a book to the wishlist, or takes it off.
class SetWishlisted extends UseCase<List<Book>, SetWishlistedParams> {
  SetWishlisted(this._repository);

  final WishlistRepository _repository;

  @override
  Future<List<Book>> call(SetWishlistedParams params) => params.saved
      ? _repository.save(params.bookId)
      : _repository.remove(params.bookId);
}
