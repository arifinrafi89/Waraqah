import 'package:flutter/material.dart';

/// Widest a screen body grows on desktop; wider windows get side margins.
const double kContentMaxWidth = 1200;

/// Centres [child] and caps it at [kContentMaxWidth].
class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kContentMaxWidth),
        child: child,
      ),
    );
  }
}

/// Sliver twin of [ContentWidth]: side padding that centres [sliver] within
/// [kContentMaxWidth].
class SliverContentWidth extends StatelessWidget {
  const SliverContentWidth({super.key, required this.sliver});

  final Widget sliver;

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (_, constraints) => SliverPadding(
        padding: EdgeInsets.symmetric(
          horizontal: ((constraints.crossAxisExtent - kContentMaxWidth) / 2)
              .clamp(0, double.infinity),
        ),
        sliver: sliver,
      ),
    );
  }
}
