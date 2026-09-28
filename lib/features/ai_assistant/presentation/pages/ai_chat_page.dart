import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/assistant_providers.dart';
import '../widgets/assistant_app_bar.dart';
import '../widgets/chat_input_dock.dart';
import '../widgets/chat_skeleton.dart';
import '../widgets/prompt_chip_row.dart';
import 'chat_transcript.dart';

/// Screen 4 — the Gemini-backed reading assistant. Pushed over the shell, so
/// it takes the whole screen.
class AiChatPage extends ConsumerWidget {
  const AiChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final conversation = ref.watch(conversationProvider);
    final notifier = ref.read(conversationProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AssistantAppBar(title: l10n.aiTitle, subtitle: l10n.aiSubtitle),
            Expanded(
              child: AsyncView(
                value: conversation,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(conversationProvider),
                skeleton: const ChatSkeleton(),
                builder: (messages) => ChatTranscript(
                  messages: messages,
                  isReplying: notifier.isReplying,
                ),
              ),
            ),
            PromptChipRow(
              prompts: [
                l10n.aiPromptBudget,
                l10n.aiPromptIslamic,
                l10n.aiPromptExam,
              ],
              onTap: notifier.send,
            ),
            ChatInputDock(
              hint: l10n.aiInputHint,
              isBusy: notifier.isReplying,
              onSend: notifier.send,
            ),
          ],
        ),
      ),
    );
  }
}
