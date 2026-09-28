import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import 'rating_stars.dart';

/// One horizontal catalog row: thumbnail, title block, tags, rating, price.
class BookListRow extends StatelessWidget {
  const BookListRow({super.key, required this.book, required this.vendorLine});

  final Book book;
  final String vendorLine;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SurfaceCard(
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
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              Bdt.format(book.priceBdt),
              style: AppFonts.numeric(size: 14, color: palette.text),
            ),
            const Spacer(),
            Flexible(
              child: Text(
                vendorLine,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                style: AppFonts.ui(
                  size: 9.5,
                  weight: FontWeight.w700,
                  color: palette.textFaint,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
