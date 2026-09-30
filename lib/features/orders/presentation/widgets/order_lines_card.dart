import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../catalog/catalog_routes.dart';
import '../../domain/entities/order.dart';

/// The books in an order: title, author × how many, and the line price.
/// Tapping a book opens its page, to buy it again.
class OrderLinesCard extends StatelessWidget {
  const OrderLinesCard({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SurfaceCard(
      clip: true,
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            for (final line in order.lines)
              InkWell(
                onTap: () =>
                    context.push(CatalogRoutes.bookDetailFor(line.bookId)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Insets.md,
                    vertical: 10,
                  ),
                  child: Row(
                    spacing: Insets.md,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              line.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.texts.titleSmall,
                            ),
                            Text(
                              '${line.author} × ${line.quantity}',
                              style: AppFonts.ui(
                                size: 11.5,
                                color: palette.textFaint,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        Bdt.format(line.unitPriceBdt * line.quantity),
                        style: AppFonts.numeric(size: 13, color: palette.text),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
