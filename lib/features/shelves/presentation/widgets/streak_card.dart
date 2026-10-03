import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/reading_stats.dart';

/// Days in a row the reader read, and whether today counts yet.
class StreakCard extends StatelessWidget {
  const StreakCard({super.key, required this.stats});

  final ReadingStats stats;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final days = stats.streakDays;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Row(
        spacing: Insets.md,
        children: [
          Icon(
            Icons.local_fire_department_rounded,
            size: 32,
            color: days > 0 ? palette.accent : palette.textFaint,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  days > 0 ? l10n.readingStreak(days) : l10n.readingStreakNone,
                  style: context.texts.titleSmall,
                ),
                Text(
                  stats.readToday
                      ? l10n.readingStreakToday
                      : l10n.readingStreakNotYet,
                  style: AppFonts.ui(size: 12.5, color: palette.textDim),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
