import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/domain/repositories/book_repository.dart';

/// A tagged Book by id, for a composer opened with `?bookId=`; `null` when
/// unknown.
class GetTagBook extends UseCase<Book?, String> {
  GetTagBook(this._books);

  final BookRepository _books;

  @override
  Future<Book?> call(String params) => _books.findById(params);
}
