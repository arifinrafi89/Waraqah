import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/domain/entities/delivery_area.dart';
import '../../../catalog/domain/entities/delivery_estimate.dart';
import '../../../home/home_routes.dart';
import '../../../orders/orders_routes.dart';
import '../../domain/entities/order_receipt.dart';
import '../../domain/entities/payment_method.dart';
import '../providers/checkout_providers.dart';
import '../widgets/checkout_labels.dart';

/// `/checkout/placed`: the order number, what was paid (or is due at the
/// door) and when it arrives, with a way to track it.
class OrderPlacedPage extends ConsumerWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final receipt = ref.watch(lastReceiptProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Insets.xl),
            child: Column(
              spacing: Insets.sm,
              children: [
                if (receipt != null) ...[
                  Icon(
                    Icons.check_circle_rounded,
                    size: 64,
                    color: palette.accent,
                  ),
                  const SizedBox(height: Insets.sm),
                  Text(l10n.orderPlacedTitle, style: context.texts.titleLarge),
                  Text(
                    l10n.orderPlacedNumber(receipt.number),
                    style: AppFonts.numeric(size: 15, color: palette.text),
                  ),
                  for (final line in _details(l10n, receipt))
                    Text(
                      line,
                      textAlign: TextAlign.center,
                      style: AppFonts.ui(size: 12.5, color: palette.textDim),
                    ),
                ],
                const SizedBox(height: Insets.lg),
                if (receipt != null)
                  PrimaryButton(
                    label: l10n.orderTrack,
                    onPressed: () =>
                        context.go(OrdersRoutes.detailsFor(receipt.number)),
                  ),
                SecondaryButton(
                  label: l10n.orderPlacedContinue,
                  onPressed: () => context.go(HomeRoutes.home),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> _details(AppL10n l10n, OrderReceipt receipt) {
    final total = Bdt.format(receipt.totalBdt);
    final days = DeliveryEstimate.printed(
      receipt.insideDhaka
          ? DeliveryArea.insideDhaka
          : DeliveryArea.outsideDhaka,
    );
    return [
      receipt.payment.isPrepaid
          ? l10n.orderPlacedPaid(total, l10n.paymentName(receipt.payment))
          : l10n.orderPlacedPayOnDelivery(total),
      receipt.needsDelivery
          ? l10n.bookArrivesInDays(days.minDays, days.maxDays)
          : l10n.checkoutEbooksOnly,
      if (receipt.walletUsedBdt > 0)
        l10n.orderPlacedFromWallet(Bdt.format(receipt.walletUsedBdt)),
      if (receipt.hasPreorders) l10n.bookShipsOnRelease,
      if (receipt.giftFor case final name?) l10n.orderPlacedGiftFor(name),
      if (receipt.pointsEarned > 0)
        l10n.orderPointsEarned(receipt.pointsEarned),
    ];
  }
}
