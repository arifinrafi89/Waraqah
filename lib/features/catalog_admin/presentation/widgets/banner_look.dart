import 'package:flutter/material.dart' hide Banner;

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/domain/entities/banner.dart';
import '../../../home/presentation/widgets/banner_card.dart';
import 'seed_swatches.dart';

/// How a Banner looks on Home, live as Staff type, and its colour swatches.
class BannerLook extends StatelessWidget {
  const BannerLook({super.key, required this.banner, required this.onSeed});

  final Banner banner;
  final ValueChanged<int> onSeed;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    spacing: Insets.md,
    children: [
      AspectRatio(
        aspectRatio: 2.4,
        child: IgnorePointer(child: BannerCard(banner: banner)),
      ),
      Text(
        AppL10n.of(context)!.adminCatalogBannerColour,
        style: context.texts.titleSmall,
      ),
      SeedSwatches(seed: banner.seed, onChanged: onSeed),
    ],
  );
}
