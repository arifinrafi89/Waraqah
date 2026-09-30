import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/look_inside.dart';

/// A table of contents: part headings, and chapters numbered from 1 again
/// inside each part.
class ContentsList extends StatelessWidget {
  const ContentsList({super.key, required this.entries});

  final List<ContentsEntry> entries;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    if (entries.isEmpty) {
      return Center(child: Text(AppL10n.of(context)!.bookLookInsideNone));
    }
    // Chapter numbers start again after each part heading.
    final numbers = <int>[];
    var chapter = 0;
    for (final entry in entries) {
      chapter = entry.isPart ? 0 : chapter + 1;
      numbers.add(chapter);
    }
    return ListView(
      padding: const EdgeInsets.all(Insets.screen),
      children: [
        for (final (i, entry) in entries.indexed)
          if (entry.isPart)
            Padding(
              padding: const EdgeInsets.only(top: Insets.lg, bottom: Insets.sm),
              child: Text(entry.title, style: context.texts.titleMedium),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Insets.md,
                children: [
                  SizedBox(
                    width: 22,
                    child: Text(
                      '${numbers[i]}',
                      textAlign: TextAlign.end,
                      style: AppFonts.numeric(
                        size: 13,
                        color: palette.textFaint,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      entry.title,
                      style: AppFonts.ui(size: 13.5, color: palette.text),
                    ),
                  ),
                ],
              ),
            ),
      ],
    );
  }
}
