import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/catalog_filters.dart';
import '../providers/search_providers.dart';

String _label(AppL10n l10n, SearchSort sort) => switch (sort) {
  SearchSort.relevance => l10n.searchSortRelevance,
  SearchSort.priceLow => l10n.searchSortPriceLow,
  SearchSort.priceHigh => l10n.searchSortPriceHigh,
  SearchSort.newest => l10n.searchSortNewest,
  SearchSort.bestselling => l10n.searchSortBestselling,
};

/// The Sort pill: shows the current order, opens a sheet to change it.
class SearchSortPill extends ConsumerWidget {
  const SearchSortPill({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final current = ref.watch(searchSortProvider);
    return ActionChip(
      avatar: const Icon(Icons.swap_vert_rounded, size: 18),
      label: Text('${l10n.searchSort}: ${_label(l10n, current)}'),
      onPressed: () => _open(context, ref),
    );
  }

  void _open(BuildContext context, WidgetRef ref) {
    final hasQuery = ref.read(searchQueryProvider).trim().isNotEmpty;
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheet) => Consumer(
        builder: (_, ref, _) {
          final l10n = AppL10n.of(sheet)!;
          final current = ref.watch(searchSortProvider);
          return SafeArea(
            child: RadioGroup<SearchSort>(
              groupValue: current,
              onChanged: (sort) {
                ref.read(searchSortChoiceProvider.notifier).select(sort);
                Navigator.pop(sheet);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final sort in SearchSort.values)
                    if (sort != SearchSort.relevance || hasQuery)
                      RadioListTile<SearchSort>(
                        value: sort,
                        title: Text(_label(l10n, sort)),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
