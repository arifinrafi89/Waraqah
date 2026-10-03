import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/domain/repositories/book_repository.dart';

/// The catalog Book a reply recommends; `null` when it's gone.
class FindRecommendedBook extends UseCase<Book?, String> {
  FindRecommendedBook(this._books);

  final BookRepository _books;

  @override
  Future<Book?> call(String params) => _books.findById(params);
}
