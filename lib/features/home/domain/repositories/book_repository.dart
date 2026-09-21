import '../models/book.dart';

abstract class BookRepository {
  List<Book> getBooks();
}
