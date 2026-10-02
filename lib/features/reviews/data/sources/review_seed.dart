import 'review_record.dart';

/// Readers' reviews on a fresh start (moved from the catalog's stand-in),
/// a few days before `now`.
List<ReviewRecord> reviewSeed(DateTime now) {
  var n = 0;
  ReviewRecord r(
    String book,
    String author,
    int stars,
    String text, [
    bool verified = false,
  ]) => ReviewRecord(
    id: 'rv-${++n}',
    bookId: book,
    authorId: author,
    stars: stars,
    text: text,
    createdAt: now.subtract(Duration(days: 30 - n * 2)),
    verified: verified,
  );
  return [
    r(
      'bk-sapiens',
      'p-nabila',
      5,
      'Changed how I think about money, religion and nations as shared stories.',
      true,
    ),
    r(
      'bk-sapiens',
      'p-arif',
      4,
      'Brilliant first half. The last few chapters felt rushed.',
    ),
    r(
      'bk-atomic',
      'p-sadia',
      5,
      'The habit-stacking idea actually stuck. Short chapters, easy to reread.',
      true,
    ),
    r(
      'bk-atomic',
      'p-talha',
      4,
      'Repetitive in places, but the core system works.',
    ),
    r(
      'bk-cleancode',
      'p-tanvir',
      5,
      'Read chapters 2 and 3 before your first group project. Seriously.',
      true,
    ),
    r(
      'bk-cleancode',
      'p-rakib',
      4,
      'Some of the Java-specific advice is dated. The principles are not.',
    ),
    r(
      'bk-fiqh',
      'p-arif',
      5,
      'Cites the evidence for each ruling, so it is easy to study with a teacher.',
    ),
    r(
      'bk-nectar',
      'p-talha',
      5,
      'Readable and well sourced. A good first seerah.',
      true,
    ),
    r(
      'bk-riyad',
      'p-nabila',
      5,
      'I read one chapter a night. The topical order makes it easy to return to.',
    ),
  ];
}
