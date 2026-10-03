import '../../domain/entities/shelf_entry.dart';

/// One Book on a shelf, as the fake backend keeps it.
class ShelfRecord {
  ShelfRecord(this.shelf, {required this.addedAt, this.finishedAt});

  final Shelf shelf;
  final DateTime addedAt;
  final DateTime? finishedAt;
}

/// "Me"'s shelves before the app's own records: one book on the go and two
/// finished. Delivered orders add the rest.
abstract final class ShelfSeed {
  static Map<String, ShelfRecord> entries(DateTime now) => {
    'bk-hobbit': ShelfRecord(
      Shelf.reading,
      addedAt: now.subtract(const Duration(days: 9)),
    ),
    'bk-alchemist': ShelfRecord(
      Shelf.finished,
      addedAt: now.subtract(const Duration(days: 40)),
      finishedAt: now.subtract(const Duration(days: 30)),
    ),
    'bk-sherlock': ShelfRecord(
      Shelf.finished,
      addedAt: now.subtract(const Duration(days: 80)),
      finishedAt: now.subtract(const Duration(days: 62)),
    ),
    'bk-cleancode': ShelfRecord(
      Shelf.wantToRead,
      addedAt: now.subtract(const Duration(days: 3)),
    ),
  };
}
