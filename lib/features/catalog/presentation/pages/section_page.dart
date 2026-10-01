import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/catalog_filters.dart';
import '../providers/catalog_providers.dart';
import '../providers/expert_providers.dart';
import '../providers/section_filters_provider.dart';
import '../widgets/academic_filter_bar.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/book_list_skeleton.dart';
import '../widgets/category_chips.dart';
import '../widgets/collection_strip.dart';
import '../widgets/section_style.dart';
import 'catalog_results_list.dart';

/// `/catalog/section/:section`: the Section's name, its Class, Exam and
/// Subject chips, its Collections and Expert Picks, then its Books.
class SectionPage extends ConsumerWidget {
  const SectionPage({super.key, required this.section});

  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final books = ref.watch(sectionBooksProvider(section));
    // Load the strips alongside the books, not once the list shows them.
    ref
      ..watch(staffCollectionsProvider(section))
      ..watch(expertPicksProvider(section));
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          BackAppBar(
            title: section.label(l10n),
            subtitle: books.hasValue
                ? l10n.sectionBookCount(books.requireValue.length)
                : null,
          ),
          CategoryChips(section: section),
          AcademicFilterBar(section: section),
          Expanded(
            child: AsyncView(
              value: books,
              errorLabel: l10n.commonSomethingWentWrong,
              retryLabel: l10n.commonRetry,
              onRetry: () => ref.invalidate(sectionBooksProvider(section)),
              skeleton: const Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.screen),
                child: BookListSkeleton(),
              ),
              builder: (list) => list.isEmpty
                  ? _Empty(section: section)
                  : CatalogResultsList(
                      books: list,
                      header: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionCollections(section: section),
                          SectionCollections(
                            section: section,
                            expertPicks: true,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

/// No Books: none in the Section yet, or none for the picked chips.
class _Empty extends ConsumerWidget {
  const _Empty({required this.section});

  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final picked = ref.watch(sectionFiltersProvider(section));
    final filtered = picked != CatalogFilters(section: section);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            filtered ? l10n.sectionFilterEmpty : l10n.sectionEmpty,
            style: context.texts.bodyMedium,
          ),
          if (filtered)
            TextButton(
              onPressed: ref
                  .read(sectionFiltersProvider(section).notifier)
                  .clear,
              child: Text(l10n.sectionClearFilters),
            ),
        ],
      ),
    );
  }
}
