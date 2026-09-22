import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';

/// A tile in the Home "New Books" grid: 3:4 cover, author, price and the
/// cheapest vendor.
class BookGridCard extends StatelessWidget {
  const BookGridCard({
    super.key,
    required this.book,
    required this.bestLabel,
    required this.vendorLine,
  });

  final Book book;
  final String bestLabel;
  final String vendorLine;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SurfaceCard(
      clip: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoverArt(
            title: book.coverLabel,
            seed: book.coverSeed,
            badge: book.isBestValue ? BestBadge(label: bestLabel) : null,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 10, 11, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.ui(size: 11, color: palette.textFaint),
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 6,
                  children: [
                    Text(
                      Bdt.format(book.priceBdt),
                      style: AppFonts.numeric(size: 14.5, color: palette.text),
                    ),
                    if (book.isDiscounted)
                      Text(
                        Bdt.format(book.originalPriceBdt!),
                        style: AppFonts.numeric(
                          size: 11,
                          weight: FontWeight.w600,
                          color: palette.textFaint,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 5),
                MiniTag(label: vendorLine, fontSize: 9.5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
