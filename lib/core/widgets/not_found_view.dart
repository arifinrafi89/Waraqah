import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// For a record that does not exist (a `null` from the API): says so and offers
/// a way back. Not an error, so it has no retry.
class NotFoundView extends StatelessWidget {
  const NotFoundView({
    super.key,
    required this.label,
    required this.backLabel,
    required this.onBack,
  });

  final String label;
  final String backLabel;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: Insets.sm,
        children: [
          Icon(Icons.search_off_rounded, color: palette.textFaint, size: 30),
          Text(label, style: context.texts.titleMedium),
          TextButton(
            onPressed: onBack,
            child: Text(
              backLabel,
              style: AppFonts.ui(
                size: 12,
                weight: FontWeight.w800,
                color: palette.accent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
