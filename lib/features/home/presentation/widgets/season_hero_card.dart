import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/cover_gradient.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/catalog_routes.dart';
import '../../domain/entities/season.dart';
import '../providers/home_providers.dart';

/// The active Season's hero card above the Banners: opens its Collection.
/// Nothing when no Season is on.
class SeasonHeroCard extends ConsumerWidget {
  const SeasonHeroCard({super.key});

  static const double _aspectRatio = 3.2;

  static const Map<Season, IconData> _icons = {
    Season.ramadan: Icons.nightlight_round,
    Season.boiMela: Icons.auto_stories_rounded,
    Season.admission: Icons.school_rounded,
    Season.backToSchool: Icons.backpack_rounded,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return AsyncView<SeasonInfo?>(
      value: ref.watch(homeSeasonProvider),
      errorLabel: l10n.commonSomethingWentWrong,
      retryLabel: l10n.commonRetry,
      onRetry: () => ref.invalidate(homeSeasonProvider),
      skeleton: const Padding(
        padding: EdgeInsets.fromLTRB(
          Insets.screen,
          Insets.lg,
          Insets.screen,
          0,
        ),
        child: ShimmerBox(aspectRatio: _aspectRatio, radius: Radii.hero),
      ),
      builder: (season) => season == null
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.fromLTRB(
                Insets.screen,
                Insets.lg,
                Insets.screen,
                0,
              ),
              child: AspectRatio(
                aspectRatio: _aspectRatio,
                child: _card(context, season),
              ),
            ),
    );
  }

  Widget _card(BuildContext context, SeasonInfo season) {
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final radius = BorderRadius.circular(Radii.hero);
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          gradient: CoverGradient.of(context.palette.chipFor(season.seed)),
          borderRadius: radius,
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: () =>
              context.push(CatalogRoutes.collectionFor(season.collectionId)),
          child: Padding(
            padding: const EdgeInsets.all(Insets.lg),
            child: Row(
              spacing: Insets.md,
              children: [
                Icon(_icons[season.season], color: Colors.white, size: 36),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 2,
                    children: [
                      Text(
                        season.title(isBangla),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppFonts.ui(
                          size: 18,
                          weight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        season.subtitle(isBangla),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppFonts.ui(size: 12.5, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: Colors.white70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
