import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/catalog_filters.dart';
import '../providers/recent_searches_provider.dart';
import '../providers/search_providers.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/search_filter_pill.dart';
import '../widgets/search_recents.dart';
import '../widgets/search_results_view.dart';
import '../../../scan/presentation/widgets/scan_button.dart';

/// `/catalog/search`: live search by title, Author or Publisher.
/// [sort] and [query] come from the address (`?sort=`, `?q=`), preset by
/// Home's "See all" and search Banners.
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key, this.sort, this.query = ''});

  final SearchSort? sort;
  final String query;

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  Timer? _debounce;
  late final _controller = TextEditingController(text: widget.query);

  @override
  void initState() {
    super.initState();
    // Providers can't change while the tree builds, so preset them after.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchQueryProvider.notifier).select(widget.query);
      ref.read(searchSortChoiceProvider.notifier).select(widget.sort);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _save() =>
      ref.read(recentSearchesProvider.notifier).add(_controller.text);

  /// Runs [value] now: a recent search was tapped, or search was pressed.
  void _run(String value) {
    _debounce?.cancel();
    _controller.text = value;
    ref.read(searchQueryProvider.notifier).select(value);
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
    final hasFilters = ref.watch(searchFiltersProvider).activeCount > 0;
    final hasSort = ref.watch(searchSortChoiceProvider) != null;
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
              autofocus: widget.query.isEmpty && widget.sort == null,
              controller: _controller,
              // Look a book up by its barcode.
              trailing: const ScanButton(),
              onChanged: _onChanged,
              onSubmitted: (value) {
                _run(value);
                _save();
              },
            ),
          ),
          const SearchPillRow(),
          Expanded(
            child: query.isEmpty && !hasFilters && !hasSort
                ? SearchRecents(onPick: _run)
                : SearchResultsView(query: query, onOpen: _save),
          ),
        ],
      ),
    );
  }
}
