import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/catalog_filters.dart';
import '../providers/search_providers.dart';
import 'search_filter_body.dart';

/// The Filter sheet. Every change applies at once; the footer shows how many
/// Books the current choices give.
class SearchFilterSheet extends ConsumerWidget {
  const SearchFilterSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final f = ref.watch(searchFiltersProvider);
    void set(CatalogFilters next) =>
        ref.read(searchFiltersProvider.notifier).select(next);
    final count = ref.watch(searchCountProvider(f)).value;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Flexible(child: SearchFilterBody()),
          Padding(
            padding: const EdgeInsets.all(Insets.screen),
            child: Row(
              spacing: Insets.md,
              children: [
                TextButton(
                  onPressed: f.activeCount == 0
                      ? null
                      : () => set(const CatalogFilters()),
                  child: Text(l10n.searchFilterReset),
                ),
                Expanded(
                  child: PrimaryButton(
                    label: l10n.searchFilterShow(count ?? 0),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
