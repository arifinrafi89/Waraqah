import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/ayah.dart';

/// Ayah of the Day — an accent-gradient hero card with the Arabic verse set
/// right-to-left in Amiri, its translation, and the surah reference.
class AyahCard extends StatelessWidget {
  const AyahCard({super.key, required this.ayah});

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    return SurfaceCard(
      radius: Radii.hero,
      clip: true,
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [palette.accentSoft, palette.surface],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: palette.accent.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _tag(palette, l10n.homeAyahOfTheDay),
                const SizedBox(height: 10),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    ayah.arabic,
                    textAlign: TextAlign.right,
                    style: AppFonts.arabic(size: 23, color: palette.text),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '"${ayah.translation}"',
                  style: AppFonts.ui(
                    size: 13,
                    height: 1.55,
                    color: palette.textDim,
                    style: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: Insets.sm),
                Text(
                  ayah.reference(isBangla),
                  style: AppFonts.ui(
                    size: 11.5,
                    weight: FontWeight.w800,
                    color: palette.textFaint,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(AppPalette palette, String label) => Row(
    spacing: 5,
    children: [
      Icon(Icons.auto_awesome_rounded, size: 12, color: palette.accent),
      Text(
        label.toUpperCase(),
        style: AppFonts.ui(
          size: 10,
          weight: FontWeight.w800,
          color: palette.accent,
          letterSpacing: 0.8,
        ),
      ),
    ],
  );
}
