import 'dart:ui';
import 'package:flutter/material.dart';

import '../theme/app_palette.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.opacity = 0.1,
    this.borderRadius,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: (color ?? palette.surface).withValues(alpha: opacity),
            borderRadius: borderRadius ?? BorderRadius.circular(24),
            border: Border.all(
              color: palette.border,
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
