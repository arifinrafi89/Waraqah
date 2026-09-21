import 'package:flutter/widgets.dart';

/// Book grid whose column count scales with available width, clamped 2-4.
class ResponsiveBookGrid extends StatelessWidget {
  const ResponsiveBookGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.targetCardWidth = 160,
    this.crossAxisSpacing = 12,
    this.mainAxisSpacing = 12,
    this.childAspectRatio = 0.62,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double targetCardWidth;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = (constraints.maxWidth / targetCardWidth).floor().clamp(2, 4);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
