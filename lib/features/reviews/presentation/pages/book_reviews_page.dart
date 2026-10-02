import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/review_providers.dart';
import '../widgets/review_tile.dart';
import '../widgets/reviews_skeleton.dart';

/// `/reviews?bookId=`: every review of one Book, newest first.
class BookReviewsPage extends ConsumerWidget {
  const BookReviewsPage({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.reviewTitle)),
      body: AsyncView(
        value: ref.watch(bookReviewsProvider(bookId)),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(bookReviewsProvider(bookId)),
        skeleton: const Padding(
          padding: EdgeInsets.all(Insets.screen),
          child: ReviewsSkeleton(count: 4),
        ),
        builder: (r) => ListView.separated(
          padding: const EdgeInsets.all(Insets.screen),
          itemCount: r.reviews.length,
          separatorBuilder: (_, _) => const SizedBox(height: Insets.sm),
          itemBuilder: (_, i) => ReviewTile(review: r.reviews[i]),
        ),
      ),
    );
  }
}
