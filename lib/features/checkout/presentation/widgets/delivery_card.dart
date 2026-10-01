import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/presentation/providers/cart_providers.dart';
import '../../../catalog/domain/entities/delivery_estimate.dart';
import '../../domain/entities/checkout_totals.dart';
import '../../domain/entities/saved_address.dart';
import '../providers/checkout_providers.dart';

/// Step 2: when the order arrives at the chosen address and what delivery
/// costs, with a nudge towards free delivery.
class DeliveryCard extends ConsumerWidget {
  const DeliveryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final totals = ref.watch(checkoutTotalsProvider);
    final address = ref.watch(chosenAddressProvider);
    if (totals == null || address == null) return const SizedBox.shrink();
    final hasPreorders =
        ref.watch(cartProvider).value?.lines.any((l) => l.isPreorder) ?? false;
    final days = DeliveryEstimate.printed(address.area);
    final fee = totals.deliveryFeeBdt;
    final faint = AppFonts.ui(size: 11.5, color: palette.textFaint);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Row(
        spacing: Insets.md,
        children: [
          Icon(
            totals.needsDelivery
                ? Icons.local_shipping_outlined
                : Icons.download_rounded,
            color: palette.accent,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  totals.needsDelivery
                      ? l10n.bookArrivesInDays(days.minDays, days.maxDays)
                      : l10n.checkoutEbooksOnly,
                  style: context.texts.titleSmall,
                ),
                if (hasPreorders) Text(l10n.bookShipsOnRelease, style: faint),
                if (totals.needsDelivery)
                  Text(
                    fee == 0
                        ? l10n.checkoutFreeDelivery
                        : l10n.checkoutDeliveryFeeIs(Bdt.format(fee)),
                    style: faint,
                  ),
                if (fee > 0)
                  Text(
                    l10n.checkoutFreeDeliveryFrom(
                      Bdt.format(CheckoutTotals.freeDeliveryFromBdt),
                    ),
                    style: AppFonts.ui(
                      size: 11.5,
                      weight: FontWeight.w700,
                      color: palette.accent,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
