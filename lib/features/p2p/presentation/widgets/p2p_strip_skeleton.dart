import 'package:flutter/material.dart';

import '../../../../core/widgets/horizontal_strip.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';

/// Shimmer stand-in for the "From Students Near You" strip.
class P2pStripSkeleton extends StatelessWidget {
  const P2pStripSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalStrip(
      cardWidthFraction: 0.34,
      minCardWidth: 130,
      maxCardWidth: 165,
      physics: const NeverScrollableScrollPhysics(),
      children: [for (var i = 0; i < 3; i++) const _Card()],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.7,
      child: SurfaceCard(
        clip: true,
        child: Column(
          children: [
            const ShimmerBox(aspectRatio: 1, radius: 0),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 9, 10, 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: const [
                  ShimmerBox(height: 11),
                  ShimmerBox(height: 9, width: 70),
                  ShimmerBox(height: 12, width: 55),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
