import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Shimmer shaped like [EditProfileForm]: the avatar and two fields.
class EditProfileSkeleton extends StatelessWidget {
  const EditProfileSkeleton({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.all(Insets.screen),
    child: Column(
      spacing: Insets.md,
      children: [
        SizedBox(width: 84, child: ShimmerBox(aspectRatio: 1, radius: 16)),
        SizedBox(height: Insets.lg),
        ShimmerBox(height: 52),
        ShimmerBox(height: 52),
      ],
    ),
  );
}
