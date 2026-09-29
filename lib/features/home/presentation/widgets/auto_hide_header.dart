import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/home_providers.dart';
import 'home_header.dart';

const _hideDelay = Duration(seconds: 2);

/// Lays [HomeHeader] over [child] (a scroll view that leaves
/// [kHomeHeaderHeight] of room at its top). Once the user scrolls down past the
/// header, it slides away after [_hideDelay]; any scroll up brings it back.
class AutoHideHeader extends ConsumerStatefulWidget {
  const AutoHideHeader({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<AutoHideHeader> createState() => _AutoHideHeaderState();
}

class _AutoHideHeaderState extends ConsumerState<AutoHideHeader> {
  Timer? _hideTimer;

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  void _setVisible(bool visible) =>
      ref.read(homeHeaderVisibleProvider.notifier).select(visible);

  bool _onScroll(ScrollUpdateNotification n) {
    // Nested horizontal strips report too; only the page scroll counts.
    if (n.depth != 0) return false;
    final delta = n.scrollDelta ?? 0;
    if (delta < 0 || n.metrics.pixels < kHomeHeaderHeight) {
      _hideTimer?.cancel();
      _hideTimer = null;
      _setVisible(true);
    } else if (delta > 0 && _hideTimer == null) {
      _hideTimer = Timer(_hideDelay, () => _setVisible(false));
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final visible = ref.watch(homeHeaderVisibleProvider);
    return Stack(
      children: [
        NotificationListener<ScrollUpdateNotification>(
          onNotification: _onScroll,
          child: widget.child,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AnimatedSlide(
            offset: visible ? Offset.zero : const Offset(0, -1),
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            child: const HomeHeader(),
          ),
        ),
      ],
    );
  }
}
