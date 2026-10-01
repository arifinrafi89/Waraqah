import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Loading rows for the admin lists.
class AdminListSkeleton extends StatelessWidget {
  const AdminListSkeleton({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Insets.screen),
    child: Column(
      spacing: 10,
      children: [
        for (var i = 0; i < 5; i++)
          const ShimmerBox(height: 64, radius: Radii.card),
      ],
    ),
  );
}
