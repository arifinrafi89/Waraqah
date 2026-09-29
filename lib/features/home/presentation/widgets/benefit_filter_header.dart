import 'package:flutter/material.dart';

import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/glass_background.dart';
import 'benefit_filter_row.dart';

const double _height = 54;

/// Pins the Benefit filter row under the app bar so it stays in view.
class BenefitFilterHeader extends StatelessWidget {
  const BenefitFilterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(pinned: true, delegate: _Delegate());
  }
}

class _Delegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => _height;

  @override
  double get maxExtent => _height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlaps) {
    return const GlassBackground(
      child: ContentWidth(child: Center(child: BenefitFilterRow())),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate old) => false;
}
