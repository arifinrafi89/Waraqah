import 'package:flutter/material.dart';

/// Press and hover feedback for a card: shrinks to 0.97 while a pointer is
/// down, lifts slightly on desktop hover. Listens to raw pointer events, so it
/// never steals taps from the child.
class PressScale extends StatefulWidget {
  const PressScale({super.key, required this.child});

  final Widget child;

  @override
  State<PressScale> createState() => _PressScaleState();
}

class _PressScaleState extends State<PressScale> {
  bool _pressed = false;
  bool _hovered = false;

  void _press(bool value) => setState(() => _pressed = value);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Listener(
        onPointerDown: (_) => _press(true),
        onPointerUp: (_) => _press(false),
        onPointerCancel: (_) => _press(false),
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 160),
          offset: _hovered && !_pressed ? const Offset(0, -0.02) : Offset.zero,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 120),
            scale: _pressed ? 0.97 : 1,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
