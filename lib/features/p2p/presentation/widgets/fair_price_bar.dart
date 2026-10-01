import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/fair_price.dart';

/// From ৳0 to the new price: the fair range shaded, and a marker for the
/// asking price.
class FairPriceBar extends StatelessWidget {
  const FairPriceBar({super.key, required this.fair, required this.askingBdt});

  final FairPrice fair;
  final int askingBdt;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    double at(int bdt) => (bdt / fair.newPriceBdt).clamp(0.0, 1.0);
    return SizedBox(
      height: 14,
      child: LayoutBuilder(
        builder: (context, box) {
          final width = box.maxWidth;
          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: palette.surface2,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Positioned(
                left: width * at(fair.lowBdt),
                width: width * (at(fair.highBdt) - at(fair.lowBdt)),
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: palette.accent,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              if (askingBdt > 0)
                Positioned(
                  left: (width * at(askingBdt) - 2).clamp(0, width - 4),
                  child: Container(
                    width: 4,
                    height: 14,
                    decoration: BoxDecoration(
                      color: askingBdt >= fair.newPriceBdt
                          ? palette.danger
                          : palette.text,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
