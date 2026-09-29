import 'package:flutter/material.dart';

import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/glass_background.dart';
import 'benefit_filter_row.dart';
import 'home_app_bar.dart';

const double _barHeight = 50;
const double _filterHeight = 42;

/// Height of [HomeHeader] below the status bar.
const double kHomeHeaderHeight = _barHeight + _filterHeight;

/// Home's one glass header: the app bar with the Benefit filter row under it.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlassBackground(
      child: SafeArea(
        bottom: false,
        child: ContentWidth(
          child: Column(
            children: [
              SizedBox(
                height: _barHeight,
                child: Center(child: HomeAppBar()),
              ),
              SizedBox(
                height: _filterHeight,
                child: Center(child: BenefitFilterRow()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
