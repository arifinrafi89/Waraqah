import 'package:flutter/material.dart';

import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import 'edition_labels.dart';
import 'edition_price.dart';

/// One selectable Edition: format and language, stock, and its price.
class EditionTile extends StatelessWidget {
  const EditionTile({
    super.key,
    required this.edition,
    required this.isSelected,
    required this.isTranslation,
    required this.onTap,
    this.isLowestIn30Days = false,
  });

  final Edition edition;
  final bool isSelected;
  final bool isTranslation;
  final VoidCallback onTap;

  /// On sale and at its lowest price in 30 days.
  final bool isLowestIn30Days;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final canOrder = edition.isOrderable;
    return Material(
      color: palette.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Radii.md),
        side: BorderSide(
          color: isSelected ? palette.accent : palette.border,
          width: isSelected ? 1.6 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Insets.md),
          child: Row(
            spacing: Insets.md,
            children: [
              Icon(
                isSelected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off_rounded,
                size: 20,
                color: isSelected ? palette.accent : palette.textFaint,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          '${l10n.formatLabel(edition.format)} · '
                          '${l10n.languageLabel(edition.language)}',
                          style: context.texts.titleSmall,
                        ),
                        if (isTranslation)
                          MiniTag(label: l10n.bookEditionTranslation),
                        if (isLowestIn30Days)
                          AccentTag(label: l10n.bookLowest30Days),
                      ],
                    ),
                    Text(
                      l10n.editionStock(edition),
                      style: AppFonts.ui(
                        size: 11.5,
                        weight: FontWeight.w700,
                        color: canOrder ? palette.accent : palette.textFaint,
                      ),
                    ),
                  ],
                ),
              ),
              EditionPrice(edition: edition),
            ],
          ),
        ),
      ),
    );
  }
}
