import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import '../../../checkout/presentation/widgets/checkout_labels.dart';
import '../../domain/entities/order.dart';
import 'order_gift_note.dart';
import 'order_totals.dart';

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
            OrderGiftNote(gift: gift, isDonation: order.isDonation),
            Divider(height: Insets.md, color: palette.border),
          ],
          Text(l10n.checkoutStepPayment, style: faint),
          Text(
            '${l10n.paymentName(order.payment)} · '
            '${order.payment.isPrepaid ? l10n.orderPaid : l10n.orderPayOnDelivery}',
            style: context.texts.titleSmall,
          ),
          Divider(height: Insets.md, color: palette.border),
          OrderTotals(order: order),
        ],
      ),
    );
  }
}
