import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';

/// "Waraqah pays ৳150", and that the check may change it.
class SellBackQuoteCard extends StatelessWidget {
  const SellBackQuoteCard({super.key, required this.quoteBdt});

  final int quoteBdt;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            l10n.sellBackQuote(Bdt.format(quoteBdt)),
            style: AppFonts.numeric(size: 18, color: palette.accent),
          ),
          Text(
            l10n.sellBackQuoteNote,
            style: AppFonts.ui(size: 12, color: palette.textDim),
          ),
        ],
      ),
    );
  }
}
