import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../../catalog/presentation/widgets/section_style.dart';
import '../../../catalog/presentation/widgets/used_labels.dart';
import '../../../profile/presentation/providers/address_providers.dart';
import '../../domain/entities/p2p_listing.dart';
import '../providers/p2p_filter_providers.dart';
import 'p2p_filter_menu.dart';

/// The marketplace's filters: condition, location (division, then
/// district), Section then Category, and price.
class P2pMarketplaceFilterBar extends ConsumerWidget {
  const P2pMarketplaceFilterBar({super.key});

  static const List<int> _prices = [300, 500, 1000];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final bangla = Localizations.localeOf(context).languageCode == 'bn';
    final division = ref.watch(p2pFilterDivisionProvider);
    final section = ref.watch(p2pFilterSectionProvider);
    final geo = ref.watch(geoProvider).value ?? const [];
    final districts = geo.where((d) => d.name == division).firstOrNull;
    final categories = section == null
        ? null
        : ref.watch(sectionCategoriesProvider(section)).value;
    void pick<T>(NotifierProvider<SelectionNotifier<T>, T> p, T value) =>
        ref.read(p.notifier).select(value);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.screen,
        vertical: Insets.md,
      ),
      child: Row(
        spacing: Insets.sm,
        children: [
          P2pFilterMenu<BookCondition>(
            label: l10n.usedFilterCondition,
            anyLabel: l10n.usedFilterAnyCondition,
            value: ref.watch(p2pFilterConditionProvider),
            options: {
              for (final c in BookCondition.values) c: l10n.conditionLabel(c),
            },
            onChanged: (v) => pick(p2pFilterConditionProvider, v),
          ),
          P2pFilterMenu<String>(
            label: l10n.usedFilterLocation,
            anyLabel: l10n.usedFilterAllLocations,
            value: division,
            options: {for (final d in geo) d.name: bangla ? d.nameBn : d.name},
            onChanged: (v) {
              pick(p2pFilterDivisionProvider, v);
              pick<String?>(p2pFilterDistrictProvider, null);
            },
          ),
          if (districts != null)
            P2pFilterMenu<String>(
              label: l10n.usedFilterDistrict,
              anyLabel: l10n.usedFilterAllDistricts,
              value: ref.watch(p2pFilterDistrictProvider),
              options: {
                for (final d in districts.districts)
                  d.name: bangla ? d.nameBn : d.name,
              },
              onChanged: (v) => pick(p2pFilterDistrictProvider, v),
            ),
          P2pFilterMenu<Section>(
            label: l10n.usedFilterSection,
            anyLabel: l10n.usedFilterAllSections,
            value: section,
            options: {for (final s in Section.values) s: s.label(l10n)},
            onChanged: (v) {
              pick(p2pFilterSectionProvider, v);
              pick<String?>(p2pFilterCategoryProvider, null);
            },
          ),
          if (categories != null)
            P2pFilterMenu<String>(
              label: l10n.usedFilterCategory,
              anyLabel: l10n.usedFilterAllCategories,
              value: ref.watch(p2pFilterCategoryProvider),
              options: {
                for (final c in categories) c.id: bangla ? c.nameBn : c.nameEn,
              },
              onChanged: (v) => pick(p2pFilterCategoryProvider, v),
            ),
          P2pFilterMenu<int>(
            label: l10n.usedFilterPrice,
            anyLabel: l10n.usedFilterAnyPrice,
            value: ref.watch(p2pFilterMaxPriceProvider),
            options: {
              for (final p in _prices) p: l10n.usedFilterUnder(Bdt.format(p)),
            },
            onChanged: (v) => pick(p2pFilterMaxPriceProvider, v),
          ),
        ],
      ),
    );
  }
}
