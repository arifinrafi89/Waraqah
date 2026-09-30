import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/cart_line.dart';

/// A line's total, with the price of one copy under it when there are more.
class CartLinePrice extends StatelessWidget {
  const CartLinePrice({super.key, required this.line});

  final CartLine line;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Bdt.format(line.totalBdt),
          style: AppFonts.numeric(size: 15, color: palette.text),
        ),
        if (line.quantity > 1)
          Text(
            AppL10n.of(context)!.cartEach(Bdt.format(line.unitPriceBdt)),
            style: AppFonts.ui(size: 11, color: palette.textFaint),
          ),
      ],
    );
  }
}
