import '../../../../core/models/book.dart';
import 'seed/general_shelf.dart';
import 'seed/islamic_shelf.dart';

/// Offline catalog used until the Go backend is deployed.
///
/// It sits behind the same repository interface as the real API, so swapping it
/// out later is a one-line change in `book_repository_impl.dart`.
abstract final class BookFixtures {
  static const List<Book> all = [
    ...GeneralShelf.books,
    ...IslamicShelf.books,
  ];
}
