import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Shimmer stand-in shaped like the detail page: header, then two sections.
class BookDetailSkeleton extends StatelessWidget {
  const BookDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    // Not scrollable, but clips instead of overflowing on short screens.
    return const SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: Insets.screen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.xl,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Insets.lg,
            children: [
              ShimmerBox(width: 118, height: 157, radius: Radii.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    ShimmerBox(height: 18),
                    ShimmerBox(height: 18, width: 120),
                    ShimmerBox(height: 12, width: 100),
                    ShimmerBox(height: 11, width: 80),
                  ],
                ),
              ),
            ],
          ),
          ShimmerBox(height: 14, width: 130),
          ShimmerBox(height: 150, radius: Radii.card),
          ShimmerBox(height: 14, width: 110),
          ShimmerBox(height: 70, radius: Radii.card),
        ],
      ),
    );
  }
}
