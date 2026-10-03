import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';

/// Books finished in each month of the year, as twelve bars.
class MonthBars extends StatelessWidget {
  const MonthBars({super.key, required this.year, required this.perMonth});

  final int year;
  final List<int> perMonth;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    // The narrow month name: J, F, M…
    final month = DateFormat(
      'MMMMM',
      Localizations.localeOf(context).toLanguageTag(),
    );
    final most = math.max(1, perMonth.fold(0, math.max));
    final small = AppFonts.ui(size: 10, color: palette.textDim);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.md,
        children: [
          Text(
            AppL10n.of(context)!.readingPerMonth,
            style: context.texts.titleSmall,
          ),
          AspectRatio(
            aspectRatio: 2.4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 4,
              children: [
                for (final (i, count) in perMonth.indexed)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 4,
                      children: [
                        if (count > 0) Text('$count', style: small),
                        Flexible(
                          child: FractionallySizedBox(
                            heightFactor: math.max(count / most, 0.04),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: count > 0
                                    ? palette.accent
                                    : palette.surface2,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: const SizedBox.expand(),
                            ),
                          ),
                        ),
                        Text(month.format(DateTime(year, i + 1)), style: small),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
