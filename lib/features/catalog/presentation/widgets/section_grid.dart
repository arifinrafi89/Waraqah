import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/cover_gradient.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import 'booklists_links.dart';
import 'section_style.dart';

/// The 8 Sections as tiles, each opening that Section's page, then the way
/// into Booklists.
class SectionGrid extends StatelessWidget {
  const SectionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
          sliver: SliverGrid.extent(
            maxCrossAxisExtent: 180,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.35,
            children: [
              for (final section in Section.values)
                _SectionTile(section: section, label: section.label(l10n)),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            Insets.screen,
            Insets.md,
            Insets.screen,
            Sizes.navClearance,
          ),
          sliver: const SliverToBoxAdapter(child: BooklistsCard()),
        ),
      ],
    );
  }
}

class _SectionTile extends StatelessWidget {
  const _SectionTile({required this.section, required this.label});

  final Section section;
  final String label;

  @override
  Widget build(BuildContext context) {
    final color = context.palette.chipFor(section.index);
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          gradient: CoverGradient.of(color),
          borderRadius: BorderRadius.circular(Radii.card),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(Radii.card),
          onTap: () => context.push(CatalogRoutes.sectionFor(section)),
          child: Padding(
            padding: const EdgeInsets.all(Insets.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(section.icon, color: Colors.white, size: 26),
                Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.ui(
                    size: 13,
                    weight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
