import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';

/// Static Daily Ayah card — same ayah (Al-Baqarah 2:152) every load, per spec.
class AyahCard extends StatelessWidget {
  const AyahCard({super.key});

  static const _arabic =
      'فَٱذْكُرُونِىٓ أَذْكُرْكُمْ وَٱشْكُرُوا۟ لِى وَلَا تَكْفُرُونِ';
  static const _translation =
      '"So remember Me; I will remember you. And be grateful to Me and do not deny Me."';
  static const _reference = 'Surah Al-Baqarah · 2:152';

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [palette.accentSoft, palette.surface],
        ),
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star_rounded, size: 14, color: palette.accent),
              const SizedBox(width: 5),
              Text(
                'AYAH OF THE DAY',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.1,
                  color: palette.accent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _arabic,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: AppTheme.ayahTextStyle(palette),
          ),
          const SizedBox(height: 10),
          Text(
            _translation,
            style: TextStyle(
              fontSize: 13,
              height: 1.55,
              fontStyle: FontStyle.italic,
              color: palette.textDim,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _reference,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w800,
              color: palette.textFaint,
            ),
          ),
        ],
      ),
    );
  }
}
