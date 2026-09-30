import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../offers/presentation/providers/offers_providers.dart';

/// An Edition's price, with its list price struck through when discounted.
/// During a flash sale it shows the sale price against the usual one.
class EditionPrice extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final flash = ref.watch(flashItemProvider(edition.id))?.priceBdt;
    final was = flash == null ? edition.listPriceBdt : edition.priceBdt;
    final struck = was != null && was > (flash ?? edition.priceBdt);
    return Column(
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Bdt.format(flash ?? edition.priceBdt),
          style: AppFonts.numeric(size: size, color: palette.text),
        ),
        if (struck)
          Text(
            Bdt.format(was),
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
