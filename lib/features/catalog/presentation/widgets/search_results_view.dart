import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../pages/catalog_results_list.dart';
import '../providers/search_providers.dart';
import 'book_list_skeleton.dart';
import 'search_no_results.dart';

/// The Search page's results: count and list, skeleton, retry, or no-results.
/// [onOpen] runs when the Reader opens a Book from the list.
class SearchResultsView extends ConsumerWidget {
  const SearchResultsView({
    super.key,
    required this.query,
    required this.onOpen,
  });

  final String query;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return AsyncView<List<Book>>(
      value: ref.watch(searchResultsProvider),
      errorLabel: l10n.commonSomethingWentWrong,
      retryLabel: l10n.commonRetry,
      onRetry: () => ref.invalidate(searchResultsProvider),
      skeleton: const Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.screen),
        child: BookListSkeleton(),
      ),
      builder: (books) => books.isEmpty
          ? SearchNoResults(query: query)
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    Insets.screen,
                    0,
                    Insets.screen,
                    10,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      l10n.catalogResults(books.length),
                      style: context.texts.labelMedium,
                    ),
                  ),
                ),
                Expanded(
                  child: CatalogResultsList(books: books, onOpen: onOpen),
                ),
              ],
            ),
    );
  }
}
