import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/presentation/widgets/cart_button.dart';
import '../../catalog_routes.dart';
import '../providers/catalog_providers.dart';
import '../widgets/section_grid.dart';

/// Screen 3 — the Waraqah book catalog: a search bar that opens the Search
/// page, above the Section grid.
class CatalogPage extends ConsumerWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final total = ref.watch(catalogTotalProvider);
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          ScreenAppBar(
            title: l10n.catalogTitle,
            subtitle: l10n.catalogSubtitle(Counts.grouped(total.value ?? 0)),
            actions: const [CartButton()],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
            child: AppTextField(
              hint: l10n.catalogSearchHint,
              icon: Icons.search_rounded,
              radius: 14,
              readOnly: true,
              onTap: () => context.push(CatalogRoutes.search),
            ),
          ),
          const SizedBox(height: Insets.md),
          const Expanded(child: SectionGrid()),
        ],
      ),
    );
  }
}
