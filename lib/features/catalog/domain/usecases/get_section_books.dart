import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/catalog_filters.dart';
import '../repositories/book_repository.dart';

/// Every Book in a Section, newest first (the repository orders it).
class GetSectionBooks extends UseCase<List<Book>, Section> {
  GetSectionBooks(this._repository);

  final BookRepository _repository;

  @override
  Future<List<Book>> call(Section params) {
    return _repository.searchCatalog(CatalogFilters(section: params));
  }
}
