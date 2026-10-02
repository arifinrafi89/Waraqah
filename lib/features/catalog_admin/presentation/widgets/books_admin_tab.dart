import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_admin_routes.dart';
import '../providers/catalog_admin_providers.dart';
import 'admin_book_row.dart';
import 'admin_list_skeleton.dart';

/// The Books tab: search by title or Author, show or leave out hidden
/// Books, Add book, and a ⋮ menu of tools.
class BooksAdminTab extends ConsumerWidget {
  const BooksAdminTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final query = ref.watch(adminBookQueryProvider).toLowerCase();
    final showHidden = ref.watch(adminShowHiddenProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'books',
        onPressed: () => context.push(CatalogAdminRoutes.newBook),
        icon: const Icon(Icons.add_rounded),
        label: Text(l10n.adminCatalogAddBook),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              Insets.screen,
              Insets.md,
              Insets.screen,
              0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppTextField(
                    hint: l10n.adminCatalogSearchBooks,
                    icon: Icons.search_rounded,
                    onChanged: ref.read(adminBookQueryProvider.notifier).select,
                  ),
                ),
                PopupMenuButton<String>(
                  tooltip: l10n.adminCatalogMoreTools,
                  onSelected: context.push,
                  itemBuilder: (_) => [
                    for (final (path, label) in [
                      (CatalogAdminRoutes.importCsv, l10n.adminCatalogImport),
                      (CatalogAdminRoutes.lowStock, l10n.adminCatalogLowStock),
                    ])
                      PopupMenuItem(value: path, child: Text(label)),
                  ],
                ),
              ],
            ),
          ),
          SwitchListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Insets.screen,
            ),
            title: Text(l10n.adminCatalogShowHidden),
            value: showHidden,
            onChanged: ref.read(adminShowHiddenProvider.notifier).select,
          ),
          Expanded(
            child: AsyncView(
              value: ref.watch(adminBooksProvider),
              skeleton: const AdminListSkeleton(),
              errorLabel: l10n.commonSomethingWentWrong,
              retryLabel: l10n.commonRetry,
              onRetry: () => ref.invalidate(adminBooksProvider),
              builder: (books) {
                final shown = [
                  for (final b in books)
                    if ((showHidden || !b.hidden) &&
                        '${b.title} ${b.author}'.toLowerCase().contains(query))
                      b,
                ];
                if (shown.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(Insets.xl),
                    child: Text(
                      l10n.adminCatalogNoBooks,
                      textAlign: TextAlign.center,
                      style: context.texts.bodyMedium,
                    ),
                  );
                }
                return ListView(
                  padding: const EdgeInsets.fromLTRB(
                    Insets.screen,
                    0,
                    Insets.screen,
                    96,
                  ),
                  children: [
                    for (final book in shown)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: AdminBookRow(key: ValueKey(book.id), book: book),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
