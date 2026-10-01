import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/cover_art.dart';

/// One swatch per gradient seed, for a cover's or a Banner's colours.
class SeedSwatches extends StatelessWidget {
  const SeedSwatches({super.key, required this.seed, required this.onChanged});

  /// Gradient seeds Staff can pick.
  static const int count = 12;

  final int seed;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return GridView.extent(
      maxCrossAxisExtent: 44,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: Insets.sm,
      crossAxisSpacing: Insets.sm,
      childAspectRatio: 3 / 4,
      children: [
        for (var i = 0; i < count; i++)
          InkWell(
            key: ValueKey('seed-$i'),
            onTap: () => onChanged(i),
            borderRadius: BorderRadius.circular(Radii.sm),
            child: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Radii.sm),
                border: Border.all(
                  color: i == seed ? palette.accent : palette.border,
                  width: i == seed ? 3 : 1,
                ),
              ),
              child: CoverArt(
                title: '',
                seed: i,
                aspectRatio: null,
                radius: Radii.sm,
              ),
            ),
          ),
      ],
    );
  }
}
