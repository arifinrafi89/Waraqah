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

/// `/catalog/collection/:id`: the Collection's title, why its books were
/// picked, then the books in the order Staff chose.
class CollectionPage extends ConsumerWidget {
  const CollectionPage({super.key, required this.collectionId});

  final String collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    return SafeArea(
      bottom: false,
      child: AsyncView(
        value: ref.watch(collectionProvider(collectionId)),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(collectionProvider(collectionId)),
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
        builder: (collection) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackAppBar(
              title: collection?.title(isBangla),
              subtitle: collection == null
                  ? null
                  : l10n.sectionBookCount(collection.books.length),
            ),
            if (collection == null)
              Expanded(
                child: NotFoundView(
                  label: l10n.commonNotFound,
                  backLabel: l10n.commonBack,
                  onBack: BackAppBar.goBack(context),
                ),
              )
            else ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  Insets.screen,
                  0,
                  Insets.screen,
                  Insets.md,
                ),
                child: Text(
                  collection.note(isBangla),
                  style: context.texts.bodyMedium,
                ),
              ),
              Expanded(child: CatalogResultsList(books: collection.books)),
            ],
          ],
        ),
      ),
    );
  }
}
