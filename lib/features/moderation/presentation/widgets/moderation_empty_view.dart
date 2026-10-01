import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// A tab with nothing to do.
class ModerationEmptyView extends StatelessWidget {
  const ModerationEmptyView({
    super.key,
    required this.icon,
    required this.message,
  });

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Insets.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Insets.sm,
          children: [
            Icon(icon, size: 44, color: palette.textFaint),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppFonts.ui(size: 13, color: palette.textDim),
            ),
          ],
        ),
      ),
    );
  }
}
