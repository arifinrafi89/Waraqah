import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';

/// The sample pages, one per swipe, set like a printed page, with "Page 1
/// of 2" under each and a note when the sample ends.
class SamplePages extends StatelessWidget {
  const SamplePages({super.key, required this.pages});

  final List<String> pages;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    if (pages.isEmpty) return Center(child: Text(l10n.bookLookInsideNone));
    return PageView.builder(
      itemCount: pages.length,
      itemBuilder: (_, i) => ListView(
        padding: const EdgeInsets.all(Insets.screen),
        children: [
          SurfaceCard(
            radius: Radii.sm,
            padding: const EdgeInsets.fromLTRB(22, 26, 22, 26),
            child: Text(
              pages[i],
              style: AppFonts.ui(
                size: 15,
                weight: FontWeight.w500,
                height: 1.75,
                color: palette.text,
              ),
            ),
          ),
          const SizedBox(height: Insets.md),
          Text(
            i == pages.length - 1
                ? '${l10n.bookPageOf(i + 1, pages.length)} · '
                      '${l10n.bookSampleEnds}'
                : '${l10n.bookPageOf(i + 1, pages.length)} · '
                      '${l10n.bookSwipeForMore}',
            textAlign: TextAlign.center,
            style: AppFonts.ui(size: 11.5, color: palette.textFaint),
          ),
        ],
      ),
    );
  }
}
