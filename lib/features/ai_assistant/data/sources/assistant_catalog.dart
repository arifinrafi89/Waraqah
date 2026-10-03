// The assistant answers from Waraqah's catalog, so the fake backend reads
// the catalog's fixtures directly (the Go backend queries the tables).
import '../../../../core/models/book.dart';
import '../../../catalog/data/sources/book_fixtures.dart';
import 'assistant_intent.dart';

/// The catalog Books that fit [intent]: on the storefront, within the
/// budget, best rated first, at most four.
List<Book> assistantBooksFor(AssistantIntent intent) {
  bool fits(Book book) {
    final text = [
      book.title,
      book.author,
      ...book.tags,
    ].join(' ').toLowerCase();
    if (intent.isIslamic && book.categoryId != 'cat-islamic-studies') {
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

  final found = [
    for (final book in BookFixtures.all)
      if (!book.hidden &&
          fits(book) &&
          (intent.maxPrice == null || book.fromPriceBdt <= intent.maxPrice!))
        book,
  ]..sort((a, b) => b.rating.compareTo(a.rating));
  return found.take(4).toList();
}
