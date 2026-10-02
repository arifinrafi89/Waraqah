import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../reviews_routes.dart';
import '../providers/review_providers.dart';
import 'review_actions.dart';
import 'review_tile.dart';
import 'reviews_skeleton.dart';

/// The book page's reviews: average and count, Write / Edit your review,
/// the 3 newest and "See all".
class BookReviewsPanel extends ConsumerWidget {
  const BookReviewsPanel({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final value = ref.watch(bookReviewsProvider(bookId));
    final r = value.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: l10n.reviewTitle,
          subtitle: (r?.count ?? 0) > 0
              ? '★ ${l10n.reviewSummary(r!.average.toStringAsFixed(1), r.count)}'
              : null,
          actionLabel: (r?.count ?? 0) > 0 ? l10n.bitesSeeAll : null,
          onAction: () => context.push(ReviewsRoutes.forBook(bookId)),
        ),
        AsyncView(
          value: value,
          errorLabel: l10n.commonSomethingWentWrong,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(bookReviewsProvider(bookId)),
          skeleton: const ReviewsSkeleton(),
          builder: (r) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: Insets.sm,
            children: [
              if (r.reviews.isEmpty)
                Text(l10n.reviewNone, style: context.texts.bodySmall),
              for (final review in r.reviews.take(3))
                ReviewTile(review: review),
              OutlinedButton.icon(
                icon: const Icon(Icons.rate_review_outlined),
                label: Text(
                  r.mine == null ? l10n.reviewWrite : l10n.reviewEdit,
                ),
                onPressed: () => ref.writeReview(context, bookId, mine: r.mine),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
