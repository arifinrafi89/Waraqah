import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer stand-in for the horizontal Book-Bites strip.
class BiteStripSkeleton extends StatelessWidget {
  const BiteStripSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      child: Row(
        spacing: 10,
        children: [for (var i = 0; i < 3; i++) const _Card()],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card();

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      width: Sizes.biteCardWidth,
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.sm,
        children: const [
          Row(
            spacing: Insets.sm,
            children: [
              ShimmerBox(width: Sizes.avatar, height: Sizes.avatar, radius: 99),
              Expanded(child: ShimmerBox(height: 11)),
            ],
          ),
          ShimmerBox(height: 10),
          ShimmerBox(height: 10, width: 130),
          ShimmerBox(height: 20, width: 90, radius: Radii.sm),
        ],
      ),
    );
  }
}
