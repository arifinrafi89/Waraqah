import 'bite_fixture_texts.dart';
import 'bite_records.dart';

/// The demo feed on a fresh start, a few hours or days before `now`: Bites
/// by marketplace readers about real catalog Books, two by "me", one
/// spoiler, a few comments with replies. "me" already likes two.
abstract final class BiteFixtures {
  static ({List<BiteRecord> bites, List<CommentRecord> comments}) seed(
    DateTime now,
  ) {
    DateTime ago(int hours) => now.subtract(Duration(hours: hours));
    BiteRecord bite(
      String id,
      String author,
      int hours, {
      String? book,
      bool spoiler = false,
      Set<String> likes = const {},
    }) => BiteRecord(
      id: id,
      authorId: author,
      text: biteFixtureTexts[id]!,
      createdAt: ago(hours),
      bookId: book,
      spoiler: spoiler,
      likedBy: {...likes},
    );
    CommentRecord comment(
      String id,
      String bite,
      String author, [
      String? to,
    ]) => CommentRecord(
      id: id,
      biteId: bite,
      authorId: author,
      text: biteFixtureTexts[id]!,
      createdAt: ago(1),
      parentId: to,
    );
    return (
      bites: [
        bite('bt-1', 'p-tanvir', 1, book: 'bk-sapiens', likes: _three),
        bite('bt-me-1', 'me', 2, book: 'bk-atomic', likes: {'p-tanvir'}),
        bite(
          'bt-2',
          'p-nabila',
          3,
          book: 'bk-nectar',
          likes: {'me', 'p-sadia'},
        ),
        bite('bt-spoiler', 'p-mahi', 5, book: 'bk-davinci', spoiler: true),
        bite('bt-3', 'p-rafi', 6),
        bite('bt-4', 'p-talha', 8, book: 'bk-riyad', likes: {'me', 'p-arif'}),
        bite('bt-5', 'p-arif', 11, book: 'bk-cleancode'),
        bite('bt-6', 'p-rakib', 20, book: 'bk-muqaddimah', likes: {'p-talha'}),
        bite('bt-7', 'p-sadia', 26, book: 'bk-alchemist'),
        bite('bt-me-2', 'me', 30, book: 'bk-hobbit'),
        bite('bt-8', 'p-tanvir', 40, book: 'bk-hpstone', likes: {'p-mahi'}),
        bite('bt-9', 'p-nabila', 52, book: 'bk-fiqh'),
        bite('bt-10', 'p-talha', 70, book: 'bk-sherlock'),
        bite('bt-11', 'p-arif', 96),
      ],
      comments: [
        comment('cm-1', 'bt-1', 'p-nabila'),
        comment('cm-2', 'bt-1', 'p-tanvir', 'cm-1'),
        comment('cm-3', 'bt-1', 'p-arif'),
        comment('cm-4', 'bt-me-1', 'p-nabila'),
        comment('cm-5', 'bt-2', 'p-sadia'),
        comment('cm-6', 'bt-2', 'p-nabila', 'cm-5'),
      ],
    );
  }

  static const _three = {'p-arif', 'p-nabila', 'p-mahi'};
}
