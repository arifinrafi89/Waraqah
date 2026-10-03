import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/domain/repositories/book_repository.dart';

/// A catalog Book by id, for naming a place's needs; `null` when unknown.
class FindBook extends UseCase<Book?, String> {
  FindBook(this._books);

  final BookRepository _books;

  @override
  Future<Book?> call(String params) => _books.findById(params);
}
