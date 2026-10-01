import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/inbox_message.dart';
import '../../domain/entities/inbox_thread.dart';
import 'inbox_labels.dart';

/// A deal event in the middle of the conversation: "Nabila accepted your
/// offer of ৳400. The book is reserved for you."
class EventLine extends StatelessWidget {
  const EventLine({super.key, required this.thread, required this.message});

  final InboxThread thread;
  final InboxMessage message;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final good = switch (message.event) {
      ThreadEvent.offerAccepted || ThreadEvent.sold => true,
      _ => false,
    };
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Insets.md, vertical: 8),
        decoration: BoxDecoration(
          color: good ? palette.accentSoft : palette.surface2,
          borderRadius: BorderRadius.circular(Radii.md),
        ),
        child: Column(
          spacing: 2,
          children: [
            Text(
              l10n.eventText(message, thread),
              textAlign: TextAlign.center,
              style: AppFonts.ui(
                size: 12,
                weight: FontWeight.w600,
                color: good ? palette.text : palette.textDim,
              ),
            ),
            Text(
              messageTime(context, message.at),
              style: AppFonts.ui(size: 10, color: palette.textFaint),
            ),
          ],
        ),
      ),
    );
  }
}
