import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../profile/profile_routes.dart';

/// Back button, a title and an optional line under it, for the orders pages.
/// With nothing to go back to, back goes to Profile, where orders live.
class OrdersTopBar extends StatelessWidget {
  const OrdersTopBar({super.key, required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 10),
      child: Row(
        spacing: Insets.md,
        children: [
          AppIconButton(
            icon: Icons.arrow_back_rounded,
            onPressed: () => context.canPop()
                ? context.pop()
                : context.go(ProfileRoutes.profile),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.texts.titleLarge),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: AppFonts.ui(
                      size: 11,
                      weight: FontWeight.w700,
                      color: palette.textFaint,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
