import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/fade_slide_in.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/domain/entities/catalog_filters.dart';
import '../../../deals/presentation/widgets/deals_banner.dart';
import '../providers/home_providers.dart';
import '../widgets/auto_hide_header.dart';
import '../widgets/ayah_section.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/bites_section.dart';
import '../widgets/book_shelf_section.dart';
import '../widgets/collections_section.dart';
import '../widgets/home_header.dart';
import '../widgets/nearby_p2p_section.dart';
import '../widgets/season_hero_card.dart';
import '../widgets/section_chip_row.dart';

/// Screen 1 — Home. Nothing but composition: every section is an independent
/// brick that loads its own data, so one slow request never blocks the others.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final top = MediaQuery.paddingOf(context).top + kHomeHeaderHeight;
    return AutoHideHeader(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: top)),
          const _Box(DealsBanner()),
          const _Box(SeasonHeroCard()),
          const _Box(BannerCarousel()),
          const _Box(SectionChipRow()),
          const _Box(AyahSection()),
          _Box(
            BookShelfSection(
              title: l10n.homeNewArrivals,
              subtitle: l10n.homeNewArrivalsSub,
              books: homeNewArrivalsProvider,
              sort: SearchSort.newest,
            ),
            step: 1,
          ),
          _Box(
            BookShelfSection(
              title: l10n.homeBestsellers,
              subtitle: l10n.homeBestsellersSub,
              books: homeBestsellersProvider,
              sort: SearchSort.bestselling,
            ),
            step: 2,
          ),
          const _Box(CollectionsSection(), step: 3),
          const _Box(BitesSection(), step: 4),
          const _Box(NearbyP2pSection(), step: 5),
          SliverToBoxAdapter(child: SizedBox(height: Sizes.navClearance)),
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  const _Box(this.child, {this.step = 0});

  final Widget child;

  /// Position in the entrance stagger.
  final int step;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: FadeSlideIn(
      delay: Duration(milliseconds: 60 * step),
      child: ContentWidth(child: child),
    ),
  );
}
