import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/domain/entities/catalog_filters.dart';
import '../../../catalog/domain/repositories/book_repository.dart';

/// Home's New arrivals: the 10 Books Waraqah added most recently.
class GetNewArrivals extends UseCase<List<Book>, NoParams> {
  GetNewArrivals(this._repository);

  final BookRepository _repository;

  @override
  Future<List<Book>> call(NoParams params) async {
    final books = await _repository.searchCatalog(
      const CatalogFilters(sort: SearchSort.newest),
    );
    return books.take(10).toList();
  }
}
