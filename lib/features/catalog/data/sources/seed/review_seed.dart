import '../../../domain/entities/book_review.dart';

/// Reader reviews for the seed catalog, keyed by book id. Books without an
/// entry show the "no reviews yet" state.
abstract final class ReviewSeed {
  static final Map<String, List<BookReview>> byBookId = {
    'bk-sapiens': [
      _r(
        'rv-1',
        'Tasnim',
        'CSE · IUT',
        5,
        0,
        'Changed how I think about money, religion and nations as shared stories.',
      ),
      _r(
        'rv-2',
        'Imran',
        'MPE · IUT',
        4,
        1,
        'Brilliant first half. The last few chapters felt rushed.',
      ),
    ],
    'bk-atomic': [
      _r(
        'rv-3',
        'Nusrat',
        'BTM · IUT',
        5,
        2,
        'The habit-stacking idea actually stuck. Short chapters, easy to reread.',
      ),
      _r(
        'rv-4',
        'Fahim',
        'EEE · IUT',
        4,
        3,
        'Repetitive in places, but the core system works.',
      ),
    ],
    'bk-cleancode': [
      _r(
        'rv-5',
        'Rafid',
        'CSE · IUT',
        5,
        1,
        'Read chapters 2 and 3 before your first group project. Seriously.',
      ),
      _r(
        'rv-6',
        'Sadia',
        'SWE · IUT',
        4,
        2,
        'Some of the Java-specific advice is dated. The principles are not.',
      ),
    ],
    'bk-fiqh': [
      _r(
        'rv-7',
        'Imran',
        'MPE · IUT',
        5,
        1,
        'Cites the evidence for each ruling, so it is easy to study with a teacher.',
      ),
    ],
    'bk-nectar': [
      _r(
        'rv-8',
        'Fahim',
        'EEE · IUT',
        5,
        3,
        'Readable and well sourced. A good first seerah.',
      ),
    ],
    'bk-riyad': [
      _r(
        'rv-9',
        'Tasnim',
        'CSE · IUT',
        5,
        0,
        'I read one chapter a night. The topical order makes it easy to return to.',
      ),
    ],
  };
}

BookReview _r(
  String id,
  String name,
  String handle,
  int rating,
  int avatarSeed,
  String text,
) => BookReview(
  id: id,
  reviewerName: name,
  reviewerHandle: handle,
  rating: rating,
  avatarSeed: avatarSeed,
  text: text,
);
