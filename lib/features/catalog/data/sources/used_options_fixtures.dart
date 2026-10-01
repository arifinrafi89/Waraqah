import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
// Waraqah's used stock is Sell Back's (the fake backend shares it).
import '../../../sell_back/data/sources/certified_used_stock.dart';
import '../models/used_options_model.dart';
import 'book_fixtures.dart';

/// Certified Used copies come from Waraqah's stock of graded Sell Back
/// books (Arifin's `CertifiedUsedStock`). Every printed book gets a resale
/// estimate.
abstract final class UsedOptionsFixtures {
  static UsedOptionsModel forBook(Book book) => UsedOptionsModel(
    certifiedUsed: CertifiedUsedStock.forBook(book.id),
    resaleValueBdt: resaleValue(book),
  );

  /// About 45% of the cheapest printed edition, to the nearest ৳10. `null`
  /// for eBook-only books, which can't be resold.
  static int? resaleValue(Book book) {
    final printed = book.editions.where((e) => e.format != BookFormat.ebook);
    if (printed.isEmpty) return null;
    final cheapest = printed
        .map((e) => e.priceBdt)
        .reduce((a, b) => a < b ? a : b);
    return (cheapest * 0.45 / 10).round() * 10;
  }

  /// A Certified Used copy by its id, with its book: what the fake cart adds.
  static (Book, UsedCopyModel)? copy(String id) {
    final found = CertifiedUsedStock.copy(id);
    if (found == null) return null;
    final (bookId, copy) = found;
    return (BookFixtures.all.firstWhere((b) => b.id == bookId), copy);
  }
}
