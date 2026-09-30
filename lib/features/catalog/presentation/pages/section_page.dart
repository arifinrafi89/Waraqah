import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../providers/catalog_providers.dart';
import '../widgets/book_list_skeleton.dart';
import '../widgets/section_style.dart';
import 'catalog_results_list.dart';

/// `/catalog/section/:section`: the Section's name and every Book in it.
class SectionPage extends ConsumerWidget {
  const SectionPage({super.key, required this.section});

  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final books = ref.watch(sectionBooksProvider(section));
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: Insets.md),
                child: AppIconButton(
                  icon: Icons.arrow_back_rounded,
                  onPressed: () => context.canPop()
                      ? context.pop()
                      : context.go(CatalogRoutes.catalog),
                ),
              ),
              Expanded(
                child: ScreenAppBar(
                  title: section.label(l10n),
                  subtitle: books.hasValue
                      ? l10n.sectionBookCount(books.requireValue.length)
                      : null,
                ),
              ),
            ],
          ),
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
                  ? Center(
                      child: Text(
                        l10n.sectionEmpty,
                        style: context.texts.bodyMedium,
                      ),
                    )
                  : CatalogResultsList(books: list),
            ),
          ),
        ],
      ),
    );
  }
}
