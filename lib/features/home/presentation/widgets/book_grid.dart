import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import 'book_grid_card.dart';

/// Two-column grid of [BookGridCard]s, sized by its children so it can nest
/// inside the home scroll view.
class BookGrid extends StatelessWidget {
  const BookGrid({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return _Wrap(
      children: [
        for (final book in books)
          BookGridCard(
            book: book,
            bestLabel: l10n.commonBest,
            vendorLine: '${book.vendor} · ${l10n.commonLowest}',
          ),
      ],
    );
  }
}

/// Shimmer stand-in with the same two-column geometry.
class BookGridSkeleton extends StatelessWidget {
  const BookGridSkeleton({super.key, this.tiles = 4});

  final int tiles;

  @override
  Widget build(BuildContext context) {
    return _Wrap(
      children: [
        for (var i = 0; i < tiles; i++)
          SurfaceCard(
            clip: true,
            child: Column(
              children: [
                const ShimmerBox(aspectRatio: 3 / 4, radius: 0),
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
      ],
    );
  }
}

class _Wrap extends StatelessWidget {
  const _Wrap({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = (constraints.maxWidth - Insets.md) / 2;
        return Wrap(
          spacing: Insets.md,
          runSpacing: Insets.md,
          children: [
            for (final child in children) SizedBox(width: width, child: child),
          ],
        );
      },
    );
  }
}
