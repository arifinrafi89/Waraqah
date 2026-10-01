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

/// `/catalog/publisher/:id`: the Publisher's name and every Book it published.
class PublisherPage extends ConsumerWidget {
  const PublisherPage({super.key, required this.publisherId});

  final String publisherId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final publisher = ref.watch(publisherProvider(publisherId));
    final books = ref.watch(publisherBooksProvider(publisherId));
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    const skeleton = Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.screen),
      child: BookListSkeleton(),
    );
    return SafeArea(
      bottom: false,
      child: AsyncView(
        value: publisher,
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () {
          ref.invalidate(publisherProvider(publisherId));
          ref.invalidate(publisherBooksProvider(publisherId));
        },
        skeleton: const Column(
          children: [
            BackAppBar(),
            Expanded(child: skeleton),
          ],
        ),
        builder: (record) => Column(
          children: [
            BackAppBar(
              title: record == null
                  ? null
                  : isBangla
                  ? record.nameBn ?? record.name
                  : record.name,
              subtitle: record != null && books.hasValue
                  ? l10n.sectionBookCount(books.requireValue.length)
                  : null,
            ),
            Expanded(
              child: record == null
                  ? NotFoundView(
                      label: l10n.commonNotFound,
                      backLabel: l10n.commonBack,
                      onBack: BackAppBar.goBack(context),
                    )
                  : AsyncView(
                      value: books,
                      errorLabel: l10n.commonSomethingWentWrong,
                      retryLabel: l10n.commonRetry,
                      onRetry: () =>
                          ref.invalidate(publisherBooksProvider(publisherId)),
                      skeleton: skeleton,
                      builder: (list) => list.isEmpty
                          ? Center(
                              child: Text(
                                l10n.publisherEmpty,
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
