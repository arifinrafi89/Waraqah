import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../domain/entities/sell_back.dart';

/// A small cover, the title and the author, with an optional [trailing].
class SellBackBookRow extends StatelessWidget {
  const SellBackBookRow({super.key, required this.book, this.trailing});

  final SellBackBook book;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      spacing: Insets.md,
      children: [
        SizedBox(
          width: 40,
          child: CoverArt(
            title: book.title,
            seed: book.coverSeed,
            aspectRatio: 2 / 3,
            fontSize: 6,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(book.title, style: context.texts.titleSmall),
              Text(
                book.author,
                style: AppFonts.ui(size: 12, color: context.palette.textDim),
              ),
            ],
          ),
        ),
        ?trailing,
      ],
    ),
  );
}
