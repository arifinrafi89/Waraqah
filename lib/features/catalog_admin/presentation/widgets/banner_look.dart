import 'package:flutter/material.dart' hide Banner;

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/domain/entities/banner.dart';
import '../../../home/domain/entities/season.dart';
import '../../../home/presentation/widgets/banner_card.dart';
import 'season_dropdown.dart';
import 'seed_swatches.dart';

/// How a Banner looks on Home, live as Staff type, its colour swatches, and
/// the Season it shows in.
class BannerLook extends StatelessWidget {
  const BannerLook({
    super.key,
    required this.banner,
    required this.onSeed,
    required this.onSeason,
  });

  final Banner banner;
  final ValueChanged<int> onSeed;
  final ValueChanged<Season?> onSeason;

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
      SeasonDropdown(
        value: banner.season,
        label: AppL10n.of(context)!.adminCatalogSeason,
        noneLabel: AppL10n.of(context)!.adminCatalogSeasonNone,
        onChanged: onSeason,
      ),
    ],
  );
}
