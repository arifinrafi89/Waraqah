import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/catalog_admin_providers.dart';
import '../widgets/admin_list_skeleton.dart';
import '../widgets/admin_page_bar.dart';
import '../widgets/low_stock_row.dart';

/// `/admin/catalog/low-stock`: printed Editions running low, lowest first.
/// A new stock above the limit takes the Edition off the list.
class LowStockPage extends ConsumerWidget {
  const LowStockPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              AdminPageBar(title: l10n.adminCatalogLowStock),
              Expanded(
                child: AsyncView(
                  value: ref.watch(lowStockProvider),
                  skeleton: const AdminListSkeleton(),
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: () => ref.invalidate(lowStockProvider),
                  builder: (editions) => editions.isEmpty
                      ? Center(
                          child: Text(
                            l10n.adminCatalogLowStockEmpty,
                            style: context.texts.bodyMedium,
                          ),
                        )
                      : ListView(
                          padding: const EdgeInsets.all(Insets.screen),
                          children: [
                            for (final e in editions)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: LowStockRow(
                                  key: ValueKey(e.editionId),
                                  edition: e,
                                ),
                              ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
