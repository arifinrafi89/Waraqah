import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_sliver_view.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/home_providers.dart';
import 'book_grid.dart';
import 'home_section.dart';

/// New arrivals, cheapest cross-vendor price first, narrowed by the Islamic
/// curation pills above it. A sliver: header, then the book grid.
class NewBooksSection extends ConsumerWidget {
  const NewBooksSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return SliverContentWidth(
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
            // Header only: the grid below is its own sliver.
            child: HomeSection(
              title: l10n.homeNewBooks,
              subtitle: l10n.homeNewBooksSub,
              actionLabel: l10n.commonSort,
              actionIcon: Icons.sort_rounded,
              child: const SizedBox.shrink(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
            sliver: AsyncSliverView(
              value: ref.watch(homeNewArrivalsProvider),
              errorLabel: l10n.commonSomethingWentWrong,
              retryLabel: l10n.commonRetry,
              onRetry: () => ref.invalidate(homeNewArrivalsProvider),
              skeleton: const BookGridSkeleton(),
              builder: (books) => BookSliverGrid(books: books),
            ),
          ),
        ],
      ),
    );
  }
}
