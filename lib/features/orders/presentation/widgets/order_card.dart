import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order.dart';
import '../../orders_routes.dart';
import 'order_labels.dart';
import 'order_status_chip.dart';

/// One order in the list: the first book's cover, the number, the date, how
/// many books and the total, and where it is. Opens the order.
class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final first = order.lines.first;
    final faint = AppFonts.ui(size: 11.5, color: palette.textFaint);
    return SurfaceCard(
      clip: true,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => context.push(OrdersRoutes.detailsFor(order.number)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              spacing: Insets.md,
              children: [
                SizedBox(
                  width: 44,
                  child: CoverArt(
                    title: first.title,
                    seed: first.coverSeed,
                    aspectRatio: Sizes.listThumbWidth / Sizes.listThumbHeight,
                    fontSize: 6.5,
                    radius: 8,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      Text(
                        order.number,
                        style: AppFonts.numeric(size: 14, color: palette.text),
                      ),
                      Text(
                        l10n.orderPlacedOn(context.orderDate(order.placedAt)),
                        style: faint,
                      ),
                      Text(
                        '${l10n.checkoutItems(order.itemCount)} · '
                        '${Bdt.format(order.totalBdt)}',
                        style: faint,
                      ),
                    ],
                  ),
                ),
                OrderStatusChip(status: order.status),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
