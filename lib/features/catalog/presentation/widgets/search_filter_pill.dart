import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/search_providers.dart';
import 'search_filter_sheet.dart';
import 'search_sort_pill.dart';

/// The Filter pill: a badge shows how many filters are set; opens the sheet.
class SearchFilterPill extends ConsumerWidget {
  const SearchFilterPill({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(searchFiltersProvider).activeCount;
    return ActionChip(
      avatar: Badge(
        isLabelVisible: active > 0,
        label: Text('$active'),
        child: const Icon(Icons.tune_rounded, size: 18),
      ),
      label: Text(AppL10n.of(context)!.searchFilter),
      onPressed: () => showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (_) => const SearchFilterSheet(),
      ),
    );
  }
}

/// The Filter and Sort pills under the search field.
class SearchPillRow extends StatelessWidget {
  const SearchPillRow({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(
      horizontal: Insets.screen,
      vertical: Insets.sm,
    ),
    child: Wrap(
      spacing: Insets.sm,
      children: [SearchFilterPill(), SearchSortPill()],
    ),
  );
}
