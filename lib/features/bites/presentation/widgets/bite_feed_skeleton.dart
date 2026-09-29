import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

class BiteFeedSkeleton extends StatelessWidget {
  const BiteFeedSkeleton({super.key});

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: Insets.md),
    child: Padding(
      padding: const EdgeInsets.all(Insets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              ShimmerBox(width: 40, height: 40, radius: 99),
              SizedBox(width: Insets.md),
              Expanded(child: ShimmerBox(height: 14)),
            ],
          ),
          const SizedBox(height: Insets.lg),
          const ShimmerBox(height: 14),
          const SizedBox(height: Insets.sm),
          const ShimmerBox(width: 220, height: 14),
          const SizedBox(height: Insets.md),
          ShimmerBox(height: 150, radius: Radii.md),
        ],
      ),
    ),
  );
}
