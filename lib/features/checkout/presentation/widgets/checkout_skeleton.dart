import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Shimmer shaped like the checkout steps, so nothing jumps on load.
class CheckoutSkeleton extends StatelessWidget {
  const CheckoutSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.screen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.md,
        children: [
          ShimmerBox(height: 18, width: 160),
          ShimmerBox(height: 76, radius: Radii.md),
          ShimmerBox(height: 76, radius: Radii.md),
          SizedBox(height: Insets.sm),
          ShimmerBox(height: 18, width: 110),
          ShimmerBox(height: 64, radius: Radii.card),
          SizedBox(height: Insets.sm),
          ShimmerBox(height: 18, width: 120),
          ShimmerBox(height: 60, radius: Radii.md),
          ShimmerBox(height: 60, radius: Radii.md),
        ],
      ),
    );
  }
}
