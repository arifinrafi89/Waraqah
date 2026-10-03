// Stats name each Category, so this reads the catalog's fixtures directly
// (the Go backend joins the tables).
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../catalog/data/sources/category_fixtures.dart';
import '../../domain/entities/progress_rules.dart';
import '../../domain/entities/shelf_entry.dart';
import 'shelf_seed.dart';

/// The days "me" read and their yearly goal, and the stats built from
/// them and the shelves.
class ReadingLog {
  ReadingLog(DateTime now) : days = ShelfSeed.readingDays(now);

  final Set<DateTime> days;
  int? goal = ShelfSeed.goal;

  void readOn(DateTime at) => days.add(DateTime(at.year, at.month, at.day));

  Map<String, dynamic> statsJson(
    Map<String, ShelfRecord> entries,
    DateTime now,
  ) {
    final perMonth = List.filled(12, 0);
    final byCategory = <String, int>{};
    for (final MapEntry(key: bookId, value: r) in entries.entries) {
      final at = r.finishedAt;
      if (r.shelf != Shelf.finished || at == null || at.year != now.year) {
        continue;
      }
      perMonth[at.month - 1]++;
      final book = BookFixtures.all.where((b) => b.id == bookId).firstOrNull;
      if (book != null) {
        byCategory.update(book.categoryId, (n) => n + 1, ifAbsent: () => 1);
      }
    }
    final top = byCategory.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final today = DateTime(now.year, now.month, now.day);
    return {
      'year': now.year,
      'goal': goal,
      'finishedThisYear': perMonth.fold(0, (a, b) => a + b),
      'streakDays': ProgressRules.streak(days, now),
      'readToday': days.contains(today),
      'perMonth': perMonth,
      'topCategories': [
        for (final MapEntry(:key, :value) in top.take(3))
          if (CategoryFixtures.all.where((c) => c.id == key).firstOrNull
              case final c?)
            {'nameEn': c.nameEn, 'nameBn': c.nameBn, 'count': value},
      ],
    };
  }
}
