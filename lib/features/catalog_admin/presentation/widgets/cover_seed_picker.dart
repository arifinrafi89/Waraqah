import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../l10n/app_localizations.dart';
import 'seed_swatches.dart';

/// The Book's cover colours: a live preview with the typed title, and a
/// swatch for each gradient seed. No photo upload until the backend.
class CoverSeedPicker extends StatelessWidget {
  const CoverSeedPicker({
    super.key,
    required this.title,
    required this.seed,
    required this.onChanged,
  });

  final String title;
  final int seed;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) => Column(
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
            child: SeedSwatches(seed: seed, onChanged: onChanged),
          ),
        ],
      ),
    ],
  );
}
