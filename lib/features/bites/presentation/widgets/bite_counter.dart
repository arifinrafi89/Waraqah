import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/bite_rules.dart';

/// "n/500", in the danger colour once [text] is over [max].
class BiteCounter extends StatelessWidget {
  const BiteCounter({super.key, required this.text, required this.max});

  final String text;
  final int max;

  @override
  Widget build(BuildContext context) {
    final n = BiteRules.length(text);
    final palette = context.palette;
    return Text(
      '$n/$max',
      style: AppFonts.ui(
        size: 12,
        weight: FontWeight.w700,
        color: n > max ? palette.danger : palette.textFaint,
      ),
    );
  }
}
