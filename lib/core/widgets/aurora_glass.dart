import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Two slowly drifting colour blobs behind a frosted glass layer. The glass
/// keeps [child] readable in light and dark.
class AuroraGlass extends StatefulWidget {
  const AuroraGlass({super.key, required this.child});

  final Widget child;

  @override
  State<AuroraGlass> createState() => _AuroraGlassState();
}

class _AuroraGlassState extends State<AuroraGlass>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 9),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Stack(
      children: [
        Positioned.fill(
          child: RepaintBoundary(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, _) {
                final t = Curves.easeInOut.transform(_controller.value);
                return Stack(
                  children: [
                    _blob(
                      Alignment.lerp(
                        const Alignment(-1, -1),
                        const Alignment(0.4, 1),
                        t,
                      )!,
                      palette.auroraA,
                    ),
                    _blob(
                      Alignment.lerp(
                        const Alignment(1, 1),
                        const Alignment(-0.4, -1),
                        t,
                      )!,
                      palette.auroraB,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Positioned.fill(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: ColoredBox(color: palette.surface.withValues(alpha: 0.55)),
            ),
          ),
        ),
        widget.child,
      ],
    );
  }

  Widget _blob(Alignment alignment, Color color) => Align(
    alignment: alignment,
    child: FractionallySizedBox(
      widthFactor: 0.6,
      heightFactor: 1.2,
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    ),
  );
}
