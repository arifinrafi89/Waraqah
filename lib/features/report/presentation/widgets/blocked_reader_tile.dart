import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/blocked_reader.dart';
import 'report_actions.dart';

/// One blocked reader: who, since when, and Unblock.
class BlockedReaderTile extends ConsumerWidget {
  const BlockedReaderTile({super.key, required this.reader});

  final BlockedReader reader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final date = DateFormat.yMMMd(
      Localizations.localeOf(context).toLanguageTag(),
    ).format(reader.blockedAt);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Row(
        spacing: Insets.md,
        children: [
          CircleAvatar(
            radius: Sizes.avatar / 2,
            backgroundColor: palette.accentSoft,
            child: Text(
              reader.name.characters.first,
              style: AppFonts.ui(
                size: 13,
                weight: FontWeight.w800,
                color: palette.accent,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(reader.name, style: context.texts.titleSmall),
                Text(
                  l10n.reportBlockedSince(date),
                  style: AppFonts.ui(size: 11.5, color: palette.textDim),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => ref.unblock(context, reader.id, reader.name),
            child: Text(l10n.reportUnblock),
          ),
        ],
      ),
    );
  }
}
