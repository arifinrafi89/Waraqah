import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/catalog_filters_edit.dart';
import '../providers/search_providers.dart';
import 'search_filter_groups.dart';

/// The scrolling filter choices of the Filter sheet; each applies at once.
class SearchFilterBody extends ConsumerWidget {
  const SearchFilterBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final f = ref.watch(searchFiltersProvider);
    void set(next) => ref.read(searchFiltersProvider.notifier).select(next);
    Set<T> toggle<T>(Set<T> all, T v) =>
        all.contains(v) ? ({...all}..remove(v)) : {...all, v};
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchFilterGroup(
            title: l10n.searchFilterSection,
            chips: [
              for (final s in Section.values)
                filterChip(
                  sectionLabel(l10n, s),
                  f.section == s,
                  () => set(f.copyWith(section: f.section == s ? null : s)),
                ),
            ],
          ),
          SearchFilterGroup(
            title: l10n.searchFilterPrice,
            chips: [
              for (final r in priceRanges)
                filterChip(
                  priceLabel(l10n, r),
                  f.minPrice == r.$1 && f.maxPrice == r.$2,
                  () => set(
                    f.minPrice == r.$1 && f.maxPrice == r.$2
                        ? f.copyWith(minPrice: null, maxPrice: null)
                        : f.copyWith(minPrice: r.$1, maxPrice: r.$2),
                  ),
                ),
            ],
          ),
          SearchFilterGroup(
            title: l10n.searchFilterFormat,
            chips: [
              for (final v in BookFormat.values)
                filterChip(
                  formatName(l10n, v),
                  f.formats.contains(v),
                  () => set(f.copyWith(formats: toggle(f.formats, v))),
                ),
            ],
          ),
          SearchFilterGroup(
            title: l10n.searchFilterLanguage,
            chips: [
              for (final v in BookLanguage.values)
                filterChip(
                  languageName(l10n, v),
                  f.languages.contains(v),
                  () => set(f.copyWith(languages: toggle(f.languages, v))),
                ),
            ],
          ),
          SearchFilterGroup(
            title: l10n.searchFilterRating,
            chips: [
              for (final r in ratings)
                filterChip(
                  ratingLabel(l10n, r),
                  f.minRating == r,
                  () => set(f.copyWith(minRating: r)),
                ),
            ],
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.searchFilterInStock),
            value: f.inStockOnly,
            onChanged: (v) => set(f.copyWith(inStockOnly: v)),
          ),
        ],
      ),
    );
  }
}
