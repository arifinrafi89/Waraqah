import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/domain/entities/catalog_filters.dart';
import '../../../catalog/domain/repositories/book_repository.dart';

/// Home's Bestsellers: the 10 Books with the most copies sold in 30 days.
class GetBestsellers extends UseCase<List<Book>, NoParams> {
  GetBestsellers(this._repository);

  final BookRepository _repository;

  @override
  Future<List<Book>> call(NoParams params) async {
    final books = await _repository.searchCatalog(
      const CatalogFilters(sort: SearchSort.bestselling),
    );
    return books.take(10).toList();
  }
}
