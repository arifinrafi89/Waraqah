import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../../domain/entities/book_series.dart';

/// One book in a series: its number, cover and title. The open book gets an
/// accent outline; books Waraqah doesn't sell yet are faded and say so.
class SeriesTile extends StatelessWidget {
  const SeriesTile({super.key, required this.entry, required this.isCurrent});

  final SeriesEntry entry;
  final bool isCurrent;

  static const double _width = 84;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final inStore = entry.bookId != null;
    return SizedBox(
      width: _width,
      child: InkWell(
        onTap: isCurrent ? null : () => _open(context),
        borderRadius: BorderRadius.circular(Radii.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Opacity(
              opacity: inStore ? 1 : 0.45,
              child: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Radii.sm),
                  border: isCurrent
                      ? Border.all(color: palette.accent, width: 2.5)
                      : null,
                ),
                child: CoverArt(
                  title: entry.title,
                  seed: entry.coverSeed,
                  fontSize: 8.5,
                  radius: Radii.sm,
                  badge: _Number(entry.position),
                ),
              ),
            ),
            Text(
              entry.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.ui(size: 11, weight: FontWeight.w700),
            ),
            if (!inStore)
              Text(
                l10n.bookSeriesNotYet,
                style: AppFonts.ui(size: 10, color: palette.textFaint),
              ),
          ],
        ),
      ),
    );
  }

  void _open(BuildContext context) {
    final bookId = entry.bookId;
    if (bookId != null) {
      context.push(CatalogRoutes.bookDetailFor(bookId));
      return;
    }
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(AppL10n.of(context)!.bookSeriesNotYetLong)),
      );
  }
}

class _Number extends StatelessWidget {
  const _Number(this.position);

  final int position;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: BorderRadius.circular(Radii.pill),
      ),
      child: Text(
        '$position',
        style: AppFonts.numeric(size: 10, color: palette.text),
      ),
    );
  }
}
