import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../models/used_options_model.dart';
import 'book_fixtures.dart';

/// Demo used copies until Arifin's used-books data is shared: Atomic Habits
/// and Sapiens have both kinds, and Calculus (its paperback is sold out)
/// has a reader listing. Every printed book gets a resale estimate.
abstract final class UsedOptionsFixtures {
  static const Map<String, UsedOptionsModel> _byBook = {
    'bk-atomic': UsedOptionsModel(
      certifiedUsed: UsedCopyModel(
        id: 'cu-atomic-1',
        priceBdt: 380,
        condition: BookCondition.veryGood,
      ),
      listings: [
        UsedCopyModel(
          id: 'ls-atomic-1',
          priceBdt: 350,
          condition: BookCondition.likeNew,
          sellerName: 'Nusrat',
          area: 'Dhanmondi',
        ),
        UsedCopyModel(
          id: 'ls-atomic-2',
          priceBdt: 300,
          condition: BookCondition.good,
          sellerName: 'Tanvir',
          area: 'Mirpur',
        ),
        UsedCopyModel(
          id: 'ls-atomic-3',
          priceBdt: 320,
          condition: BookCondition.veryGood,
          sellerName: 'Sakib',
          area: 'Uttara',
        ),
      ],
    ),
    'bk-sapiens': UsedOptionsModel(
      certifiedUsed: UsedCopyModel(
        id: 'cu-sapiens-1',
        priceBdt: 420,
        condition: BookCondition.good,
      ),
      listings: [
        UsedCopyModel(
          id: 'ls-sapiens-1',
          priceBdt: 390,
          condition: BookCondition.veryGood,
          sellerName: 'Mehedi',
          area: 'Mohammadpur',
        ),
      ],
    ),
    'bk-calculus': UsedOptionsModel(
      listings: [
        UsedCopyModel(
          id: 'ls-calculus-1',
          priceBdt: 900,
          condition: BookCondition.good,
          sellerName: 'Arif',
          area: 'Khilgaon',
        ),
      ],
    ),
  };

  static UsedOptionsModel forBook(Book book) =>
      (_byBook[book.id] ?? const UsedOptionsModel()).copyWith(
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

  /// A used copy by its id, with its book: what the fake cart adds.
  static (Book, UsedCopyModel)? copy(String id) {
    for (final MapEntry(key: bookId, value: options) in _byBook.entries) {
      final copies = [?options.certifiedUsed, ...options.listings];
      final copy = copies.where((c) => c.id == id).firstOrNull;
      if (copy != null) {
        return (BookFixtures.all.firstWhere((b) => b.id == bookId), copy);
      }
    }
    return null;
  }
}
