// Delivered orders put their Books on the reader's shelves, and an entry
// carries its Book, so this reads the orders and catalog fixtures directly
// (the Go backend joins the tables).
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../orders/data/sources/order_fake_store.dart';
import '../../../orders/domain/entities/order_status.dart';
import '../../domain/entities/shelf_entry.dart';
import '../models/shelf_entry_model.dart';
import 'shelf_seed.dart';

/// "Me"'s shelves on the fake backend. Each Book from a delivered order
/// goes on Want to Read once; the reader can move or remove it after.
class ShelfFakeStore {
  ShelfFakeStore(this.orders, {DateTime Function()? clock})
    : _now = clock ?? DateTime.now {
    _entries.addAll(ShelfSeed.entries(_now()));
  }

  final OrderFakeStore orders;
  final DateTime Function() _now;

  /// By Book id.
  final Map<String, ShelfRecord> _entries = {};
  final Set<String> _fromOrders = {};

  /// Newest first; only Books still in the catalog.
  List<Map<String, dynamic>> mine() {
    _addDelivered();
    final records = _entries.entries.toList()
      ..sort((a, b) => b.value.addedAt.compareTo(a.value.addedAt));
    return [
      for (final MapEntry(key: id, value: r) in records)
        if (BookFixtures.all.where((b) => b.id == id).firstOrNull
            case final book?)
          ShelfEntryModel(
            book: book,
            shelf: r.shelf,
            addedAt: r.addedAt,
            finishedAt: r.finishedAt,
          ).toJson(),
    ];
  }

  /// `false` for a Book the catalog doesn't have.
  bool move(String bookId, Shelf? shelf) {
    if (!BookFixtures.all.any((b) => b.id == bookId)) return false;
    _addDelivered();
    if (shelf == null) {
      _entries.remove(bookId);
      return true;
    }
    final old = _entries[bookId];
    if (old?.shelf == shelf) return true;
    final now = _now();
    _entries[bookId] = ShelfRecord(
      shelf,
      addedAt: now,
      finishedAt: shelf == Shelf.finished ? now : null,
    );
    return true;
  }

  /// Books "me" finished, for Profile's count.
  int get finishedCount =>
      _entries.values.where((r) => r.shelf == Shelf.finished).length;

  void _addDelivered() {
    for (final order in orders.all) {
      if (order.status != OrderStatus.delivered ||
          order.isDonation ||
          order.gift != null) {
        continue;
      }
      final at = order.history.lastOrNull?.at ?? order.placedAt;
      for (final line in order.lines) {
        if (!_fromOrders.add(line.bookId)) continue;
        _entries.putIfAbsent(
          line.bookId,
          () => ShelfRecord(Shelf.wantToRead, addedAt: at),
        );
      }
    }
  }
}
