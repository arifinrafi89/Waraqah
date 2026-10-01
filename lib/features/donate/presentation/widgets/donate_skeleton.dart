import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer shaped like a few recipient cards, so nothing jumps on load.
class DonateSkeleton extends StatelessWidget {
  const DonateSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      child: Column(
        spacing: Insets.md,
        children: [
          for (var i = 0; i < 3; i++)
            const SurfaceCard(
              padding: EdgeInsets.all(Insets.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  ShimmerBox(width: 180, height: 16),
                  ShimmerBox(width: 220),
                  ShimmerBox(height: 6),
                  ShimmerBox(width: 140),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
