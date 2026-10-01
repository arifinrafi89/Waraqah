import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/not_found_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/catalog_providers.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/book_list_skeleton.dart';
import 'catalog_results_list.dart';

/// `/catalog/author/:id`: the Author's name, bio and every Book they wrote.
class AuthorPage extends ConsumerWidget {
  const AuthorPage({super.key, required this.authorId});

  final String authorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final author = ref.watch(authorProvider(authorId));
    final books = ref.watch(authorBooksProvider(authorId));
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    return SafeArea(
      bottom: false,
      child: AsyncView(
        value: author,
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () {
          ref.invalidate(authorProvider(authorId));
          ref.invalidate(authorBooksProvider(authorId));
        },
        skeleton: const Column(
          children: [
            BackAppBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.screen),
                child: BookListSkeleton(),
              ),
            ),
          ],
        ),
        builder: (record) => record == null
            ? Column(
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
              )
            : Column(
                children: [
                  BackAppBar(
                    title: isBangla
                        ? record.nameBn ?? record.name
                        : record.name,
                    subtitle: books.hasValue
                        ? l10n.sectionBookCount(books.requireValue.length)
                        : null,
                  ),
                  if (record.bio != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        Insets.screen,
                        0,
                        Insets.screen,
                        Insets.md,
                      ),
                      child: Text(record.bio!, style: context.texts.bodyMedium),
                    ),
                  Expanded(
                    child: AsyncView(
                      value: books,
                      errorLabel: l10n.commonSomethingWentWrong,
                      retryLabel: l10n.commonRetry,
                      onRetry: () =>
                          ref.invalidate(authorBooksProvider(authorId)),
                      skeleton: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Insets.screen,
                        ),
                        child: BookListSkeleton(),
                      ),
                      builder: (list) => list.isEmpty
                          ? Center(
                              child: Text(
                                l10n.authorEmpty,
                                style: context.texts.bodyMedium,
                              ),
                            )
                          : CatalogResultsList(books: list),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
