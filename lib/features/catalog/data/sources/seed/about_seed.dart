/// Page counts and a short summary for the seed catalog.
///
/// A record per book id: (description, pages).
abstract final class AboutSeed {
  static const Map<String, (String, int)> byBookId = {
    'bk-sapiens': (
      'How Homo sapiens came to dominate the planet, from the cognitive '
          'revolution through farming, empire and science.',
      443,
    ),
    'bk-atomic': (
      'A practical system for building good habits and breaking bad ones '
          'through small changes that compound over time.',
      320,
    ),
    'bk-cleancode': (
      'Naming, functions, error handling and refactoring, taught through '
          'worked examples of turning messy code into readable code.',
      464,
    ),
    'bk-calculus': (
      'The standard first-year calculus text: limits, derivatives, integrals '
          'and series, with a large bank of exercises.',
      1368,
    ),
    'bk-zero': (
      'Notes on startups arguing that real progress comes from building '
          'something new rather than copying what already works.',
      224,
    ),
    'bk-fiqh': (
      'An evidence-based guide to Islamic jurisprudence on purification and '
          "prayer, drawing directly on the Qur'an and Sunnah.",
      412,
    ),
    'bk-nectar': (
      'A prize-winning biography of the Prophet ﷺ, following his life from '
          'Makkah to Madinah in chronological order.',
      560,
    ),
    'bk-riyad': (
      "Imam an-Nawawi's classic collection of hadith on character, worship "
          'and daily conduct, arranged by topic.',
      736,
    ),
  };
}
