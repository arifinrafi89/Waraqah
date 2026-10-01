import '../../../../core/models/book.dart';
import 'seed/bangla_titles.dart';
import 'seed/fiction_more_shelf.dart';
import 'seed/fiction_shelf.dart';
import 'seed/general_more_shelf.dart';
import 'seed/general_shelf.dart';
import 'seed/islamic_classics_shelf.dart';
import 'seed/islamic_history_shelf.dart';
import 'seed/islamic_scholars_shelf.dart';
import 'seed/islamic_shelf.dart';
import 'seed/prep_school_shelf.dart';
import 'seed/skills_children_shelf.dart';

/// Offline catalog used until the Go backend is deployed.
///
/// It sits behind the same repository interface as the real API, so swapping it
/// out later is a one-line change in `book_repository_impl.dart`.
// ponytail: in-place fixture lists; the Go backend owns the catalog.
abstract final class BookFixtures {
  /// Staff's admin edits change this list in place.
  static final List<Book> all = _seed();

  static List<Book> _seed() => [
    for (final book in [
      ...GeneralShelf.books,
      ...GeneralMoreShelf.books,
      ...IslamicShelf.books,
      ...IslamicScholarsShelf.books,
      ...IslamicClassicsShelf.books,
      ...IslamicHistoryShelf.books,
      ...FictionShelf.books,
      ...FictionMoreShelf.books,
      ...PrepSchoolShelf.books,
      ...SkillsChildrenShelf.books,
    ])
      book.copyWith(titleBn: BanglaTitles.byBook[book.id]),
  ];

  /// Back to the seed. Each new fake backend starts here.
  static void reset() => all
    ..clear()
    ..addAll(_seed());
}
