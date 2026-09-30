import 'package:flutter/material.dart';

import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';

/// An Edition's price, with its list price struck through when discounted.
class EditionPrice extends StatelessWidget {
  const EditionPrice({
    super.key,
    required this.edition,
    this.size = 15,
    this.alignment = CrossAxisAlignment.end,
  });

  final Edition edition;
  final double size;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Bdt.format(edition.priceBdt),
          style: AppFonts.numeric(size: size, color: palette.text),
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
