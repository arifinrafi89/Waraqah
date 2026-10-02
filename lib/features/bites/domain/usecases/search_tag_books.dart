import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/domain/entities/catalog_filters.dart';
import '../../../catalog/domain/repositories/book_repository.dart';

/// The composer's "Tag a book" matches: the top 5 catalog Books for a
/// title or Author.
class SearchTagBooks extends UseCase<List<Book>, String> {
  SearchTagBooks(this._books);

  final BookRepository _books;

  @override
  Future<List<Book>> call(String params) async {
    if (params.trim().isEmpty) return const [];
    final books = await _books.searchCatalog(
      CatalogFilters(query: params.trim()),
    );
    return books.take(5).toList();
  }
}
