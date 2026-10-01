import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/catalog_admin_repository.dart';
import '../entities/book_draft.dart';

/// Adds a new Book or saves changes to one. The form checks
/// `CatalogAdminRules` first; the server checks again.
class SaveBook extends UseCase<Book, BookDraft> {
  SaveBook(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<Book> call(BookDraft params) => _repository.saveBook(params);
}
