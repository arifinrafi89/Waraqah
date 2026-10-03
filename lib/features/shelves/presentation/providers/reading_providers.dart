import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/reading_stats.dart';
import '../../domain/usecases/get_reading_stats.dart';
import '../../domain/usecases/set_reading_goal.dart';
import '../../domain/usecases/update_progress.dart';
import 'shelf_providers.dart';

final updateProgressProvider = Provider<UpdateProgress>(
  (ref) => UpdateProgress(ref.watch(shelfRepositoryProvider)),
);

final getReadingStatsProvider = Provider<GetReadingStats>(
  (ref) => GetReadingStats(ref.watch(shelfRepositoryProvider)),
);

final setReadingGoalProvider = Provider<SetReadingGoal>(
  (ref) => SetReadingGoal(ref.watch(shelfRepositoryProvider)),
);

/// The reader's year in books. Reloaded when the shelves change.
final readingStatsProvider = FutureProvider<ReadingStats>((ref) {
  ref.watch(shelvesProvider);
  return ref.watch(getReadingStatsProvider).call(const NoParams());
});
