import 'package:flutter/material.dart';

import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/glass_background.dart';
import 'home_app_bar.dart';

/// Home's collapsing glass app bar: it slides away on scroll down and returns
/// on the first scroll up, blurring the content that passes under it.
class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: 58,
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      flexibleSpace: GlassBackground(),
      title: ContentWidth(child: HomeAppBar()),
    );
  }
}
