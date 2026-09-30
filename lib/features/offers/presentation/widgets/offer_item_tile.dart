import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../catalog/catalog_routes.dart';
import '../../domain/entities/offers.dart';

/// One book on offer: cover, title, a line under it, and its price with
/// the usual price struck out when lower. Opens the book.
class OfferItemTile extends StatelessWidget {
  const OfferItemTile({super.key, required this.item, required this.detail});

  final OfferItem item;
  final String detail;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final discounted = item.priceBdt < item.regularPriceBdt;
    return InkWell(
      onTap: () => context.push(CatalogRoutes.bookDetailFor(item.bookId)),
      borderRadius: BorderRadius.circular(Radii.sm),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          spacing: Insets.md,
          children: [
            SizedBox(
              width: 44,
              child: CoverArt(
                title: item.title,
                seed: item.coverSeed,
                fontSize: 6.5,
                radius: 6,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.texts.titleSmall,
                  ),
                  Text(
                    detail,
                    style: AppFonts.ui(size: 11.5, color: palette.textFaint),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Bdt.format(item.priceBdt),
                  style: AppFonts.numeric(size: 14, color: palette.text),
                ),
                if (discounted)
                  Text(
                    Bdt.format(item.regularPriceBdt),
                    style: AppFonts.numeric(
                      size: 11,
                      weight: FontWeight.w600,
                      color: palette.textFaint,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
