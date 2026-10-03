import '../../domain/entities/shelf_entry.dart';

/// One Book on a shelf, as the fake backend keeps it.
class ShelfRecord {
  ShelfRecord(
    this.shelf, {
    required this.addedAt,
    this.finishedAt,
    this.progress = 0,
    this.pagesRead,
    this.totalPages,
  });

  final Shelf shelf;
  final DateTime addedAt;
  final DateTime? finishedAt;
  final int progress;
  final int? pagesRead;
  final int? totalPages;
}

/// "Me"'s shelves before the app's own records: one book on the go and
/// four finished this year. Delivered orders add the rest.
abstract final class ShelfSeed {
  static Map<String, ShelfRecord> entries(DateTime now) {
    DateTime ago(int days) => now.subtract(Duration(days: days));
    ShelfRecord done(int days) => ShelfRecord(
      Shelf.finished,
      addedAt: ago(days + 12),
      finishedAt: ago(days),
      progress: 100,
    );
    return {
      'bk-hobbit': ShelfRecord(
        Shelf.reading,
        addedAt: ago(9),
        progress: 42,
        pagesRead: 130,
        totalPages: 310,
      ),
      'bk-alchemist': done(30),
      'bk-sherlock': done(62),
      'bk-zero': done(120),
      'bk-pragmatic': done(150),
      'bk-cleancode': ShelfRecord(Shelf.wantToRead, addedAt: ago(3)),
    };
  }

  /// The days "me" read before: the last three, so a streak is running.
  static Set<DateTime> readingDays(DateTime now) => {
    for (var i = 1; i <= 3; i++) DateTime(now.year, now.month, now.day - i),
  };

  static const int goal = 12;
}
