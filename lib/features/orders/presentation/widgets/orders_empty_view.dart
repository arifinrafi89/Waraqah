import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/catalog_routes.dart';

/// Shown before the reader's first order, with a way to the books.
class OrdersEmptyView extends StatelessWidget {
  const OrdersEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Insets.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.receipt_long_outlined, size: 40, color: palette.accent),
            const SizedBox(height: Insets.lg),
            Text(l10n.orderEmptyTitle, style: context.texts.titleLarge),
            const SizedBox(height: 6),
            Text(
              l10n.orderEmptyBody,
              textAlign: TextAlign.center,
              style: AppFonts.ui(
                size: 12.5,
                height: 1.5,
                color: palette.textDim,
              ),
            ),
            const SizedBox(height: Insets.xl),
            PrimaryButton(
              label: l10n.wishlistBrowse,
              onPressed: () => context.go(CatalogRoutes.catalog),
            ),
          ],
        ),
      ),
    );
  }
}
