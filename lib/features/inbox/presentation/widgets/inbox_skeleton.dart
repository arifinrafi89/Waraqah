import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer shaped like a few [ThreadTile]s, or like messages in a thread.
class InboxSkeleton extends StatelessWidget {
  const InboxSkeleton({super.key, this.rows = 4});

  final int rows;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      child: Column(
        spacing: 10,
        children: [
          for (var i = 0; i < rows; i++)
            const SurfaceCard(
              padding: EdgeInsets.all(10),
              child: Row(
                spacing: Insets.md,
                children: [
                  SizedBox(width: 40, child: ShimmerBox(aspectRatio: 2 / 3)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.5,
                          child: ShimmerBox(height: 12),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.7,
                          child: ShimmerBox(height: 10),
                        ),
                        ShimmerBox(height: 10),
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
