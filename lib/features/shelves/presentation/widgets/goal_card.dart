import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/reading_stats.dart';
import 'goal_dialog.dart';
import 'progress_actions.dart';

/// This year's goal: Books finished of the goal, and Set or Change goal.
class GoalCard extends ConsumerWidget {
  const GoalCard({super.key, required this.stats});

  final ReadingStats stats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final goal = stats.goal;
    final done = stats.finishedThisYear;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          Text(
            l10n.readingGoalTitle(stats.year),
            style: context.texts.titleSmall,
          ),
          if (goal != null) ...[
            LinearProgressIndicator(
              value: (done / goal).clamp(0, 1),
              minHeight: 8,
              color: palette.accent,
              backgroundColor: palette.surface2,
              borderRadius: BorderRadius.circular(4),
            ),
            Text(
              l10n.readingGoalProgress(done, goal),
              style: AppFonts.ui(size: 13, color: palette.textDim),
            ),
          ] else
            Text(
              l10n.readingGoalNone(done),
              style: AppFonts.ui(size: 13, color: palette.textDim),
            ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton(
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final picked = await showGoalDialog(context, goal);
                if (picked != null && !await ref.setReadingGoal(picked)) {
                  messenger.showSnackBar(
                    SnackBar(content: Text(l10n.commonSomethingWentWrong)),
                  );
                }
              },
              child: Text(
                goal == null ? l10n.readingGoalSet : l10n.readingGoalChange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
