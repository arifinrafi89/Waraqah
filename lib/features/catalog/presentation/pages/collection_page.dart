import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/not_found_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../providers/catalog_providers.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/book_list_skeleton.dart';
import '../widgets/expert_badge.dart';
import 'catalog_results_list.dart';

/// `/catalog/collection/:id`: the Collection's title, who picked it when
/// it's an Expert Pick, why its books were picked, then the books in order.
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
              if (collection.expert case final expert?)
                InkWell(
                  onTap: () => context.push(CatalogRoutes.expertFor(expert.id)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      Insets.screen,
                      0,
                      Insets.screen,
                      Insets.sm,
                    ),
                    child: ExpertBadge(
                      expert: expert,
                      text: l10n.expertPickedBy(expert.label(isBangla)),
                      after: expert.credential(isBangla),
                      style: context.texts.titleSmall?.copyWith(
                        color: context.palette.accent,
                      ),
                    ),
                  ),
                ),
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
