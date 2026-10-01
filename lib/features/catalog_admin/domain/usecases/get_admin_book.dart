import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/domain/repositories/book_repository.dart';

/// One Book to edit, hidden or not; `null` when unknown.
class GetAdminBook extends UseCase<Book?, String> {
  GetAdminBook(this._books);

  final BookRepository _books;

  @override
  Future<Book?> call(String params) => _books.findById(params);
}
