import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class P2pMarketplacePriceBlock extends StatelessWidget {
  const P2pMarketplacePriceBlock({
    super.key,
    required this.price,
    required this.available,
    required this.color,
  });

  final String price;
  final String available;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final isAvailable = available == 'Available';
    final statusColor = isAvailable ? context.palette.accent : context.palette.textFaint;

    return Row(
      children: [
        Expanded(
          child: Text(
            price,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: context.palette.accent,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            available,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: statusColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
