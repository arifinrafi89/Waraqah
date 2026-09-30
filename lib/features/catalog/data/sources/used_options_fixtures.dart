import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../models/used_options_model.dart';
import 'book_fixtures.dart';

/// Demo Certified Used copies until Arifin's Sell Back / Certified Used
/// data is shared: Atomic Habits and Sapiens have one each. Every printed
/// book gets a resale estimate.
abstract final class UsedOptionsFixtures {
  static const Map<String, UsedCopyModel> _certified = {
    'bk-atomic': UsedCopyModel(
      id: 'cu-atomic-1',
      priceBdt: 380,
      condition: BookCondition.veryGood,
    ),
    'bk-sapiens': UsedCopyModel(
      id: 'cu-sapiens-1',
      priceBdt: 420,
      condition: BookCondition.good,
    ),
  };

  static UsedOptionsModel forBook(Book book) => UsedOptionsModel(
    certifiedUsed: _certified[book.id],
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
    for (final MapEntry(key: bookId, value: copy) in _certified.entries) {
      if (copy.id == id) {
        return (BookFixtures.all.firstWhere((b) => b.id == bookId), copy);
      }
    }
    return null;
  }
}
