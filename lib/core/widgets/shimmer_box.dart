import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/app_dimens.dart';
import '../theme/app_theme.dart';

/// Wraps a skeleton subtree in the app's shimmer sweep.
///
/// Every loading state in Waraqah is a real-shaped skeleton inside this widget,
/// so content never jumps when the data lands.
class ShimmerScope extends StatelessWidget {
  const ShimmerScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Shimmer.fromColors(
      baseColor: palette.surface,
      highlightColor: palette.surface2,
      period: const Duration(milliseconds: 1400),
      child: child,
    );
  }
}

/// A single grey block used to compose skeletons.
class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    super.key,
    this.width,
    this.height = 12,
    this.radius = Radii.sm,
    this.aspectRatio,
  });

  final double? width;
  final double height;
  final double radius;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    final box = Container(
      width: width,
      height: aspectRatio == null ? height : null,
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
    return aspectRatio == null
        ? box
        : AspectRatio(aspectRatio: aspectRatio!, child: box);
  }
}
