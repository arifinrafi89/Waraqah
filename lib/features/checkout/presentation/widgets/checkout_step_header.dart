import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// "① Delivery address": the numbered title over each checkout step.
class CheckoutStepHeader extends StatelessWidget {
  const CheckoutStepHeader({
    super.key,
    required this.step,
    required this.title,
  });

  final int step;
  final String title;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.md),
      child: Row(
        spacing: Insets.sm,
        children: [
          Container(
            width: 22,
            height: 22,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: palette.accent,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$step',
              style: AppFonts.numeric(size: 11, color: palette.accentInk),
            ),
          ),
          Text(title, style: context.texts.titleMedium),
        ],
      ),
    );
  }
}
