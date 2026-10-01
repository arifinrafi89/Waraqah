import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/segmented_selector.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/providers/booklist_providers.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../../catalog/presentation/widgets/booklist_labels.dart';
import '../../../catalog/presentation/widgets/section_style.dart';
import '../../catalog_admin_routes.dart';
import '../providers/catalog_admin_providers.dart';
import 'admin_list_skeleton.dart';
import 'list_admin_tile.dart';

/// The Collections tab: Collections (Expert Picks too) or Staff Booklists.
/// Tap one to edit it in the builder; the button adds one.
class ListsAdminTab extends ConsumerWidget {
  const ListsAdminTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final booklists = ref.watch(adminShowBooklistsProvider);
    final list = booklists
        ? _list(
            ref.watch(booklistsProvider),
            () => ref.invalidate(booklistsProvider),
            (all) => [
              for (final b in all)
                if (!b.isMine)
                  ListAdminTile(
                    title: b.title(isBangla),
                    tags: [
                      l10n.adminCatalogBookCount(b.books.length),
                      b.kind.label(l10n),
                    ],
                    route: CatalogAdminRoutes.booklistFor(b.id),
                  ),
            ],
          )
        : _list(
            ref.watch(collectionsProvider(null)),
            () => ref.invalidate(collectionsProvider(null)),
            (all) => [
              for (final c in all)
                ListAdminTile(
                  title: c.title(isBangla),
                  tags: [
                    l10n.adminCatalogBookCount(c.books.length),
                    ?c.section?.label(l10n),
                    ?c.expert?.label(isBangla),
                  ],
                  route: CatalogAdminRoutes.collectionFor(c.id),
                ),
            ],
          );
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'lists',
        onPressed: () => context.push(
          booklists
              ? CatalogAdminRoutes.newBooklist
              : CatalogAdminRoutes.newCollection,
        ),
        icon: const Icon(Icons.add_rounded),
        label: Text(l10n.adminCatalogAdd),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Insets.screen),
            child: SegmentedSelector<bool>(
              options: const [false, true],
              labels: [
                l10n.adminCatalogTabCollections,
                l10n.adminCatalogListsBooklists,
              ],
              value: booklists,
              onChanged: ref.read(adminShowBooklistsProvider.notifier).select,
            ),
          ),
          Expanded(child: list),
        ],
      ),
    );
  }

  Widget _list<T>(
    AsyncValue<List<T>> value,
    VoidCallback onRetry,
    List<Widget> Function(List<T>) tiles,
  ) => Builder(
    builder: (context) {
      final l10n = AppL10n.of(context)!;
      return AsyncView(
        value: value,
        skeleton: const AdminListSkeleton(),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: onRetry,
        builder: (all) => ListView(
          padding: const EdgeInsets.fromLTRB(
            Insets.screen,
            0,
            Insets.screen,
            96,
          ),
          children: tiles(all),
        ),
      );
    },
  );
}
