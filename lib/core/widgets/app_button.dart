import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

enum AppButtonVariant { primary, secondary, outline, destructive, ghost }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.isFullWidth = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Color bg;
    Color fg;
    BorderSide border = BorderSide.none;

    switch (variant) {
      case AppButtonVariant.primary:
        bg = isDark ? AppColors.primaryLight : AppColors.primary;
        fg = isDark ? AppColors.backgroundDark : Colors.white;
        break;
      case AppButtonVariant.secondary:
        bg = AppColors.secondary;
        fg = Colors.black87;
        break;
      case AppButtonVariant.outline:
        bg = Colors.transparent;
        fg = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
        border = BorderSide(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.5,
        );
        break;
      case AppButtonVariant.destructive:
        bg = AppColors.destructive;
        fg = Colors.white;
        break;
      case AppButtonVariant.ghost:
        bg = Colors.transparent;
        fg = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
        break;
    }

    final child = isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(fg),
            ),
          )
        : Row(
            mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18, color: fg),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: AppTypography.label.copyWith(
                  color: fg,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          );

    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        foregroundColor: fg,
        disabledBackgroundColor: bg.withOpacity(0.4),
        disabledForegroundColor: fg.withOpacity(0.4),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: border,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
      onPressed: isLoading ? null : onPressed,
      child: child,
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}
