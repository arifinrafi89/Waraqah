import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../admin/admin_routes.dart';
import '../../domain/entities/catalog_record.dart';
import '../widgets/books_admin_tab.dart';
import '../widgets/records_admin_tab.dart';

/// `/admin/catalog`: Books, Categories, Authors, Publishers and Home's
/// Banners, one tab each.
class CatalogAdminPage extends StatelessWidget {
  const CatalogAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final tabs = <(String, Widget)>[
      (l10n.adminCatalogTabBooks, const BooksAdminTab()),
      (
        l10n.adminCatalogTabCategories,
        const RecordsAdminTab(RecordKind.category),
      ),
      (l10n.adminCatalogTabAuthors, const RecordsAdminTab(RecordKind.author)),
      (
        l10n.adminCatalogTabPublishers,
        const RecordsAdminTab(RecordKind.publisher),
      ),
      (l10n.adminCatalogTabBanners, const SizedBox.shrink()),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: SafeArea(
          child: ContentWidth(
            child: Column(
              children: [
                ScreenAppBar(
                  leading: Row(
                    spacing: Insets.md,
                    children: [
                      AppIconButton(
                        icon: Icons.arrow_back_rounded,
                        tooltip: MaterialLocalizations.of(context)
                            .backButtonTooltip,
                        onPressed: () => context.canPop()
                            ? context.pop()
                            : context.go(AdminRoutes.admin),
                      ),
                      Flexible(
                        child: Text(
                          l10n.adminCatalogTitle,
                          style: context.texts.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelColor: palette.text,
                  unselectedLabelColor: palette.textFaint,
                  indicatorColor: palette.accent,
                  dividerColor: palette.border,
                  labelStyle: context.texts.titleSmall,
                  unselectedLabelStyle: context.texts.titleSmall,
                  tabs: [for (final (label, _) in tabs) Tab(text: label)],
                ),
                Expanded(
                  child: TabBarView(
                    children: [for (final (_, body) in tabs) body],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
