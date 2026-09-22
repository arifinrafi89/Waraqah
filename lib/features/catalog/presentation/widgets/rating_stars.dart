import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// Five-star row plus the numeric score, as on the catalog list rows.
class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final filled = rating.round().clamp(0, 5);
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            i < filled ? Icons.star_rounded : Icons.star_outline_rounded,
            size: 11,
            color: palette.chips[2],
          ),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: AppFonts.numeric(
            size: 9.5,
            weight: FontWeight.w600,
            color: palette.textFaint,
          ),
        ),
      ],
    );
  }
}
