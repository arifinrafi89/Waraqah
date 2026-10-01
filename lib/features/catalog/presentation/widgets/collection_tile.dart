import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/press_scale.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../../domain/entities/collection.dart';

/// A Collection in a strip: the first 3 covers overlapping, its title and
/// how many books it has. Opens the Collection page.
class CollectionTile extends StatelessWidget {
  const CollectionTile({super.key, required this.collection});

  final Collection collection;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    return PressScale(
      child: SurfaceCard(
        clip: true,
        child: InkWell(
          onTap: () => context.push(CatalogRoutes.collectionFor(collection.id)),
          child: Padding(
            padding: const EdgeInsets.all(Insets.sm + 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                _Covers(collection.books.take(3).toList()),
                const SizedBox(height: 2),
                Text(
                  collection.title(isBangla),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.ui(size: 13, weight: FontWeight.w800),
                ),
                Text(
                  l10n.sectionBookCount(collection.books.length),
                  style: AppFonts.ui(
                    size: 11,
                    color: context.palette.textFaint,
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

/// Covers fanned left to right, the first on top. Each is half the width.
class _Covers extends StatelessWidget {
  const _Covers(this.books);

  final List<Book> books;

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 1.5,
    child: LayoutBuilder(
      builder: (_, box) => Stack(
        children: [
          for (final (i, book) in books.indexed.toList().reversed)
            Positioned(
              left: i * box.maxWidth / 4,
              top: 0,
              bottom: 0,
              width: box.maxWidth / 2,
              child: CoverArt(
                title: book.coverLabel,
                seed: book.coverSeed,
                aspectRatio: null,
                fontSize: 9,
                radius: Radii.sm,
              ),
            ),
        ],
      ),
    ),
  );
}
