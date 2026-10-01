import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Shimmer shaped like [ListingDetails]: cover, title, seller, price.
class ListingDetailsSkeleton extends StatelessWidget {
  const ListingDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.screen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.md,
        children: [
          Center(
            child: SizedBox(width: 150, child: ShimmerBox(aspectRatio: 2 / 3)),
          ),
          FractionallySizedBox(widthFactor: 0.7, child: ShimmerBox(height: 20)),
          FractionallySizedBox(widthFactor: 0.4, child: ShimmerBox(height: 12)),
          FractionallySizedBox(widthFactor: 0.3, child: ShimmerBox(height: 24)),
        ],
      ),
    );
  }
}
