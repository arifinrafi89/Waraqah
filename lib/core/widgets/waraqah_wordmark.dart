import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// The Waraqah logotype: Reem Kufi latin text closed by an accent-coloured
/// Arabic heh, exactly as drawn on the design board.
class WaraqahWordmark extends StatelessWidget {
  const WaraqahWordmark({super.key, this.size = 23});

  final double size;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'Waraqa', style: AppFonts.display(size: size, color: palette.text)),
          TextSpan(
            text: 'ﮪ',
            style: AppFonts.display(size: size, color: palette.accent),
          ),
        ],
      ),
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
      ),
    );
  }
}
