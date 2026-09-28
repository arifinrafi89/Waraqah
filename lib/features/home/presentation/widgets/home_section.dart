import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/section_header.dart';

/// A titled home section: header inside the screen gutter, body full-bleed so
/// horizontal strips can scroll past the edge.
class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.actionLabel,
    this.actionIcon,
    this.onAction,
    this.topPadding = Insets.xl,
    this.gutterBody = false,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final String? actionLabel;
  final IconData? actionIcon;
  final VoidCallback? onAction;
  final double topPadding;

  /// `true` for the book grid, which sits inside the gutter like the header.
  final bool gutterBody;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
            child: SectionHeader(
              title: title,
              subtitle: subtitle,
              actionLabel: actionLabel,
              actionIcon: actionIcon,
              onAction: onAction,
            ),
          ),
          if (gutterBody)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
              child: child,
            )
          else
            child,
        ],
      ),
    );
  }
}
