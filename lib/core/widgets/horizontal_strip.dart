import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';

/// Edge-to-edge horizontal list with the screen gutter as its padding — the
/// layout both the Book-Bites and P2P strips use. Card width is a fraction of
/// the viewport, clamped between [minCardWidth] and [maxCardWidth] so cards
/// look right on both phone and desktop.
class HorizontalStrip extends StatelessWidget {
  const HorizontalStrip({
    super.key,
    required this.children,
    this.cardWidthFraction = 0.42,
    this.minCardWidth = 160,
    this.maxCardWidth = 220,
    this.physics,
  });

  final List<Widget> children;
  final double cardWidthFraction;
  final double minCardWidth;
  final double maxCardWidth;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = (constraints.maxWidth * cardWidthFraction).clamp(
          minCardWidth,
          maxCardWidth,
        );
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: physics,
          padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
          clipBehavior: Clip.none,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              for (final child in children)
                SizedBox(width: width, child: child),
            ],
          ),
        );
      },
    );
  }
}
