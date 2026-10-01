import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Five stars, filled up to [stars] (halves round to the nearest whole).
class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.stars, this.size = 14});

  final double stars;
  final double size;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final filled = stars.round();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 1; i <= 5; i++)
          Icon(
            i <= filled ? Icons.star_rounded : Icons.star_outline_rounded,
            size: size,
            color: i <= filled ? palette.accent : palette.textFaint,
          ),
      ],
    );
  }
}
