import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../home/home_routes.dart';

/// Back button and a title, over the Donate pages.
class DonateHeader extends StatelessWidget {
  const DonateHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 10),
      child: Row(
        spacing: Insets.md,
        children: [
          AppIconButton(
            icon: Icons.arrow_back_rounded,
            onPressed: () =>
                context.canPop() ? context.pop() : context.go(HomeRoutes.home),
          ),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.texts.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
