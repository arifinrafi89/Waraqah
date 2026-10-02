import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../bites/presentation/widgets/bite_feed_skeleton.dart';

/// Shimmer stand-in for a Reader's page.
class ReaderSkeleton extends StatelessWidget {
  const ReaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(Insets.screen),
    children: const [
      ShimmerBox(height: 220, radius: Radii.card),
      SizedBox(height: Insets.xl),
      BiteFeedSkeleton(),
    ],
  );
}
