import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../p2p/p2p_routes.dart';

/// Back and a title, with optional [actions].
class SaleAppBar extends StatelessWidget {
  const SaleAppBar({super.key, required this.title, this.actions = const []});

  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) => ScreenAppBar(
    leading: Row(
      spacing: Insets.md,
      children: [
        AppIconButton(
          icon: Icons.arrow_back_rounded,
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () =>
              context.canPop() ? context.pop() : context.go(P2pRoutes.p2p),
        ),
        Flexible(child: Text(title, style: context.texts.titleLarge)),
      ],
    ),
    actions: actions,
  );
}
