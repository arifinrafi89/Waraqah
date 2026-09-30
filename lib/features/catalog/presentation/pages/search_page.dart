import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/catalog_providers.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/book_list_skeleton.dart';
import '../widgets/search_no_results.dart';
import '../widgets/search_sort_pill.dart';
import 'catalog_results_list.dart';

/// `/catalog/search`: live search by title, Author or Publisher.
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  /// Runs the search 300 ms after the last keystroke.
  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 300),
      () => ref.read(searchQueryProvider.notifier).select(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final query = ref.watch(searchQueryProvider).trim();
    final results = ref.watch(searchResultsProvider);
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const BackAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
            child: AppTextField(
              hint: l10n.searchFieldHint,
              icon: Icons.search_rounded,
              radius: 14,
              autofocus: true,
              onChanged: _onChanged,
            ),
          ),
          const SearchSortPill(),
          Expanded(
            child: query.isEmpty
                ? Center(
                    child: Text(
                      l10n.searchHint,
                      style: context.texts.bodyMedium,
                    ),
                  )
                : AsyncView(
                    value: results,
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
                              Expanded(child: CatalogResultsList(books: books)),
                            ],
                          ),
                  ),
          ),
        ],
      ),
    );
  }
}
