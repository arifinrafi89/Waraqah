import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer stand-in for [AyahCard].
class AyahCardSkeleton extends StatelessWidget {
  const AyahCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      radius: Radii.hero,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: const [
          ShimmerBox(height: 10, width: 110),
          ShimmerBox(height: 22),
          ShimmerBox(height: 22, width: 200),
          ShimmerBox(height: 12),
          ShimmerBox(height: 11, width: 130),
        ],
      ),
    );
  }
}
