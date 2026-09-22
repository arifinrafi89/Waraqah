import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';

/// Edge-to-edge horizontal list with the screen gutter as its padding — the
/// layout both the Book-Bites and P2P strips use.
class HorizontalStrip extends StatelessWidget {
  const HorizontalStrip({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      clipBehavior: Clip.none,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: children,
      ),
    );
  }
}
