import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/reading_providers.dart';
import '../widgets/goal_card.dart';
import '../widgets/month_bars.dart';
import '../widgets/shelves_app_bar.dart';
import '../widgets/stats_skeleton.dart';
import '../widgets/streak_card.dart';
import '../widgets/top_categories.dart';

/// `/shelves/stats`: the year's goal, the streak, Books finished per
/// month and favourite Categories.
class ReadingStatsPage extends ConsumerWidget {
  const ReadingStatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ShelvesAppBar(title: l10n.readingStatsTitle),
            Expanded(
              child: AsyncView(
                value: ref.watch(readingStatsProvider),
                skeleton: const StatsSkeleton(),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(readingStatsProvider),
                builder: (stats) => ListView(
                  padding: const EdgeInsets.all(Insets.screen),
                  children: [
                    GoalCard(stats: stats),
                    const SizedBox(height: Insets.md),
                    StreakCard(stats: stats),
                    const SizedBox(height: Insets.md),
                    MonthBars(year: stats.year, perMonth: stats.perMonth),
                    const SizedBox(height: Insets.md),
                    TopCategories(categories: stats.topCategories),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
