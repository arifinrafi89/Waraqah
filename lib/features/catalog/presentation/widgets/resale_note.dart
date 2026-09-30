import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';

/// "Finished it? Copies like this usually resell for about ৳270", the nudge
/// that closes the circle: buy, read, sell it on.
class ResaleNote extends StatelessWidget {
  const ResaleNote({super.key, required this.valueBdt});

  final int valueBdt;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.all(Insets.md),
      child: Row(
        spacing: Insets.sm,
        children: [
          Icon(Icons.autorenew_rounded, color: palette.textFaint),
          Expanded(
            child: Text(
              AppL10n.of(context)!.bookResellsFor(Bdt.format(valueBdt)),
              style: AppFonts.ui(size: 12, color: palette.textDim),
            ),
          ),
        ],
      ),
    );
  }
}
