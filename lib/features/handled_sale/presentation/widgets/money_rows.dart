import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';

/// Lines of money, label on the left and taka on the right; the last one
/// is the total.
class MoneyRows extends StatelessWidget {
  const MoneyRows({super.key, required this.rows});

  final List<(String, int)> rows;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      spacing: 6,
      children: [
        for (final (i, (label, bdt)) in rows.indexed)
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: AppFonts.ui(
                    size: 13,
                    weight: i == rows.length - 1
                        ? FontWeight.w800
                        : FontWeight.w500,
                    color: i == rows.length - 1
                        ? palette.text
                        : palette.textDim,
                  ),
                ),
              ),
              Text(
                Bdt.format(bdt),
                style: AppFonts.numeric(
                  size: i == rows.length - 1 ? 16 : 13,
                  color: i == rows.length - 1 ? palette.accent : palette.text,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
