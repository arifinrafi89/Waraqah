import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/points_account.dart';

/// One line of points history: why, which order, when, and +/- points.
class PointsEntryTile extends StatelessWidget {
  const PointsEntryTile({super.key, required this.entry});

  final PointsEntry entry;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final date = DateFormat.yMMMd(
      Localizations.localeOf(context).toLanguageTag(),
    ).format(entry.at);
    final why = switch (entry.reason) {
      PointsReason.welcome => l10n.pointsWelcome,
      PointsReason.earned => l10n.pointsEarnedOn(entry.orderNumber ?? ''),
      PointsReason.spent => l10n.pointsSpentOn(entry.orderNumber ?? ''),
      PointsReason.refunded => l10n.pointsRefunded(entry.orderNumber ?? ''),
      PointsReason.reversed => l10n.pointsReversed(entry.orderNumber ?? ''),
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.sm),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(why, style: context.texts.titleSmall),
                Text(
                  date,
                  style: AppFonts.ui(size: 11, color: palette.textFaint),
                ),
              ],
            ),
          ),
          Text(
            entry.points > 0 ? '+${entry.points}' : '${entry.points}',
            style: AppFonts.numeric(
              size: 14,
              color: entry.points > 0 ? palette.accent : palette.textDim,
            ),
          ),
        ],
      ),
    );
  }
}
