import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order.dart';

/// What an order cost, one line each: books, delivery, gift wrap, coupon,
/// points, wallet, the total, and what was refunded or earned since. The
/// order page and the invoice both show it.
class OrderTotals extends StatelessWidget {
  const OrderTotals({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    String minus(int bdt) => '-${Bdt.format(bdt)}';
    return Column(
      spacing: Insets.sm,
      children: [
        _Row(l10n.cartSubtotal, Bdt.format(order.subtotalBdt)),
        if (order.needsDelivery)
          _Row(
            l10n.checkoutDeliveryFee,
            order.deliveryFeeBdt == 0
                ? l10n.checkoutFree
                : Bdt.format(order.deliveryFeeBdt),
          ),
        if (order.giftWrapBdt > 0)
          _Row(l10n.checkoutGiftWrap, Bdt.format(order.giftWrapBdt)),
        if (order.discountBdt > 0)
          _Row(l10n.checkoutCouponDiscount, minus(order.discountBdt)),
        if (order.pointsUsed > 0)
          _Row(l10n.checkoutPointsDiscount, minus(order.pointsUsed)),
        if (order.walletUsedBdt > 0)
          _Row(l10n.walletTitle, minus(order.walletUsedBdt)),
        _Row(l10n.checkoutTotal, Bdt.format(order.totalBdt), strong: true),
        if (order.refundedBdt > 0)
          _Row(l10n.orderRefundedToWallet, Bdt.format(order.refundedBdt)),
        if (order.pointsEarned > 0)
          _Row(l10n.orderPointsEarnedRow, '+${order.pointsEarned}'),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row(this.label, this.amount, {this.strong = false});

  final String label;
  final String amount;
  final bool strong;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: strong
                ? context.texts.titleSmall
                : AppFonts.ui(size: 12.5, color: palette.textDim),
          ),
        ),
        Text(
          amount,
          style: AppFonts.numeric(size: strong ? 15 : 13, color: palette.text),
        ),
      ],
    );
  }
}
