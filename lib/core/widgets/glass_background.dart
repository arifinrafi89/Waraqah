import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Blurred translucent backdrop, the same glass look as the nav bar. Fills
/// its parent; put it in a bar's background slot.
class GlassBackground extends StatelessWidget {
  const GlassBackground({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surface.withValues(alpha: 0.72),
            border: Border(
              bottom: BorderSide(color: palette.border.withValues(alpha: 0.7)),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
