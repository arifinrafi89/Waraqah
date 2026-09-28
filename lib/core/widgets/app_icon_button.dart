import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../theme/app_palette.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// A 38x38 surface-tinted icon button, optionally carrying a count badge
/// (used by the cart icon in the home app bar).
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.badgeCount,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final int? badgeCount;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final button = InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(Radii.md),
      child: Container(
        width: Sizes.iconButton,
        height: Sizes.iconButton,
        decoration: BoxDecoration(
          color: palette.surface,
          border: Border.all(color: palette.border),
          borderRadius: BorderRadius.circular(Radii.md),
        ),
        child: Icon(icon, size: 18, color: palette.textDim),
      ),
    );
    final badged = badgeCount == null
        ? button
        : Stack(clipBehavior: Clip.none, children: [button, _badge(palette)]);
    return tooltip == null ? badged : Tooltip(message: tooltip!, child: badged);
  }

  Widget _badge(AppPalette palette) => Positioned(
    top: -4,
    right: -4,
    child: Container(
      constraints: const BoxConstraints(minWidth: 15),
      height: 15,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: palette.accent,
        borderRadius: BorderRadius.circular(Radii.pill),
        border: Border.all(color: palette.bg, width: 2),
      ),
      child: Text(
        '$badgeCount',
        style: AppFonts.numeric(size: 9, color: palette.accentInk),
      ),
    ),
  );
}
