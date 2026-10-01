import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';

/// The marketplace's rules, shown before a reader lists a book: no
/// photocopies, no pirated books, honest condition.
class ListingRulesCard extends StatelessWidget {
  const ListingRulesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final rules = [
      (Icons.menu_book_outlined, l10n.listingRuleOriginal),
      (Icons.copyright_rounded, l10n.listingRulePirated),
      (Icons.photo_camera_outlined, l10n.listingRuleHonest),
    ];
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.sm,
        children: [
          Row(
            spacing: Insets.sm,
            children: [
              Icon(Icons.gpp_maybe_outlined, size: 18, color: palette.accent),
              Text(l10n.listingRulesTitle, style: context.texts.titleSmall),
            ],
          ),
          for (final (icon, rule) in rules)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Insets.sm,
              children: [
                Icon(icon, size: 16, color: palette.textDim),
                Expanded(
                  child: Text(
                    rule,
                    style: AppFonts.ui(size: 12.5, color: palette.text),
                  ),
                ),
              ],
            ),
          Text(
            l10n.listingRuleWarning,
            style: AppFonts.ui(size: 11.5, color: palette.textFaint),
          ),
        ],
      ),
    );
  }
}
