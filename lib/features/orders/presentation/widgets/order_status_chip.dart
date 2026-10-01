import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order_status.dart';
import 'order_labels.dart';

/// "Shipped" in a small pill: green once delivered, red when cancelled.
class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({super.key, required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final color = switch (status) {
      OrderStatus.delivered => palette.accent,
      OrderStatus.cancelled => palette.danger,
      _ => palette.textDim,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Insets.sm, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(Radii.pill),
      ),
      child: Text(
        AppL10n.of(context)!.orderStatus(status),
        style: AppFonts.ui(size: 11, weight: FontWeight.w800, color: color),
      ),
    );
  }
}
