import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// Suggested opening questions, shown above the composer.
class PromptChipRow extends StatelessWidget {
  const PromptChipRow({super.key, required this.prompts, required this.onTap});

  final List<String> prompts;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(14, 6, 14, Insets.sm),
      child: Row(
        spacing: 7,
        children: [
          for (final prompt in prompts)
            InkWell(
              onTap: () => onTap(prompt),
              borderRadius: BorderRadius.circular(Radii.pill),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Insets.md,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: palette.surface,
                  border: Border.all(color: palette.border),
                  borderRadius: BorderRadius.circular(Radii.pill),
                ),
                child: Text(
                  prompt,
                  style: AppFonts.ui(
                    size: 11,
                    weight: FontWeight.w700,
                    color: palette.textDim,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
