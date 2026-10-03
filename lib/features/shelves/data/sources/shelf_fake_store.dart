// Delivered orders put their Books on the reader's shelves, and an entry
// carries its Book, so this reads the orders and catalog fixtures directly
// (the Go backend joins the tables).
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../orders/data/sources/order_fake_store.dart';
import '../../../orders/domain/entities/order_status.dart';
import '../../domain/entities/shelf_entry.dart';
import '../models/shelf_entry_model.dart';
import '../../domain/entities/progress_rules.dart';
import 'reading_log.dart';
import 'shelf_seed.dart';

/// "Me"'s shelves on the fake backend. Each Book from a delivered order
/// goes on Want to Read once; the reader can move or remove it after.
class ShelfFakeStore {
  ShelfFakeStore(this.orders, {DateTime Function()? clock})
    : _now = clock ?? DateTime.now {
    _entries.addAll(ShelfSeed.entries(_now()));
  }

  late final ReadingLog log = ReadingLog(_now());

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
            progress: r.progress,
            pagesRead: r.pagesRead,
            totalPages: r.totalPages,
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
      progress: shelf == Shelf.finished ? 100 : (old?.progress ?? 0),
      pagesRead: old?.pagesRead,
      totalPages: old?.totalPages,
    );
    return true;
  }

  /// Saves how far the reader got, which puts the Book on Reading (or
  /// Finished at 100%) and counts today as a reading day. `false` when
  /// the update breaks [ProgressRules] or the Book isn't on a shelf.
  bool progress(ProgressUpdate update) {
    final old = _entries[update.bookId];
    if (old == null || ProgressRules.check(update) != null) return false;
    final percent = update.totalPages == null
        ? update.percent
        : ProgressRules.percentOf(update.pagesRead!, update.totalPages!);
    final now = _now();
    final done = percent == 100;
    _entries[update.bookId] = ShelfRecord(
      done ? Shelf.finished : Shelf.reading,
      addedAt: old.shelf == Shelf.reading ? old.addedAt : now,
      finishedAt: done ? now : null,
      progress: percent,
      pagesRead: update.pagesRead,
      totalPages: update.totalPages,
    );
    if (percent > old.progress) log.readOn(now);
    return true;
  }

  Map<String, dynamic> statsJson() => log.statsJson(_entries, _now());

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
