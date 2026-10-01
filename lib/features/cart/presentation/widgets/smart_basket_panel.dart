import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/smart_basket.dart';
import 'budget_sheet.dart';
import 'smart_basket_actions.dart';
import 'used_swap_row.dart';

/// The Smart Basket's content: used swaps with Switch and Switch all, the
/// free-delivery nudge, and Set a budget.
class SmartBasketPanel extends ConsumerWidget {
  const SmartBasketPanel({super.key, required this.basket});

  final SmartBasket basket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final swaps = basket.swaps;
    final toFree = basket.toFreeDeliveryBdt;
    return SurfaceCard(
      padding: const EdgeInsets.fromLTRB(Insets.md, 4, 4, Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          Row(
            spacing: Insets.sm,
            children: [
              Icon(
                Icons.auto_awesome_outlined,
                color: palette.accent,
                size: 20,
              ),
              Expanded(
                child: Text(
                  l10n.cartSmartBasket,
                  style: context.texts.titleSmall,
                ),
              ),
              if (swaps.isNotEmpty)
                TextButton(
                  onPressed: () async {
                    final chosen = await showBudgetSheet(context, basket);
                    if (chosen != null && context.mounted) {
                      await ref.applySwaps(context, chosen);
                    }
                  },
                  child: Text(l10n.cartSetBudget),
                ),
            ],
          ),
          if (swaps.isNotEmpty) ...[
            Text(
              l10n.cartUsedAvailable(
                swaps.length,
                Bdt.format(basket.usedSavingsBdt),
              ),
              style: AppFonts.ui(
                size: 12.5,
                weight: FontWeight.w800,
                color: palette.accent,
              ),
            ),
            for (final swap in swaps) UsedSwapRow(swap: swap),
            if (swaps.length > 1)
              Padding(
                padding: const EdgeInsets.only(right: Insets.sm),
                child: SecondaryButton(
                  label: l10n.cartSwitchAll,
                  onPressed: () => ref.applySwaps(context, swaps),
                ),
              ),
          ],
          if (toFree != null)
            Row(
              spacing: Insets.sm,
              children: [
                Icon(
                  Icons.local_shipping_outlined,
                  color: palette.textDim,
                  size: 18,
                ),
                Expanded(
                  child: Text(
                    l10n.cartToFreeDelivery(Bdt.format(toFree)),
                    style: AppFonts.ui(size: 12, color: palette.textDim),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
