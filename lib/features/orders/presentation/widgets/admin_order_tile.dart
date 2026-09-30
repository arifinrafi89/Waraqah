import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../checkout/presentation/widgets/checkout_labels.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import '../providers/order_admin_providers.dart';
import 'order_labels.dart';
import 'order_status_chip.dart';

/// One order for support staff: number, status, when, what and where, and
/// a button to move it to its next step.
class AdminOrderTile extends ConsumerWidget {
  const AdminOrderTile({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final next = order.status.next;
    final faint = AppFonts.ui(size: 11.5, color: palette.textFaint);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 4,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  order.number,
                  style: AppFonts.numeric(size: 14, color: palette.text),
                ),
              ),
              OrderStatusChip(status: order.status),
            ],
          ),
          Text(
            '${context.orderDate(order.placedAt)} · '
            '${l10n.checkoutItems(order.itemCount)} · '
            '${Bdt.format(order.totalBdt)}',
            style: faint,
          ),
          Text(
            '${order.addressLabel} · ${l10n.paymentName(order.payment)}',
            style: faint,
          ),
          if (next != null)
            Padding(
              padding: const EdgeInsets.only(top: Insets.sm),
              child: SecondaryButton(
                label: l10n.adminOrderMoveTo(l10n.orderStatus(next)),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                onPressed: () => _advance(context, ref),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _advance(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    final error = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      await ref.read(allOrdersProvider.notifier).advance(order);
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(error)));
    }
  }
}
