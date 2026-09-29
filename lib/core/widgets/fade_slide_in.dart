import 'package:flutter/material.dart';

/// Fades and slides its child up once when first mounted. Rebuilds do not
/// replay it; only a new element does. [delay] staggers siblings.
class FadeSlideIn extends StatefulWidget {
  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  final Widget child;
  final Duration delay;

  static const _run = Duration(milliseconds: 350);

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: FadeSlideIn._run + widget.delay,
  )..forward();

  late final _curve = CurvedAnimation(
    parent: _controller,
    curve: Interval(
      widget.delay.inMilliseconds / _controller.duration!.inMilliseconds,
      1,
      curve: Curves.easeOutCubic,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _curve,
      child: SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.06),
          end: Offset.zero,
        ).animate(_curve),
        child: widget.child,
      ),
    );
  }
}
