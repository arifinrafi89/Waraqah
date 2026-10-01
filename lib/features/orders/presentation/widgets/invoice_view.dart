import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import '../../../checkout/presentation/widgets/checkout_labels.dart';
import '../../domain/entities/order.dart';
import 'invoice_lines.dart';
import 'order_labels.dart';
import 'order_totals.dart';

/// The invoice itself: sold by Waraqah, the order number and date, where
/// it went, the books, the totals and how it was paid.
class InvoiceView extends StatelessWidget {
  const InvoiceView({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final faint = AppFonts.ui(size: 11.5, color: palette.textFaint);
    final divider = Divider(height: Insets.lg, color: palette.border);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.xs,
        children: [
          Text(l10n.orderInvoiceSeller, style: context.texts.titleMedium),
          Text(
            '${order.number} · ${context.orderDate(order.placedAt)}',
            style: AppFonts.numeric(size: 13, color: palette.textDim),
          ),
          divider,
          Text(
            order.needsDelivery
                ? l10n.orderInvoiceShipTo
                : l10n.checkoutEbooksOnly,
            style: faint,
          ),
          if (order.needsDelivery) ...[
            Text(order.addressLabel, style: context.texts.titleSmall),
            Text(order.addressLine, style: faint),
          ],
          divider,
          InvoiceLines(order: order),
          divider,
          OrderTotals(order: order),
          divider,
          Text(
            '${l10n.paymentName(order.payment)} · '
            '${order.payment.isPrepaid ? l10n.orderPaid : l10n.orderPayOnDelivery}',
            style: context.texts.titleSmall,
          ),
          const SizedBox(height: Insets.sm),
          Text(
            l10n.orderInvoiceThanks,
            textAlign: TextAlign.center,
            style: faint,
          ),
        ],
      ),
    );
  }
}
