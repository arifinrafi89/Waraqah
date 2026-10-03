import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';

/// A titled, numbered list: what each row is, and how many.
class DashboardRankedList extends StatelessWidget {
  const DashboardRankedList({
    super.key,
    required this.title,
    required this.rows,
  });

  final String title;

  /// Label, then the count in words.
  final List<(String, String)> rows;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final dim = AppFonts.ui(size: 12.5, color: palette.textDim);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          Text(title, style: context.texts.titleSmall),
          if (rows.isEmpty)
            Text(AppL10n.of(context)!.adminDashboardNone, style: dim),
          for (final (i, (label, count)) in rows.indexed)
            Row(
              spacing: Insets.sm,
              children: [
                Text('${i + 1}', style: AppFonts.numeric(size: 13)),
                Expanded(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.ui(size: 13.5, color: palette.text),
                  ),
                ),
                Text(count, style: dim),
              ],
            ),
        ],
      ),
    );
  }
}
