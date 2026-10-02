import 'package:flutter/material.dart';

import '../../../../core/theme/app_typography.dart';

/// A form's error line, in the theme's error colour.
class ProfileErrorText extends StatelessWidget {
  const ProfileErrorText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: AppFonts.ui(
      size: 12,
      weight: FontWeight.w700,
      color: Theme.of(context).colorScheme.error,
    ),
  );
}
