import '../../../../core/models/book.dart';
import 'seed/fiction_more_shelf.dart';
import 'seed/fiction_shelf.dart';
import 'seed/general_more_shelf.dart';
import 'seed/general_shelf.dart';
import 'seed/islamic_classics_shelf.dart';
import 'seed/islamic_history_shelf.dart';
import 'seed/islamic_scholars_shelf.dart';
import 'seed/islamic_shelf.dart';

/// Offline catalog used until the Go backend is deployed.
///
/// It sits behind the same repository interface as the real API, so swapping it
/// out later is a one-line change in `book_repository_impl.dart`.
abstract final class BookFixtures {
  static const List<Book> all = [
    ...GeneralShelf.books,
    ...GeneralMoreShelf.books,
    ...IslamicShelf.books,
    ...IslamicScholarsShelf.books,
    ...IslamicClassicsShelf.books,
    ...IslamicHistoryShelf.books,
    ...FictionShelf.books,
    ...FictionMoreShelf.books,
  ];
}
