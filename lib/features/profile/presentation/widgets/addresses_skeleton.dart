import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer shaped like two [AddressTile]s.
class AddressesSkeleton extends StatelessWidget {
  const AddressesSkeleton({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
    child: Column(
      spacing: Insets.sm,
      children: [
        for (var i = 0; i < 2; i++)
          const SurfaceCard(
            padding: EdgeInsets.all(Insets.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: ShimmerBox(height: 12),
                ),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: ShimmerBox(height: 10),
                ),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: ShimmerBox(height: 10),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}
