import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class SummaryLine extends StatelessWidget {
  const SummaryLine({
    super.key,
    required this.label,
    required this.value,
    required this.palette,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final AppPalette palette;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: emphasize ? 15 : 13,
      fontWeight: emphasize ? FontWeight.w800 : FontWeight.w600,
      color: emphasize ? palette.text : palette.textDim,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style),
      ],
    );
  }
}
