import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Shimmer stand-in for a few review tiles.
class ReviewsSkeleton extends StatelessWidget {
  const ReviewsSkeleton({super.key, this.count = 2});

  final int count;

  @override
  Widget build(BuildContext context) => Column(
    spacing: Insets.sm,
    children: [
      for (var i = 0; i < count; i++)
        const ShimmerBox(height: 84, radius: Radii.card),
    ],
  );
}
