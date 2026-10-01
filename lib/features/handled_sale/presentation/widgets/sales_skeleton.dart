import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer shaped like a few [SaleTile]s.
class SalesSkeleton extends StatelessWidget {
  const SalesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      child: Column(
        spacing: Insets.md,
        children: [
          for (var i = 0; i < 3; i++)
            const SurfaceCard(
              padding: EdgeInsets.all(Insets.md),
              child: Row(
                spacing: Insets.md,
                children: [
                  SizedBox(width: 48, child: ShimmerBox(aspectRatio: 2 / 3)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.6,
                          child: ShimmerBox(height: 12),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.8,
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
}
