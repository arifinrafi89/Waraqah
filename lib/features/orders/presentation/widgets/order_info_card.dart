import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import '../../../checkout/presentation/widgets/checkout_labels.dart';
import '../../domain/entities/order.dart';
import 'order_gift_note.dart';

/// Where the order goes, how it's paid, and what it cost.
class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final faint = AppFonts.ui(size: 11.5, color: palette.textFaint);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.sm,
        children: [
          if (order.needsDelivery) ...[
            Text(l10n.orderDeliverTo, style: faint),
            Text(order.addressLabel, style: context.texts.titleSmall),
            Text(order.addressLine, style: faint),
            Divider(height: Insets.md, color: palette.border),
          ],
          if (order.gift case final gift?) ...[
            OrderGiftNote(gift: gift),
            Divider(height: Insets.md, color: palette.border),
          ],
          Text(l10n.checkoutStepPayment, style: faint),
          Text(
            '${l10n.paymentName(order.payment)} · '
            '${order.payment.isPrepaid ? l10n.orderPaid : l10n.orderPayOnDelivery}',
            style: context.texts.titleSmall,
          ),
          Divider(height: Insets.md, color: palette.border),
          _row(context, l10n.cartSubtotal, Bdt.format(order.subtotalBdt)),
          if (order.needsDelivery)
            _row(
              context,
              l10n.checkoutDeliveryFee,
              order.deliveryFeeBdt == 0
                  ? l10n.checkoutFree
                  : Bdt.format(order.deliveryFeeBdt),
            ),
          if (order.giftWrapBdt > 0)
            _row(context, l10n.checkoutGiftWrap, Bdt.format(order.giftWrapBdt)),
          if (order.discountBdt > 0)
            _row(
              context,
              l10n.checkoutCouponDiscount,
              '-${Bdt.format(order.discountBdt)}',
            ),
          if (order.pointsUsed > 0)
            _row(
              context,
              l10n.checkoutPointsDiscount,
              '-${Bdt.format(order.pointsUsed)}',
            ),
          _row(context, l10n.checkoutTotal, Bdt.format(order.totalBdt)),
          if (order.pointsEarned > 0)
            _row(context, l10n.orderPointsEarnedRow, '+${order.pointsEarned}'),
        ],
      ),
    );
  }

  Widget _row(BuildContext context, String label, String amount) => Row(
    children: [
      Expanded(
        child: Text(
          label,
          style: AppFonts.ui(size: 12.5, color: context.palette.textDim),
        ),
      ),
      Text(
        amount,
        style: AppFonts.numeric(size: 13, color: context.palette.text),
      ),
    ],
  );
}
