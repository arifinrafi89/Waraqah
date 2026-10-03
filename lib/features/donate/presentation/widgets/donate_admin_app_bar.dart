import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/screen_app_bar.dart';

/// Back (to [fallback] when there's nothing to go back to) and a title.
class DonateAdminAppBar extends StatelessWidget {
  const DonateAdminAppBar({
    super.key,
    required this.title,
    required this.fallback,
  });

  final String title;
  final String fallback;

  @override
  Widget build(BuildContext context) => ScreenAppBar(
    leading: Row(
      spacing: Insets.md,
      children: [
        AppIconButton(
          icon: Icons.arrow_back_rounded,
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () =>
              context.canPop() ? context.pop() : context.go(fallback),
        ),
        Flexible(child: Text(title, style: context.texts.titleLarge)),
      ],
    ),
  );
}
