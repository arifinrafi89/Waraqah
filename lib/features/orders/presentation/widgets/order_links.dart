import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import '../../orders_routes.dart';
import 'buy_again_action.dart';

/// Under an order: "Buy again" once it's delivered or cancelled (not for
/// donations, and only when it had new Editions), then the invoice and the
/// return policy.
class OrderLinks extends ConsumerWidget {
  const OrderLinks({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final finished =
        order.status == OrderStatus.delivered ||
        order.status == OrderStatus.cancelled;
    final canBuyAgain =
        finished &&
        !order.isDonation &&
        order.lines.any((line) => line.editionId != null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        if (canBuyAgain)
          SecondaryButton(
            label: l10n.orderBuyAgain,
            icon: const Icon(Icons.replay_rounded, size: 18),
            onPressed: () => ref.buyAgain(context, order),
          ),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.receipt_long_outlined, size: 18),
              label: Text(l10n.orderInvoice),
              onPressed: () =>
                  context.push(OrdersRoutes.invoiceFor(order.number)),
            ),
            TextButton.icon(
              icon: const Icon(Icons.policy_outlined, size: 18),
              label: Text(l10n.orderReturnPolicy),
              onPressed: () => context.push(OrdersRoutes.returnPolicy),
            ),
          ],
        ),
      ],
    );
  }
}
