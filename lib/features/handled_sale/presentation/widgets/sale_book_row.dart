import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';

/// A small cover, the title and a line under it.
class SaleBookRow extends StatelessWidget {
  const SaleBookRow({
    super.key,
    required this.title,
    required this.coverSeed,
    required this.subtitle,
    this.trailing,
  });

  final String title;
  final int coverSeed;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Row(
    spacing: Insets.md,
    children: [
      SizedBox(
        width: 48,
        child: CoverArt(
          title: title,
          seed: coverSeed,
          aspectRatio: 2 / 3,
          fontSize: 7,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 3,
          children: [
            Text(title, style: context.texts.titleSmall),
            Text(
              subtitle,
              style: AppFonts.ui(size: 12, color: context.palette.textDim),
            ),
          ],
        ),
      ),
      ?trailing,
    ],
  );
}
