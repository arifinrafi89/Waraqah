import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// Filled accent button — the single primary action on a screen.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isBusy = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SizedBox(
      height: Sizes.buttonHeight,
      child: FilledButton(
        onPressed: isBusy ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: palette.accent,
          foregroundColor: palette.accentInk,
          disabledBackgroundColor: palette.accent.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Radii.md),
          ),
        ),
        child: isBusy
            ? SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  color: palette.accentInk,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: Insets.sm,
                children: [
                  Text(
                    label,
                    style: AppFonts.ui(
                      size: 14,
                      weight: FontWeight.w800,
                      color: palette.accentInk,
                    ),
                  ),
                  if (icon != null) Icon(icon, size: 16),
                ],
              ),
      ),
    );
  }
}

/// Bordered surface button — secondary actions such as "Continue with Google".
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SizedBox(
      height: Sizes.fieldHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: palette.surface,
          side: BorderSide(color: palette.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Radii.md),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 9,
          children: [
            ?icon,
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.ui(
                  size: 13,
                  weight: FontWeight.w700,
                  color: palette.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
