import 'shelf_entry.dart';

enum ProgressProblem { badPercent, badPages }

/// What a progress update needs, checked in the app and by the server.
abstract final class ProgressRules {
  static const int maxPages = 5000;
  static const int minGoal = 1;
  static const int maxGoal = 365;

  /// The percentage [pagesRead] of [totalPages] is, rounded down.
  static int percentOf(int pagesRead, int totalPages) =>
      totalPages <= 0 ? 0 : (pagesRead * 100 ~/ totalPages).clamp(0, 100);

  /// `null` when [update] can be saved.
  static ProgressProblem? check(ProgressUpdate update) {
    final (:bookId, :percent, :pagesRead, :totalPages) = update;
    if (pagesRead != null || totalPages != null) {
      if (pagesRead == null ||
          totalPages == null ||
          totalPages < 1 ||
          totalPages > maxPages ||
          pagesRead < 0 ||
          pagesRead > totalPages) {
        return ProgressProblem.badPages;
      }
    }
    if (percent < 0 || percent > 100) return ProgressProblem.badPercent;
    return null;
  }

  static bool goalIsValid(int goal) => goal >= minGoal && goal <= maxGoal;

  /// Days in a row the reader read, ending today, or yesterday when they
  /// haven't read yet today.
  static int streak(Set<DateTime> days, DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    var day = days.contains(today)
        ? today
        : today.subtract(const Duration(days: 1));
    var count = 0;
    while (days.contains(day)) {
      count++;
      day = DateTime(day.year, day.month, day.day - 1);
    }
    return count;
  }
}
