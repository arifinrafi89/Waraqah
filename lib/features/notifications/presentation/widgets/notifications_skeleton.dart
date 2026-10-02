import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer shaped like a few [NotificationTile]s.
class NotificationsSkeleton extends StatelessWidget {
  const NotificationsSkeleton({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
    child: Column(
      spacing: Insets.sm,
      children: [
        for (var i = 0; i < 4; i++)
          const SurfaceCard(
            padding: EdgeInsets.all(Insets.md),
            child: Row(
              spacing: Insets.md,
              children: [
                SizedBox(width: 24, child: ShimmerBox(aspectRatio: 1)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: ShimmerBox(height: 12),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.5,
                        child: ShimmerBox(height: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}
