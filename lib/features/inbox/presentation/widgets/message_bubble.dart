import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/inbox_message.dart';
import 'inbox_labels.dart';

/// A chat message: the reader's on the right in the accent colour, the
/// other person's on the left, like the AI assistant's chat.
class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});

  final InboxMessage message;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final mine = message.from == MessageFrom.me;
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.78,
        ),
        child: Column(
          crossAxisAlignment: mine
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          spacing: 3,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              decoration: BoxDecoration(
                color: mine ? palette.accent : palette.surface,
                border: mine ? null : Border.all(color: palette.border),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(mine ? Radii.card : 5),
                  topRight: Radius.circular(mine ? 5 : Radii.card),
                  bottomLeft: const Radius.circular(Radii.card),
                  bottomRight: const Radius.circular(Radii.card),
                ),
              ),
              child: Text(
                message.text ?? '',
                style: AppFonts.ui(
                  size: 13,
                  height: 1.45,
                  weight: FontWeight.w500,
                  color: mine ? palette.accentInk : palette.text,
                ),
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
