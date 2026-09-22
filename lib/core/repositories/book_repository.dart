import '../models/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
}
