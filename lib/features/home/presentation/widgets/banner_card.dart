import 'package:flutter/material.dart' hide Banner;
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/cover_gradient.dart';
import '../../../catalog/catalog_routes.dart';
import '../../domain/entities/banner.dart';

/// Where [target] leads. Sections and searches are Catalog tab pages; a
/// Collection or Book page goes on top.
String bannerRoute(BannerTarget target) => switch (target.kind) {
  BannerTargetKind.collection => CatalogRoutes.collectionFor(target.value),
  BannerTargetKind.section => CatalogRoutes.sectionFor(
    Section.values.byName(target.value),
  ),
  BannerTargetKind.book => CatalogRoutes.bookDetailFor(target.value),
  BannerTargetKind.search => CatalogRoutes.searchFor(query: target.value),
};

/// One Banner: its title and subtitle on a cover gradient from its seed.
class BannerCard extends StatelessWidget {
  const BannerCard({super.key, required this.banner});

  final Banner banner;

  @override
  Widget build(BuildContext context) {
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final radius = BorderRadius.circular(Radii.hero);
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          gradient: CoverGradient.of(context.palette.chipFor(banner.seed)),
          borderRadius: radius,
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: () => _open(context),
          child: Padding(
            padding: const EdgeInsets.all(Insets.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 4,
              children: [
                Text(
                  banner.title(isBangla),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.ui(
                    size: 20,
                    weight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Text(
                  banner.subtitle(isBangla),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.ui(size: 13, color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _open(BuildContext context) {
    final route = bannerRoute(banner.target);
    switch (banner.target.kind) {
      case BannerTargetKind.section || BannerTargetKind.search:
        context.go(route);
      case BannerTargetKind.collection || BannerTargetKind.book:
        context.push(route);
    }
  }
}
