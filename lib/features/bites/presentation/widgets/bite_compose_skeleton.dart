import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Shimmer stand-in for the composer while a Bite or Book loads.
class BiteComposeSkeleton extends StatelessWidget {
  const BiteComposeSkeleton({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.all(Insets.screen),
    child: Column(
      spacing: Insets.lg,
      children: [
        ShimmerBox(height: 140, radius: Radii.md),
        ShimmerBox(height: Sizes.fieldHeight, radius: Radii.md),
        ShimmerBox(height: 40),
      ],
    ),
  );
}
