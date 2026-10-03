// The assistant answers from Waraqah's catalog, so the fake backend reads
// the catalog's fixtures directly (the Go backend queries the tables).
import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../catalog/data/sources/book_fixtures.dart';
import 'assistant_intent.dart';

/// A catalog Book and the Edition the assistant would buy: the cheapest
/// orderable one in the language and format asked for.
typedef AssistantPick = ({Book book, Edition edition});

/// The catalog Books that fit [intent], on the storefront and within the
/// budget. A [AssistantIntent.basket] request gets the cheapest first,
/// added while the total stays in budget (up to eight); otherwise the
/// best rated four.
List<AssistantPick> assistantPicksFor(AssistantIntent intent) {
  final picks = [
    for (final book in BookFixtures.all)
      if (!book.hidden && _fits(book, intent))
        if (_edition(book, intent) case final edition?)
          (book: book, edition: edition),
  ];
  if (!intent.basket) {
    final max = intent.maxPrice;
    return (picks
            .where((p) => max == null || p.edition.priceBdt <= max)
            .toList()
          ..sort((a, b) => b.book.rating.compareTo(a.book.rating)))
        .take(4)
        .toList();
  }
  picks.sort((a, b) => a.edition.priceBdt.compareTo(b.edition.priceBdt));
  final basket = <AssistantPick>[];
  var total = 0;
  for (final pick in picks) {
    if (basket.length == 8) break;
    final price = pick.edition.priceBdt;
    if (intent.maxPrice != null && total + price > intent.maxPrice!) continue;
    basket.add(pick);
    total += price;
  }
  return basket;
}

bool _fits(Book book, AssistantIntent intent) {
  final text = [book.title, book.author, ...book.tags].join(' ').toLowerCase();
  if (intent.isIslamic && book.categoryId != 'cat-islamic-studies') {
    return false;
  }
  if (intent.classLevel case final level? when !book.classes.contains(level)) {
    return false;
  }
  if (intent.exam case final exam? when !book.exams.contains(exam)) {
    return false;
  }
  return switch (intent.kind) {
    AssistantIntentKind.quran =>
      text.contains('quran') || text.contains('tafsir'),
    AssistantIntentKind.hadith => text.contains('hadith'),
    AssistantIntentKind.seerah =>
      text.contains('seerah') || text.contains('sealed nectar'),
    AssistantIntentKind.islamicHistory => text.contains('history'),
    AssistantIntentKind.authorSearch => book.author.toLowerCase().contains(
      intent.query.toLowerCase(),
    ),
    _ => true,
  };
}

Edition? _edition(Book book, AssistantIntent intent) {
  final editions = [
    for (final e in book.editions)
      if (e.isOrderable &&
          (intent.language == null || e.language == intent.language) &&
          (intent.format == null || e.format == intent.format))
        e,
  ]..sort((a, b) => a.priceBdt.compareTo(b.priceBdt));
  return editions.firstOrNull;
}
