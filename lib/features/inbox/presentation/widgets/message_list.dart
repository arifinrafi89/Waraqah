import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../report/domain/entities/content_report.dart';
import '../../../report/presentation/widgets/report_on_long_press.dart';
import '../../domain/entities/inbox_message.dart';
import '../../domain/entities/inbox_thread.dart';
import 'event_line.dart';
import 'message_bubble.dart';
import 'offer_card.dart';

/// The conversation, newest at the bottom, starting scrolled to it.
class MessageList extends StatelessWidget {
  const MessageList({super.key, required this.thread});

  final InboxThread thread;

  @override
  Widget build(BuildContext context) {
    final messages = thread.messages.reversed.toList();
    return ListView.separated(
      reverse: true,
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        Insets.md,
        Insets.screen,
        Insets.md,
      ),
      itemCount: messages.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (_, i) {
        final message = messages[i];
        if (message.offer case final offer?) {
          return OfferCard(thread: thread, message: message, offer: offer);
        }
        if (message.event != null) {
          return EventLine(thread: thread, message: message);
        }
        // Long-press the other person's message to report it.
        return ReportOnLongPress(
          target: ReportTarget(kind: ReportTargetKind.message, id: message.id),
          enabled: message.from == MessageFrom.them,
          child: MessageBubble(message: message),
        );
      },
    );
  }
}
