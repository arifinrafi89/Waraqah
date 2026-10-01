import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/utils/stock_label.dart';
import '../../../../core/widgets/horizontal_strip.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import 'book_grid_card.dart';

/// Width over height of a [BookGridCard] in a strip. Tune by eye.
const double _cardAspectRatio = 0.58;

/// Horizontal strip of [BookGridCard]s: about 2.5 cards on a phone.
class BookStrip extends StatelessWidget {
  const BookStrip({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return _Strip(
      children: [
        for (final book in books)
          BookGridCard(
            book: book,
            stockLabel: l10n.stockStatus(book.cardStockStatus),
          ),
      ],
    );
  }
}

/// Shimmer stand-in with the same strip geometry.
class BookStripSkeleton extends StatelessWidget {
  const BookStripSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return _Strip(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (var i = 0; i < 3; i++)
          SurfaceCard(
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
      ],
    );
  }
}

class _Strip extends StatelessWidget {
  const _Strip({required this.children, this.physics});

  final List<Widget> children;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) => HorizontalStrip(
    cardWidthFraction: 0.38,
    minCardWidth: 135,
    maxCardWidth: 175,
    physics: physics,
    children: [
      for (final child in children)
        AspectRatio(aspectRatio: _cardAspectRatio, child: child),
    ],
  );
}
