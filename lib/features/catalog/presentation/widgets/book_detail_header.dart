import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/tags.dart';
import '../../catalog_routes.dart';
import 'rating_stars.dart';
import 'book_local_title.dart';

/// Cover on the left; title, author, rating and tags on the right.
class BookDetailHeader extends StatelessWidget {
  const BookDetailHeader({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.lg,
      children: [
        SizedBox(
          width: 118,
          child: CoverArt(
            title: book.localCoverLabel(context),
            seed: book.coverSeed,
            radius: Radii.md,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(book.localTitle(context), style: context.texts.titleLarge),
              if (book.otherTitle(context) case final other?)
                Text(
                  other,
                  style: AppFonts.ui(size: 13, color: palette.textDim),
                ),
              const SizedBox(height: 4),
              InkWell(
                onTap: () =>
                    context.push(CatalogRoutes.authorFor(book.authorId)),
                child: Text(
                  book.author,
                  style: AppFonts.ui(
                    size: 12.5,
                    weight: FontWeight.w700,
                    color: palette.accent,
                  ),
                ),
              ),
              const SizedBox(height: Insets.sm),
              RatingStars(rating: book.rating),
              const SizedBox(height: Insets.md),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final tag in book.tags)
                    MiniTag(label: tag, fontSize: 10),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
