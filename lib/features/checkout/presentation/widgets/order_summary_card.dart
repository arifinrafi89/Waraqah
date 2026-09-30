import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/checkout_totals.dart';

/// Subtotal, delivery, coupon and the total, one line each.
class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
    required this.totals,
    required this.itemCount,
  });

  final CheckoutTotals totals;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        spacing: Insets.sm,
        children: [
          _Line(l10n.checkoutItems(itemCount), Bdt.format(totals.subtotalBdt)),
          if (totals.needsDelivery)
            _Line(
              l10n.checkoutDeliveryFee,
              totals.deliveryFeeBdt == 0
                  ? l10n.checkoutFree
                  : Bdt.format(totals.deliveryFeeBdt),
            ),
          if (totals.couponDiscountBdt > 0)
            _Line(
              l10n.checkoutCouponDiscount,
              '-${Bdt.format(totals.couponDiscountBdt)}',
              color: palette.accent,
            ),
          Divider(height: Insets.sm, color: palette.border),
          _Line(l10n.checkoutTotal, Bdt.format(totals.totalBdt), isTotal: true),
        ],
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line(this.label, this.amount, {this.color, this.isTotal = false});

  final String label;
  final String amount;
  final Color? color;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: isTotal
                ? context.texts.titleSmall
                : AppFonts.ui(size: 12.5, color: palette.textDim),
          ),
        ),
        Text(
          amount,
          style: AppFonts.numeric(
            size: isTotal ? 16 : 13,
            color: color ?? palette.text,
          ),
        ),
      ],
    );
  }
}
