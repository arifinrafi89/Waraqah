// The catalog's book page and the cart sell these copies.
import '../../../catalog/data/models/used_options_model.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';

/// Waraqah's Certified Used copies on the fake backend: books bought back
/// through Sell Back, graded and published. The book page offers the
/// cheapest copy of each Book, and the cart sells it.
abstract final class CertifiedUsedStock {
  static final Map<String, List<UsedCopyModel>> _byBook = _seed();

  static Map<String, List<UsedCopyModel>> _seed() => {
    'bk-atomic': [
      const UsedCopyModel(
        id: 'cu-atomic-1',
        priceBdt: 380,
        condition: BookCondition.veryGood,
      ),
    ],
    'bk-sapiens': [
      const UsedCopyModel(
        id: 'cu-sapiens-1',
        priceBdt: 420,
        condition: BookCondition.good,
      ),
    ],
  };

  /// Back to the demo stock. Each new fake backend starts here, so tests
  /// don't see each other's copies.
  static void reset() => _byBook
    ..clear()
    ..addAll(_seed());

  /// The cheapest copy of a Book, if Waraqah has one.
  static UsedCopyModel? forBook(String bookId) {
    final copies = [...?_byBook[bookId]]
      ..sort((a, b) => a.priceBdt.compareTo(b.priceBdt));
    return copies.firstOrNull;
  }

  /// A copy by its id, with its Book's id.
  static (String, UsedCopyModel)? copy(String id) {
    for (final MapEntry(key: bookId, value: copies) in _byBook.entries) {
      for (final copy in copies) {
        if (copy.id == id) return (bookId, copy);
      }
    }
    return null;
  }

  /// A graded Sell Back book goes on sale.
  static UsedCopyModel publish(
    String bookId,
    int priceBdt,
    BookCondition condition,
  ) {
    final copies = _byBook.putIfAbsent(bookId, () => []);
    final copy = UsedCopyModel(
      id: 'cu-${bookId.replaceFirst('bk-', '')}-${copies.length + 1}',
      priceBdt: priceBdt,
      condition: condition,
    );
    copies.add(copy);
    return copy;
  }
}
