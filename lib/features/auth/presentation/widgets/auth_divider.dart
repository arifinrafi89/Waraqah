import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// "or continue with" rule between the primary and social sign-in buttons.
class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Row(
      spacing: 10,
      children: [
        Expanded(child: Divider(color: palette.border, height: 1)),
        Text(
          label,
          style: AppFonts.ui(
            size: 10.5,
            weight: FontWeight.w700,
            color: palette.textFaint,
          ),
        ),
        Expanded(child: Divider(color: palette.border, height: 1)),
      ],
    );
  }
}

/// Google "G" drawn as text so the screen needs no image asset.
class GoogleGlyph extends StatelessWidget {
  const GoogleGlyph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Radii.sm - 4),
        border: Border.all(color: context.palette.border),
      ),
      child: Text(
        'G',
        style: AppFonts.ui(
          size: 11,
          weight: FontWeight.w800,
          color: const Color(0xFF4285F4),
        ),
      ),
    );
  }
}
