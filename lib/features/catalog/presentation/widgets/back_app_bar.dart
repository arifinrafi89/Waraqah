import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../catalog_routes.dart';

/// App bar for pages pushed inside the Catalog tab: back button, title and
/// optional subtitle and [actions]. Back falls through to the Catalog when
/// nothing is below.
class BackAppBar extends StatelessWidget {
  const BackAppBar({super.key, this.title, this.subtitle, this.actions});

  final String? title;
  final String? subtitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: Insets.md),
        child: AppIconButton(
          icon: Icons.arrow_back_rounded,
          onPressed: goBack(context),
        ),
      ),
      Expanded(
        child: ScreenAppBar(
          title: title,
          subtitle: subtitle,
          actions: actions ?? const [],
        ),
      ),
    ],
  );

  /// Pops, or goes to the Catalog when the page was opened directly.
  static VoidCallback goBack(BuildContext context) =>
      () =>
          context.canPop() ? context.pop() : context.go(CatalogRoutes.catalog);
}
