import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/chat_message.dart';
import '../widgets/chat_bubble.dart';

/// Scrolling list of chat turns, with a typing indicator appended while the
/// assistant is composing its reply.
class ChatTranscript extends StatelessWidget {
  const ChatTranscript({
    super.key,
    required this.messages,
    required this.isReplying,
  });

  final List<ChatMessage> messages;
  final bool isReplying;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(Insets.lg, Insets.md, Insets.lg, 10),
      itemCount: messages.length + (isReplying ? 1 : 0),
      separatorBuilder: (_, _) => const SizedBox(height: Insets.md),
      itemBuilder: (_, index) => index < messages.length
          ? ChatBubble(message: messages[index])
          : const _TypingIndicator(),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: palette.surface,
          border: Border.all(color: palette.border),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(Radii.card),
            bottomLeft: Radius.circular(Radii.card),
            bottomRight: Radius.circular(Radii.card),
          ),
        ),
        child: Row(
          spacing: 5,
          children: [
            for (var i = 0; i < 3; i++)
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: palette.textFaint,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
