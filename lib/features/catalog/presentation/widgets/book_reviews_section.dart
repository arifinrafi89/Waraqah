import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/book_review.dart';
import 'review_composer_sheet.dart';
import 'review_tile.dart';

class BookReviewsSection extends StatefulWidget {
  const BookReviewsSection({
    super.key,
    required this.bookId,
    required this.reviews,
  });

  final String bookId;
  final List<BookReview> reviews;

  @override
  State<BookReviewsSection> createState() => _BookReviewsSectionState();
}

class _BookReviewsSectionState extends State<BookReviewsSection> {
  late final List<BookReview> _reviews = [...widget.reviews];

  bool get _hasPurchased =>
      const {'bk-sapiens', 'bk-atomic'}.contains(widget.bookId);

  Future<void> _writeReview() async {
    final review = await showReviewComposer(context);
    if (!mounted || review == null) return;
    setState(() => _reviews.insert(0, review));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppL10n.of(context)!.bookReviewSubmitted)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.bookDetailReviews,
          subtitle: _reviews.isEmpty
              ? null
              : l10n.bookDetailReviewsSub(_reviews.length),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _writeReview,
            icon: const Icon(Icons.rate_review_outlined, size: 17),
            label: Text(l10n.bookReviewWrite),
          ),
        ),
        if (_reviews.isEmpty)
          SurfaceCard(
            width: double.infinity,
            padding: const EdgeInsets.all(Insets.lg),
            child: Text(
              l10n.bookDetailNoReviews,
              style: context.texts.bodySmall,
            ),
          )
        else
          Column(
            spacing: 10,
            children: [
              for (var index = 0; index < _reviews.length; index++)
                ReviewTile(
                  review: _reviews[index],
                  verifiedPurchase: index == 0 && _hasPurchased,
                ),
            ],
          ),
      ],
    );
  }
}
