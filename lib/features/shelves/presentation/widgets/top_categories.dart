import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/reading_stats.dart';

/// The Categories the reader finished most Books in this year.
class TopCategories extends StatelessWidget {
  const TopCategories({super.key, required this.categories});

  final List<CategoryCount> categories;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final bangla = Localizations.localeOf(context).languageCode == 'bn';
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          Text(l10n.readingTopCategories, style: context.texts.titleSmall),
          if (categories.isEmpty)
            Text(
              l10n.readingTopCategoriesNone,
              style: AppFonts.ui(size: 13, color: palette.textDim),
            ),
          for (final c in categories)
            Row(
              children: [
                Expanded(
                  child: Text(
                    bangla ? c.nameBn : c.nameEn,
                    style: AppFonts.ui(size: 13.5, color: palette.text),
                  ),
                ),
                Text(
                  l10n.readingCategoryCount(c.count),
                  style: AppFonts.ui(size: 12.5, color: palette.textDim),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
