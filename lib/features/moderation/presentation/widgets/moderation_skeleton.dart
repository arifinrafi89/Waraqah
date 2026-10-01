import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer shaped like a few moderation cards.
class ModerationSkeleton extends StatelessWidget {
  const ModerationSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.screen),
      child: Column(
        spacing: Insets.md,
        children: [
          for (var i = 0; i < 2; i++)
            const SurfaceCard(
              padding: EdgeInsets.all(Insets.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Insets.md,
                children: [
                  SizedBox(width: 64, child: ShimmerBox(aspectRatio: 2 / 3)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.6,
                          child: ShimmerBox(height: 14),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.4,
                          child: ShimmerBox(height: 10),
                        ),
                        ShimmerBox(height: 10),
                        ShimmerBox(height: 32),
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
}
