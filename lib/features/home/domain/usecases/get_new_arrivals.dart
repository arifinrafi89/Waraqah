import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/domain/repositories/book_repository.dart';

/// New arrivals for the home screen: the catalog's price-then-rating sort,
/// at most 8.
class GetNewArrivals extends UseCase<List<Book>, NoParams> {
  GetNewArrivals(this._repository);

  final BookRepository _repository;

  @override
  Future<List<Book>> call(NoParams params) async {
    final books = await _repository.searchCatalog();
    return books.take(8).toList();
  }
}
