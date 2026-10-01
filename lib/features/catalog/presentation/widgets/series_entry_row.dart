import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../../domain/entities/book_series.dart';

/// One line on the Series page: position, cover and title. Entries Waraqah
/// doesn't sell yet are greyed out, say so and do nothing when tapped.
class SeriesEntryRow extends StatelessWidget {
  const SeriesEntryRow({super.key, required this.entry});

  final SeriesEntry entry;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final bookId = entry.bookId;
    return Opacity(
      opacity: bookId == null ? 0.45 : 1,
      child: InkWell(
        onTap: bookId == null
            ? null
            : () => context.push(CatalogRoutes.bookDetailFor(bookId)),
        borderRadius: BorderRadius.circular(Radii.card),
        child: SurfaceCard(
          padding: const EdgeInsets.all(10),
          child: Row(
            spacing: Insets.md,
            children: [
              SizedBox(
                width: 24,
                child: Text(
                  '${entry.position}',
                  textAlign: TextAlign.center,
                  style: AppFonts.numeric(size: 14, color: palette.textFaint),
                ),
              ),
              SizedBox(
                width: Sizes.listThumbWidth,
                child: CoverArt(
                  title: entry.title,
                  seed: entry.coverSeed,
                  fontSize: 8.5,
                  radius: Radii.sm,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: [
                    Text(entry.title, style: context.texts.titleSmall),
                    if (bookId == null)
                      Text(
                        AppL10n.of(context)!.bookSeriesNotYet,
                        style: AppFonts.ui(size: 11, color: palette.textFaint),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
