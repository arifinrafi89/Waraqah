import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../profile/profile_routes.dart';
import '../providers/reading_stats_providers.dart';

class ReadingStatsPage extends ConsumerWidget {
  const ReadingStatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final stats = ref.watch(readingStatsProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 10),
              child: Row(
                spacing: Insets.md,
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.canPop()
                        ? context.pop()
                        : context.go(ProfileRoutes.profile),
                  ),
                  Text(l10n.readingStatsTitle, style: context.texts.titleLarge),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(Insets.screen),
                children: [
                  _GoalCard(stats: stats),
                  const SizedBox(height: Insets.xl),
                  _StreakCard(days: stats.streakDays),
                  const SizedBox(height: Insets.xl),
                  SectionHeader(title: l10n.readingBooksPerMonth),
                  _MonthChart(values: stats.booksPerMonth),
                  const SizedBox(height: Insets.xl),
                  SectionHeader(title: l10n.readingFavoriteCategories),
                  _CategoryList(values: stats.favoriteCategories),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.stats});

  final ReadingStats stats;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.sm,
        children: [
          Text(l10n.readingYearlyGoal, style: context.texts.titleMedium),
          Text(
            l10n.readingGoalCount(stats.finishedBooks, stats.yearlyGoal),
            style: AppFonts.numeric(size: 22, color: context.palette.text),
          ),
          LinearProgressIndicator(value: stats.goalProgress),
        ],
      ),
    );
  }
}

class _StreakCard extends StatelessWidget {
  const _StreakCard({required this.days});

  final int days;

  @override
  Widget build(BuildContext context) => SurfaceCard(
    padding: const EdgeInsets.all(Insets.lg),
    child: Row(
      spacing: Insets.md,
      children: [
        Icon(
          Icons.local_fire_department_rounded,
          color: context.palette.accent,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppL10n.of(context)!.readingStreak,
              style: context.texts.titleSmall,
            ),
            Text(
              AppL10n.of(context)!.readingDays(days),
              style: AppFonts.numeric(size: 20, color: context.palette.text),
            ),
          ],
        ),
      ],
    ),
  );
}

class _MonthChart extends StatelessWidget {
  const _MonthChart({required this.values});

  final Map<String, int> values;

  @override
  Widget build(BuildContext context) {
    final maxValue = values.values.fold<int>(
      1,
      (max, value) => value > max ? value : max,
    );
    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final entry in values.entries)
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 13,
                  height: 80 * entry.value / maxValue + 4,
                  decoration: BoxDecoration(
                    color: context.palette.accent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  entry.key,
                  style: AppFonts.ui(size: 9, color: context.palette.textFaint),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({required this.values});

  final Map<String, int> values;

  @override
  Widget build(BuildContext context) => Column(
    spacing: Insets.sm,
    children: [
      for (final entry in values.entries)
        Row(
          children: [
            Expanded(child: Text(entry.key)),
            Text(
              '${entry.value}',
              style: AppFonts.numeric(size: 15, color: context.palette.accent),
            ),
          ],
        ),
    ],
  );
}
