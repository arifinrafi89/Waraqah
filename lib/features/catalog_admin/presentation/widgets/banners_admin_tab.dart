import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/catalog_admin_providers.dart';
import '../providers/catalog_admin_actions.dart';
import 'admin_list_skeleton.dart';
import 'banner_sheet.dart';

/// Home's Banners in display order: move each up or down, tap to edit,
/// or add one.
class BannersAdminTab extends ConsumerWidget {
  const BannersAdminTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final actions = ref.read(catalogAdminActionsProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'banners',
        onPressed: () => showBannerSheet(context),
        icon: const Icon(Icons.add_rounded),
        label: Text(l10n.adminCatalogAdd),
      ),
      body: AsyncView(
        value: ref.watch(adminBannersProvider),
        skeleton: const AdminListSkeleton(),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(adminBannersProvider),
        builder: (banners) => ListView(
          padding: const EdgeInsets.fromLTRB(
            Insets.screen,
            Insets.md,
            Insets.screen,
            96,
          ),
          children: [
            if (banners.isEmpty)
              Text(l10n.adminCatalogNoBanners, textAlign: TextAlign.center),
            for (final (i, b) in banners.indexed)
              Card(
                key: ValueKey(b.id),
                margin: const EdgeInsets.only(bottom: Insets.sm),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: Insets.md),
                  leading: SizedBox(
                    width: 30,
                    child: CoverArt(title: '', seed: b.seed, radius: 6),
                  ),
                  title: Text(
                    b.title(isBangla),
                    style: context.texts.titleSmall,
                  ),
                  subtitle: Text(b.subtitle(isBangla), maxLines: 1),
                  onTap: () => showBannerSheet(context, b),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_upward_rounded),
                        tooltip: l10n.adminCatalogMoveUp,
                        onPressed: i == 0
                            ? null
                            : () => actions.moveBanner(b.id, -1),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_downward_rounded),
                        tooltip: l10n.adminCatalogMoveDown,
                        onPressed: i == banners.length - 1
                            ? null
                            : () => actions.moveBanner(b.id, 1),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
