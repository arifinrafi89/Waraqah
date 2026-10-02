import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/shelf_entry.dart';

class ShelfBookTile extends StatelessWidget {
  const ShelfBookTile({
    super.key,
    required this.entry,
    required this.onMove,
    required this.onProgress,
  });

  final ShelfEntry entry;
  final ValueChanged<ShelfStatus> onMove;
  final ValueChanged<double> onProgress;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.sm,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Insets.md,
            children: [
              Container(
                width: 48,
                height: 68,
                decoration: BoxDecoration(
                  color: palette.accent.withAlpha(28),
                  borderRadius: BorderRadius.circular(Radii.sm),
                ),
                child: Icon(Icons.menu_book_rounded, color: palette.accent),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(entry.title, style: context.texts.titleSmall),
                    Text(
                      entry.author,
                      style: AppFonts.ui(size: 11.5, color: palette.textFaint),
                    ),
                    if (entry.addedAfterDelivery)
                      Text(
                        l10n.shelvesAddedAfterDelivery,
                        style: AppFonts.ui(
                          size: 10.5,
                          weight: FontWeight.w700,
                          color: palette.accent,
                        ),
                      ),
                  ],
                ),
              ),
              PopupMenuButton<ShelfStatus>(
                tooltip: l10n.shelvesMoveTo,
                onSelected: onMove,
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: ShelfStatus.wantToRead,
                    child: Text(l10n.shelvesWantToRead),
                  ),
                  PopupMenuItem(
                    value: ShelfStatus.reading,
                    child: Text(l10n.shelvesReading),
                  ),
                  PopupMenuItem(
                    value: ShelfStatus.finished,
                    child: Text(l10n.shelvesFinished),
                  ),
                ],
              ),
            ],
          ),
          if (entry.status == ShelfStatus.reading) ...[
            LinearProgressIndicator(value: entry.progress),
            Slider(
              value: entry.progress,
              onChanged: onProgress,
              onChangeEnd: onProgress,
            ),
          ],
        ],
      ),
    );
  }
}
