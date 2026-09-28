import 'package:flutter/material.dart';

/// Book covers on the design board are a chip colour fading into a darker
/// version of itself. One helper keeps every cover in the app identical.
abstract final class CoverGradient {
  static LinearGradient of(Color base) => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [base, _darken(base)],
  );

  static Color _darken(Color color, [double amount = 0.45]) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withLightness((hsl.lightness * (1 - amount)).clamp(0.0, 1.0))
        .toColor();
  }
}
