import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/press_scale.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../../catalog/catalog_routes.dart';

/// A tile in Home's book strips: cover, author, From-price (list price struck
/// through when discounted) and stock status. Opens the book page.
class BookGridCard extends StatelessWidget {
  const BookGridCard({super.key, required this.book, required this.stockLabel});

  final Book book;
  final String stockLabel;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return PressScale(
      child: SurfaceCard(
        clip: true,
        child: InkWell(
          onTap: () => context.push(CatalogRoutes.bookDetailFor(book.id)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The cover takes whatever height the text leaves, so the tile
              // never overflows at any width or text scale.
              Expanded(
                child: CoverArt(
                  title: book.coverLabel,
                  seed: book.coverSeed,
                  aspectRatio: null,
                ),
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
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      spacing: 6,
                      children: [
                        Text(
                          Bdt.format(book.fromPriceBdt),
                          style: AppFonts.numeric(
                            size: 14.5,
                            color: palette.text,
                          ),
                        ),
                        if (book.isFromEditionDiscounted)
                          Text(
                            Bdt.format(book.fromListPriceBdt!),
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
                    MiniTag(label: stockLabel, fontSize: 9.5),
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
