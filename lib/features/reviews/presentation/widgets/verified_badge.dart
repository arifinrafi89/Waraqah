import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';

/// "Verified Purchase": the reviewer got this Book delivered from Waraqah.
class VerifiedBadge extends StatelessWidget {
  const VerifiedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.verified_rounded, size: 13, color: palette.accent),
        const SizedBox(width: 3),
        Text(
          AppL10n.of(context)!.reviewVerified,
          style: AppFonts.ui(
            size: 11,
            weight: FontWeight.w700,
            color: palette.accent,
          ),
        ),
      ],
    );
  }
}
