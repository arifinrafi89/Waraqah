import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../catalog_routes.dart';
import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import 'book_row_price.dart';
import 'rating_stars.dart';

/// One horizontal catalog row: thumbnail, title block, tags, rating, price.
/// Tapping it opens the book's detail page.
class BookListRow extends StatelessWidget {
  const BookListRow({
    super.key,
    required this.book,
    required this.stockLabel,
    this.onOpen,
    this.subtitle,
  });

  final Book book;
  final String stockLabel;

  /// A faint line under the title (Search shows the Bangla title here).
  final String? subtitle;

  /// Called as the Book opens (the Search page saves the search).
  final VoidCallback? onOpen;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SurfaceCard(
      clip: true,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            onOpen?.call();
            context.push(CatalogRoutes.bookDetailFor(book.id));
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Insets.md,
              children: [
                SizedBox(
                  width: Sizes.listThumbWidth,
                  child: CoverArt(
                    title: book.coverLabel,
                    seed: book.coverSeed,
                    aspectRatio: Sizes.listThumbWidth / Sizes.listThumbHeight,
                    fontSize: 8.5,
                    radius: 10,
                  ),
                ),
                Expanded(child: _body(context, palette)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, AppPalette palette) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 3,
    children: [
      Text(
        book.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.texts.titleSmall,
      ),
      if (subtitle != null)
        Text(
          subtitle!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppFonts.ui(size: 10.5, color: palette.textFaint),
        ),
      Text(
        book.author,
        style: AppFonts.ui(size: 10.5, color: palette.textFaint),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 3, bottom: 2),
        child: Wrap(
          spacing: 5,
          runSpacing: 4,
          children: [for (final tag in book.tags) MiniTag(label: tag)],
        ),
      ),
      RatingStars(rating: book.rating),
      BookRowPrice(book: book, stockLabel: stockLabel),
    ],
  );
}
