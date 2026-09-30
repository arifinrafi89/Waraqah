import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import 'order_labels.dart';

/// Placed → Confirmed → Packed → Shipped → Delivered, with the time each
/// step was reached. A cancelled order shows the steps it reached, then
/// "Cancelled" in red.
class OrderTimeline extends StatelessWidget {
  const OrderTimeline({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final cancelled = order.status == OrderStatus.cancelled;
    final steps = cancelled
        ? [
            ...OrderStatusX.steps.where((s) => order.reachedAt(s) != null),
            OrderStatus.cancelled,
          ]
        : OrderStatusX.steps;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.lg),
      child: Column(
        children: [
          for (var i = 0; i < steps.length; i++)
            _Step(
              status: steps[i],
              at: order.reachedAt(steps[i]),
              isLast: i == steps.length - 1,
              nextReached:
                  i + 1 < steps.length && order.reachedAt(steps[i + 1]) != null,
            ),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({
    required this.status,
    required this.at,
    required this.isLast,
    required this.nextReached,
  });

  final OrderStatus status;
  final DateTime? at;
  final bool isLast;
  final bool nextReached;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final reached = at != null;
    final color = status == OrderStatus.cancelled
        ? palette.danger
        : reached
        ? palette.accent
        : palette.border;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                margin: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: reached ? color : palette.surface,
                  border: Border.all(color: color, width: 2),
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: nextReached ? palette.accent : palette.border,
                  ),
                ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : Insets.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppL10n.of(context)!.orderStatus(status),
                    style: reached
                        ? context.texts.titleSmall
                        : AppFonts.ui(size: 13, color: palette.textFaint),
                  ),
                  if (at case final at?)
                    Text(
                      context.orderTime(at),
                      style: AppFonts.ui(size: 11, color: palette.textFaint),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
