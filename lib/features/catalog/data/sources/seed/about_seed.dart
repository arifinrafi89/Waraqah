/// Publication facts and a short summary for the seed catalog.
///
/// A record per book id: (description, pages, publisher).
abstract final class AboutSeed {
  static const Map<String, (String, int, String)> byBookId = {
    'bk-sapiens': (
      'How Homo sapiens came to dominate the planet, from the cognitive '
          'revolution through farming, empire and science.',
      443,
      'Harper',
    ),
    'bk-atomic': (
      'A practical system for building good habits and breaking bad ones '
          'through small changes that compound over time.',
      320,
      'Avery',
    ),
    'bk-cleancode': (
      'Naming, functions, error handling and refactoring, taught through '
          'worked examples of turning messy code into readable code.',
      464,
      'Prentice Hall',
    ),
    'bk-calculus': (
      'The standard first-year calculus text: limits, derivatives, integrals '
          'and series, with a large bank of exercises.',
      1368,
      'Cengage',
    ),
    'bk-zero': (
      'Notes on startups arguing that real progress comes from building '
          'something new rather than copying what already works.',
      224,
      'Crown Business',
    ),
    'bk-fiqh': (
      'An evidence-based guide to Islamic jurisprudence on purification and '
          "prayer, drawing directly on the Qur'an and Sunnah.",
      412,
      'American Trust Publications',
    ),
    'bk-nectar': (
      'A prize-winning biography of the Prophet ﷺ, following his life from '
          'Makkah to Madinah in chronological order.',
      560,
      'Darussalam',
    ),
    'bk-riyad': (
      "Imam an-Nawawi's classic collection of hadith on character, worship "
          'and daily conduct, arranged by topic.',
      736,
      'Darussalam',
    ),
  };
}
