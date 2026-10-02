import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shelf_providers.dart';

class ReadingStats {
  const ReadingStats({
    required this.yearlyGoal,
    required this.finishedBooks,
    required this.streakDays,
    required this.booksPerMonth,
    required this.favoriteCategories,
  });

  final int yearlyGoal;
  final int finishedBooks;
  final int streakDays;
  final Map<String, int> booksPerMonth;
  final Map<String, int> favoriteCategories;

  double get goalProgress =>
      (finishedBooks / yearlyGoal).clamp(0, 1).toDouble();
}

final readingStatsProvider = Provider<ReadingStats>((ref) {
  final shelves = ref.watch(shelvesProvider).asData?.value ?? const [];
  final finished = shelves
      .where((entry) => entry.status.name == 'finished')
      .length;
  return ReadingStats(
    yearlyGoal: 12,
    finishedBooks: finished,
    streakDays: 6,
    booksPerMonth: const {
      'Jan': 1,
      'Feb': 0,
      'Mar': 1,
      'Apr': 0,
      'May': 0,
      'Jun': 1,
      'Jul': 0,
      'Aug': 0,
      'Sep': 1,
      'Oct': 0,
      'Nov': 0,
      'Dec': 0,
    },
    favoriteCategories: const {
      'Non-fiction': 4,
      'Islamic Studies': 3,
      'Self-help': 2,
    },
  );
});
