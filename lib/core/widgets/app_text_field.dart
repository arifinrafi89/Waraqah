import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../theme/app_palette.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// Label above a bordered 46px input with a leading icon — the field style used
/// by both auth forms and the catalog search bar.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.label,
    this.icon,
    this.obscure = false,
    this.keyboardType,
    this.controller,
    this.trailing,
    this.radius = Radii.md,
    this.onChanged,
  });

  final String hint;
  final String? label;
  final IconData? icon;
  final bool obscure;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? trailing;
  final double radius;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        if (label != null)
          Text(label!, style: AppFonts.ui(size: 11.5, weight: FontWeight.w700, color: palette.textDim)),
        Container(
          height: Sizes.fieldHeight,
          padding: EdgeInsets.only(left: 13, right: trailing == null ? 13 : 6),
          decoration: BoxDecoration(
            color: palette.surface,
            border: Border.all(color: palette.border),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Row(
            spacing: Insets.sm,
            children: [
              ?(icon == null
                  ? null
                  : Icon(icon, size: 17, color: palette.textFaint)),
              Expanded(child: _input(palette)),
              ?trailing,
            ],
          ),
        ),
      ],
    );
  }

  Widget _input(AppPalette palette) => TextField(
    controller: controller,
    obscureText: obscure,
    keyboardType: keyboardType,
    onChanged: onChanged,
    style: AppFonts.ui(size: 13, color: palette.text),
    cursorColor: palette.accent,
    decoration: InputDecoration(
      isDense: true,
      border: InputBorder.none,
      hintText: hint,
      hintStyle: AppFonts.ui(size: 13, color: palette.textFaint),
      contentPadding: EdgeInsets.zero,
    ),
  );
}
