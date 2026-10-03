import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Shimmer shaped like the stats page's four cards.
class StatsSkeleton extends StatelessWidget {
  const StatsSkeleton({super.key});

  @override
  Widget build(BuildContext context) => ShimmerScope(
    child: ListView(
      padding: const EdgeInsets.all(Insets.screen),
      children: const [
        ShimmerBox(height: 110, radius: Radii.card),
        SizedBox(height: Insets.md),
        ShimmerBox(height: 72, radius: Radii.card),
        SizedBox(height: Insets.md),
        ShimmerBox(aspectRatio: 1.8, radius: Radii.card),
        SizedBox(height: Insets.md),
        ShimmerBox(height: 120, radius: Radii.card),
      ],
    ),
  );
}
