import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';

/// Five stars, [stars] of them filled. With [onPick], each star is a
/// button that picks that many.
class ReviewStars extends StatelessWidget {
  const ReviewStars({
    super.key,
    required this.stars,
    this.size = 14,
    this.onPick,
  });

  final int stars;
  final double size;
  final ValueChanged<int>? onPick;

  @override
  Widget build(BuildContext context) {
    final color = context.palette.chips[2];
    final l10n = AppL10n.of(context)!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 1; i <= 5; i++)
          if (onPick == null)
            Icon(
              i <= stars ? Icons.star_rounded : Icons.star_outline_rounded,
              size: size,
              color: color,
            )
          else
            IconButton(
              tooltip: l10n.reviewStar(i),
              onPressed: () => onPick!(i),
              icon: Icon(
                i <= stars ? Icons.star_rounded : Icons.star_outline_rounded,
                size: size,
                color: color,
              ),
            ),
      ],
    );
  }
}
