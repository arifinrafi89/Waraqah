import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_icon_button.dart';

/// Chat header: back button, Gemini badge, title and subtitle.
class AssistantAppBar extends StatelessWidget {
  const AssistantAppBar({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.screen, 14),
      child: Row(
        spacing: 10,
        children: [
          AppIconButton(
            icon: Icons.arrow_back_rounded,
            onPressed: () => context.pop(),
          ),
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: palette.accent,
              borderRadius: BorderRadius.circular(Radii.md),
            ),
            child: Icon(
              Icons.auto_awesome_rounded,
              size: 19,
              color: palette.accentInk,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.texts.titleLarge),
                Text(
                  subtitle,
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
