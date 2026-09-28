import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/waraqah_wordmark.dart';
import '../../../../l10n/app_localizations.dart';

/// Centred wordmark and tagline at the top of the auth screen.
class AuthHero extends StatelessWidget {
  const AuthHero({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 6),
      child: Column(
        children: [
          const WaraqahWordmark(size: 28),
          const SizedBox(height: 6),
          Text(
            AppL10n.of(context)!.appTagline,
            textAlign: TextAlign.center,
            style: AppFonts.ui(size: 12, color: palette.textFaint),
          ),
        ],
      ),
    );
  }
}
