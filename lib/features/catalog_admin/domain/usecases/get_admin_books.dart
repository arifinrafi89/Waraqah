import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/domain/entities/catalog_filters.dart';
import '../../../catalog/domain/repositories/book_repository.dart';

/// Every Book, hidden ones too, newest first: Staff's list.
class GetAdminBooks extends UseCase<List<Book>, NoParams> {
  GetAdminBooks(this._books);

  final BookRepository _books;

  @override
  Future<List<Book>> call(NoParams params) => _books.searchCatalog(
    const CatalogFilters(includeHidden: true, sort: SearchSort.newest),
  );
}
