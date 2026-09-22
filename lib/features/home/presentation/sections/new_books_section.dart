import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/home_providers.dart';
import '../widgets/book_grid.dart';
import '../widgets/home_section.dart';

/// New arrivals, cheapest cross-vendor price first, narrowed by the Islamic
/// curation pills above it.
class NewBooksSection extends ConsumerWidget {
  const NewBooksSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return HomeSection(
      title: l10n.homeNewBooks,
      subtitle: l10n.homeNewBooksSub,
      actionLabel: l10n.commonSort,
      actionIcon: Icons.sort_rounded,
      gutterBody: true,
      child: AsyncView(
        value: ref.watch(homeNewArrivalsProvider),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(homeNewArrivalsProvider),
        skeleton: const BookGridSkeleton(),
        builder: (books) => BookGrid(books: books),
      ),
    );
  }
}
