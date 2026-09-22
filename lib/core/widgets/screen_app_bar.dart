import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// The in-body app bar the design board uses: a title block on the left and
/// [actions] on the right, with no Material elevation or tint.
class ScreenAppBar extends StatelessWidget {
  const ScreenAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.actions = const [],
  });

  final String? title;
  final String? subtitle;

  /// Used by Home to show the wordmark instead of a text title.
  final Widget? leading;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Insets.screen, 6, Insets.screen, 14),
      child: Row(
        children: [
          Expanded(
            child: leading ??
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Text(title!, style: context.texts.titleLarge),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(
                          subtitle!,
                          style: AppFonts.ui(
                            size: 11,
                            weight: FontWeight.w700,
                            color: palette.textFaint,
                          ),
                        ),
                      ),
                  ],
                ),
          ),
          ...actions,
        ],
      ),
    );
  }
}
