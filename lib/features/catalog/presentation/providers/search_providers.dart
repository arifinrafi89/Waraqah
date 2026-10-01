import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../domain/entities/catalog_filters.dart';
import 'catalog_providers.dart';

/// What the Search page is searching for (already debounced).
final searchQueryProvider =
    NotifierProvider.autoDispose<SelectionNotifier<String>, String>(
      () => SelectionNotifier<String>(''),
    );

/// The order the Reader picked on the Search page; `null` = the default.
/// Lives while the page is open and survives query changes.
final searchSortChoiceProvider =
    NotifierProvider.autoDispose<SelectionNotifier<SearchSort?>, SearchSort?>(
      () => SelectionNotifier<SearchSort?>(null),
    );

/// The order in force: the choice, else Relevance with a query and Newest
/// without. Relevance with no query falls back to Newest.
final searchSortProvider = Provider.autoDispose<SearchSort>((ref) {
  final hasQuery = ref.watch(searchQueryProvider).trim().isNotEmpty;
  final choice = ref.watch(searchSortChoiceProvider);
  if (choice == null || (choice == SearchSort.relevance && !hasQuery)) {
    return hasQuery ? SearchSort.relevance : SearchSort.newest;
  }
  return choice;
});

/// The filters the Reader set in the Filter sheet (query and sort unused).
/// Live while the page is open and survive query changes.
final searchFiltersProvider =
    NotifierProvider.autoDispose<
      SelectionNotifier<CatalogFilters>,
      CatalogFilters
    >(() => SelectionNotifier<CatalogFilters>(const CatalogFilters()));

CatalogFilters _searchOf(Ref ref, CatalogFilters filters) => filters.withSearch(
  ref.watch(searchQueryProvider).trim(),
  ref.watch(searchSortProvider),
);

/// Books matching the query and filters, in [searchSortProvider] order. Empty
/// until there is a query or a filter.
final searchResultsProvider = FutureProvider.autoDispose<List<Book>>((ref) {
  final filters = _searchOf(ref, ref.watch(searchFiltersProvider));
  return filters.query.isEmpty && filters.activeCount == 0
      ? Future.value(const <Book>[])
      : ref.watch(bookRepositoryProvider).searchCatalog(filters);
});

/// How many Books [filters] (with the current query) would show: the Filter
/// sheet's "Show N books".
final searchCountProvider = FutureProvider.autoDispose
    .family<int, CatalogFilters>((ref, filters) async {
      final books = await ref
          .watch(bookRepositoryProvider)
          .searchCatalog(_searchOf(ref, filters));
      return books.length;
    });
