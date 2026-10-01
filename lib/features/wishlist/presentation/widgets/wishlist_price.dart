import 'package:flutter/material.dart';

import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';

/// A saved book's price today (its cheapest edition), with the list price
/// struck out when it's on sale.
class WishlistPrice extends StatelessWidget {
  const WishlistPrice({super.key, required this.edition});

  final Edition edition;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Bdt.format(edition.priceBdt),
          style: AppFonts.numeric(size: 15, color: palette.text),
        ),
        if (edition.isDiscounted)
          Text(
            Bdt.format(edition.listPriceBdt!),
            style: AppFonts.numeric(
              size: 11,
              weight: FontWeight.w600,
              color: palette.textFaint,
              decoration: TextDecoration.lineThrough,
            ),
          ),
      ],
    );
  }
}
