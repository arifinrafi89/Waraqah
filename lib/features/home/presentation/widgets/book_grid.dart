import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import 'book_grid_card.dart';

/// Max cross-axis extent of a [BookGridCard] tile: phone gets 2 columns,
/// desktop 5-6. Tune by eye.
const double _maxTileExtent = 180;
const double _tileAspectRatio = 0.55;

const _gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: _maxTileExtent,
  mainAxisSpacing: Insets.md,
  crossAxisSpacing: Insets.md,
  childAspectRatio: _tileAspectRatio,
);

/// Responsive sliver grid of [BookGridCard]s.
class BookSliverGrid extends StatelessWidget {
  const BookSliverGrid({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return SliverGrid.builder(
      gridDelegate: _gridDelegate,
      itemCount: books.length,
      itemBuilder: (_, index) {
        final book = books[index];
        return BookGridCard(
          book: book,
          bestLabel: l10n.commonBest,
          vendorLine: '${book.vendor} · ${l10n.commonLowest}',
        );
      },
    );
  }
}

/// Shimmer stand-in with the same grid geometry.
class BookGridSkeleton extends StatelessWidget {
  const BookGridSkeleton({super.key, this.tiles = 4});

  final int tiles;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: _gridDelegate,
      itemCount: tiles,
      itemBuilder: (_, _) => SurfaceCard(
        clip: true,
        child: Column(
          children: [
            const Expanded(
              child: ShimmerBox(height: double.infinity, radius: 0),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 10, 11, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: const [
                  ShimmerBox(height: 10),
                  ShimmerBox(height: 14, width: 60),
                  ShimmerBox(height: 11, width: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
