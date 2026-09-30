import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/catalog_routes.dart';

/// Shown when nothing is saved, with a way back to the books.
class WishlistEmptyView extends StatelessWidget {
  const WishlistEmptyView({super.key});

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
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: palette.accentSoft,
                borderRadius: BorderRadius.circular(Radii.card),
              ),
              child: Icon(
                Icons.favorite_border_rounded,
                color: palette.accent,
                size: 28,
              ),
            ),
            const SizedBox(height: Insets.lg),
            Text(l10n.wishlistEmptyTitle, style: context.texts.titleLarge),
            const SizedBox(height: 6),
            Text(
              l10n.wishlistEmptyBody,
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
