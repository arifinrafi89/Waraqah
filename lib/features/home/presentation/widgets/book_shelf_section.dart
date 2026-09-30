import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/catalog_routes.dart';
import '../../../catalog/domain/entities/catalog_filters.dart';
import 'book_strip.dart';
import 'home_section.dart';

/// A Home strip of [books], with "See all" opening Search sorted by [sort].
class BookShelfSection extends ConsumerWidget {
  const BookShelfSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.books,
    required this.sort,
  });

  final String title;
  final String subtitle;
  final FutureProvider<List<Book>> books;
  final SearchSort sort;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return HomeSection(
      title: title,
      subtitle: subtitle,
      actionLabel: l10n.commonSeeAll,
      onAction: () => context.go(CatalogRoutes.searchFor(sort: sort)),
      child: AsyncView(
        value: ref.watch(books),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(books),
        skeleton: const BookStripSkeleton(),
        builder: (list) => BookStrip(books: list),
      ),
    );
  }
}
