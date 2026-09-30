import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Shimmer shaped like a few order cards, so nothing jumps on load.
class OrdersSkeleton extends StatelessWidget {
  const OrdersSkeleton({super.key, this.rows = 3});

  final int rows;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      child: Column(
        spacing: 10,
        children: [
          for (var i = 0; i < rows; i++)
            const ShimmerBox(height: 84, radius: Radii.card),
        ],
      ),
    );
  }
}
