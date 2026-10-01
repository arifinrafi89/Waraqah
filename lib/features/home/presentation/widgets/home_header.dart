import 'package:flutter/material.dart';

import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/glass_background.dart';
import 'home_app_bar.dart';

/// Height of [HomeHeader] below the status bar.
const double kHomeHeaderHeight = 50;

/// Home's one glass header: the app bar.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlassBackground(
      child: SafeArea(
        bottom: false,
        child: ContentWidth(
          child: SizedBox(
            height: kHomeHeaderHeight,
            child: Center(child: HomeAppBar()),
          ),
        ),
      ),
    );
  }
}
