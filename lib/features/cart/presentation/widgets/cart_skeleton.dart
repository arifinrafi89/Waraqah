import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer shaped like a few [CartLineTile]s, so nothing jumps on load.
class CartSkeleton extends StatelessWidget {
  const CartSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      child: Column(
        spacing: 10,
        children: [for (var i = 0; i < 3; i++) const _Row()],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row();

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.md,
        children: [
          const ShimmerBox(
            width: Sizes.listThumbWidth,
            height: Sizes.listThumbHeight,
            radius: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Insets.sm,
              children: const [
                ShimmerBox(height: 13, width: 170),
                ShimmerBox(height: 10, width: 110),
                ShimmerBox(height: 10, width: 130),
                ShimmerBox(height: 22, width: 90),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
