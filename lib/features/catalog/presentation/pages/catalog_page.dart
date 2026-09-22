import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/filter_chip_bar.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/catalog_providers.dart';
import '../widgets/book_list_skeleton.dart';
import '../widgets/catalog_categories.dart';
import '../widgets/catalog_result_bar.dart';
import 'catalog_results_list.dart';

/// Screen 3 — the cross-vendor book catalog with search, category pills and
/// price-sorted results.
class CatalogPage extends ConsumerWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final categories = CatalogCategories(l10n);
    final results = ref.watch(catalogResultsProvider);
    final total = ref.watch(catalogTotalProvider);
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          ScreenAppBar(
            title: l10n.catalogTitle,
            subtitle: l10n.catalogSubtitle(
              Counts.grouped(total.value ?? 0),
            ),
            actions: [
              AppIconButton(
                icon: Icons.shopping_bag_outlined,
                badgeCount: 2,
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
            child: AppTextField(
              hint: l10n.catalogSearchHint,
              icon: Icons.search_rounded,
              radius: 14,
              onChanged: (value) =>
                  ref.read(catalogQueryProvider.notifier).select(value),
            ),
          ),
          const SizedBox(height: Insets.md),
          FilterChipBar(
            labels: categories.labels,
            selectedIndex: CatalogCategories.indexOf(
              ref.watch(catalogCategoryProvider),
            ),
            onSelected: (index) => ref
                .read(catalogCategoryProvider.notifier)
                .select(CatalogCategories.values[index]),
          ),
          CatalogResultBar(
            resultLabel: l10n.catalogResults(results.value?.length ?? 0),
            sortLabel: l10n.catalogSortPriceAsc,
            filterLabel: l10n.commonFilter,
          ),
          Expanded(
            child: AsyncView(
              value: results,
              errorLabel: l10n.commonSomethingWentWrong,
              retryLabel: l10n.commonRetry,
              onRetry: () => ref.invalidate(catalogResultsProvider),
              skeleton: const Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.screen),
                child: BookListSkeleton(),
              ),
              builder: (books) => CatalogResultsList(books: books),
            ),
          ),
        ],
      ),
    );
  }
}
