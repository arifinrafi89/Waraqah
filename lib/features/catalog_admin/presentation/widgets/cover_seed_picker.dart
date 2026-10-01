import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../l10n/app_localizations.dart';

/// The Book's cover colours: a live preview with the typed title, and a
/// swatch for each gradient seed. No photo upload until the backend.
class CoverSeedPicker extends StatelessWidget {
  const CoverSeedPicker({
    super.key,
    required this.title,
    required this.seed,
    required this.onChanged,
  });

  /// Gradient seeds the cover can use.
  static const int seeds = 12;

  final String title;
  final int seed;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.sm,
      children: [
        Text(
          AppL10n.of(context)!.adminCatalogCover,
          style: context.texts.titleSmall,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Insets.md,
          children: [
            Expanded(
              flex: 2,
              child: CoverArt(title: title, seed: seed, fontSize: 15),
            ),
            Expanded(
              flex: 3,
              child: GridView.extent(
                maxCrossAxisExtent: 44,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: Insets.sm,
                crossAxisSpacing: Insets.sm,
                childAspectRatio: 3 / 4,
                children: [
                  for (var i = 0; i < seeds; i++)
                    InkWell(
                      key: ValueKey('cover-seed-$i'),
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}
