import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/domain/entities/cart_item_ref.dart';
import '../../../cart/presentation/widgets/add_to_cart_action.dart';
import '../../domain/entities/deals.dart';

/// A bundle: its books' covers side by side, their titles, the bundle price
/// against buying them one by one, and a button that adds it to the cart.
class BundleCard extends ConsumerWidget {
  const BundleCard({super.key, required this.bundle});

  final Bundle bundle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          Row(
            spacing: Insets.sm,
            children: [
              for (final item in bundle.items)
                Expanded(
                  child: CoverArt(
                    title: item.title,
                    seed: item.coverSeed,
                    fontSize: 8,
                    radius: Radii.sm,
                  ),
                ),
            ],
          ),
          Text(bundle.title, style: context.texts.titleSmall),
          Text(
            [for (final item in bundle.items) item.title].join(' · '),
            style: AppFonts.ui(size: 11.5, color: palette.textFaint),
          ),
          Wrap(
            spacing: Insets.sm,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                Bdt.format(bundle.priceBdt),
                style: AppFonts.numeric(size: 16, color: palette.text),
              ),
              Text(
                Bdt.format(bundle.regularPriceBdt),
                style: AppFonts.numeric(
                  size: 12,
                  weight: FontWeight.w600,
                  color: palette.textFaint,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                l10n.cartYouSave(Bdt.format(bundle.savingsBdt)),
                style: AppFonts.ui(
                  size: 12,
                  weight: FontWeight.w800,
                  color: palette.accent,
                ),
              ),
            ],
          ),
          SecondaryButton(
            label: l10n.dealAddBundle,
            icon: const Icon(Icons.add_shopping_cart_rounded, size: 18),
            onPressed: () =>
                ref.addToCart(context, CartItemRef.bundle(bundle.id)),
          ),
        ],
      ),
    );
  }
}
