import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer placeholder shaped like [BookListRow], so nothing shifts on load.
class BookListSkeleton extends StatelessWidget {
  const BookListSkeleton({super.key, this.rows = 5});

  final int rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [for (var i = 0; i < rows; i++) const _Row()],
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
                ShimmerBox(height: 10, width: 140),
                ShimmerBox(height: 14, width: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
