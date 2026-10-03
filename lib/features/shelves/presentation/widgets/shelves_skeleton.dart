import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer shaped like three [ShelfBookTile]s.
class ShelvesSkeleton extends StatelessWidget {
  const ShelvesSkeleton({super.key});

  @override
  Widget build(BuildContext context) => ShimmerScope(
    child: ListView(
      padding: const EdgeInsets.all(Insets.screen),
      children: [
        for (var i = 0; i < 3; i++)
          const Padding(
            padding: EdgeInsets.only(bottom: Insets.sm),
            child: SurfaceCard(
              padding: EdgeInsets.all(Insets.sm),
              child: Row(
                spacing: Insets.md,
                children: [
                  SizedBox(
                    width: Sizes.listThumbWidth,
                    child: ShimmerBox(
                      aspectRatio: Sizes.listThumbWidth / Sizes.listThumbHeight,
                    ),
                  ),
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
                          widthFactor: 0.4,
                          child: ShimmerBox(height: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    ),
  );
}
