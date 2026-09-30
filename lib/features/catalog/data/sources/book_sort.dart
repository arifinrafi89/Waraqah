import '../../../../core/models/book.dart';
import '../../domain/entities/catalog_filters.dart';

/// Fake-API sort orders. The real backend does this server-side too.
abstract final class BookSort {
  /// Copies sold in the last 30 days, per new Edition (used copies are not
  /// counted). Editions missing here sold none.
  static const Map<String, int> sales30Days = {
    'bk-atomic-pb-en': 140,
    'bk-atomic-hc-en': 35,
    'bk-sapiens-pb-en': 90,
    'bk-sapiens-pb-bn': 60,
    'bk-hpstone-pb-en': 120,
    'bk-zero-pb-bn': 75,
    'bk-nectar-pb-bn': 110,
    'bk-riyad-hc-bn': 40,
    'bk-hobbit-pb-en': 30,
    'bk-cleancode-pb-en': 25,
    'bk-bcs-guide-pb-bn': 80,
    'bk-admission-guide-pb-bn': 45,
  };

  static int sold(Book book) =>
      book.editions.fold(0, (sum, e) => sum + (sales30Days[e.id] ?? 0));

  /// [books] ordered by [sort] (a [SearchSort] name). `relevance`, unknown or
  /// `null` keeps [books] as given.
  static List<Book> apply(List<Book> books, String? sort) {
    final sorted = [...books];
    switch (sort) {
      case 'priceLow':
        sorted.sort((a, b) => a.fromPriceBdt.compareTo(b.fromPriceBdt));
      case 'priceHigh':
        sorted.sort((a, b) => b.fromPriceBdt.compareTo(a.fromPriceBdt));
      case 'newest':
        sorted.sort((a, b) => b.addedAt.compareTo(a.addedAt));
      case 'bestselling':
        sorted.sort((a, b) => sold(b).compareTo(sold(a)));
    }
    return sorted;
  }
}
