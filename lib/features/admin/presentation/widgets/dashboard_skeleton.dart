import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Shimmer shaped like the dashboard: six tiles, then two lists.
class DashboardSkeleton extends StatelessWidget {
  const DashboardSkeleton({super.key});

  @override
  Widget build(BuildContext context) => ShimmerScope(
    child: ListView(
      padding: const EdgeInsets.all(Insets.screen),
      children: [
        GridView.extent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.35,
          mainAxisSpacing: Insets.sm,
          crossAxisSpacing: Insets.sm,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (var i = 0; i < 6; i++) const ShimmerBox(radius: Radii.card),
          ],
        ),
        const SizedBox(height: Insets.md),
        const ShimmerBox(height: 140, radius: Radii.card),
        const SizedBox(height: Insets.md),
        const ShimmerBox(height: 140, radius: Radii.card),
      ],
    ),
  );
}
