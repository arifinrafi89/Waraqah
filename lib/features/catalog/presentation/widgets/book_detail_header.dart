import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import 'rating_stars.dart';

/// Cover on the left; title, author, rating and tags on the right.
class BookDetailHeader extends StatelessWidget {
  const BookDetailHeader({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.lg,
      children: [
        SizedBox(
          width: 118,
          child: CoverArt(
            title: book.coverLabel,
            seed: book.coverSeed,
            radius: Radii.md,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(book.title, style: context.texts.titleLarge),
              const SizedBox(height: 4),
              Text(
                book.author,
                style: AppFonts.ui(size: 12.5, color: palette.textFaint),
              ),
              const SizedBox(height: Insets.sm),
              RatingStars(rating: book.rating),
              const SizedBox(height: Insets.md),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  if (book.isBeneficial)
                    AccentTag(
                      label: l10n.homeBeneficial,
                      icon: Icons.verified_rounded,
                    ),
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
