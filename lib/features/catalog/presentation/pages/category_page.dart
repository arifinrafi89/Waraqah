import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/not_found_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/catalog_providers.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/book_list_skeleton.dart';
import 'catalog_results_list.dart';

/// `/catalog/section/:section/:category`: the Category's name and its Books.
class CategoryPage extends ConsumerWidget {
  const CategoryPage({
    super.key,
    required this.section,
    required this.categoryId,
  });

  final Section section;
  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final categories = ref.watch(sectionCategoriesProvider(section));
    final books = ref.watch(categoryBooksProvider(categoryId));
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    const padding = EdgeInsets.symmetric(horizontal: Insets.screen);
    void retry() {
      ref.invalidate(sectionCategoriesProvider(section));
      ref.invalidate(categoryBooksProvider(categoryId));
    }

    return SafeArea(
      bottom: false,
      child: AsyncView(
        value: categories,
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: retry,
        skeleton: const Column(
          children: [
            BackAppBar(),
            Expanded(
              child: Padding(padding: padding, child: BookListSkeleton()),
            ),
          ],
        ),
        builder: (list) {
          final category = list.where((c) => c.id == categoryId).firstOrNull;
          if (category == null) {
            return Column(
              children: [
                const BackAppBar(),
                Expanded(
                  child: NotFoundView(
                    label: l10n.commonNotFound,
                    backLabel: l10n.commonBack,
                    onBack: BackAppBar.goBack(context),
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              BackAppBar(
                title: isBangla ? category.nameBn : category.nameEn,
                subtitle: books.hasValue
                    ? l10n.sectionBookCount(books.requireValue.length)
                    : null,
              ),
              Expanded(
                child: AsyncView(
                  value: books,
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: retry,
                  skeleton: const Padding(
                    padding: padding,
                    child: BookListSkeleton(),
                  ),
                  builder: (books) => books.isEmpty
                      ? Center(
                          child: Text(
                            l10n.categoryEmpty,
                            style: context.texts.bodyMedium,
                          ),
                        )
                      : CatalogResultsList(books: books),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
