import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/settings/settings_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../data/repositories/assistant_repository_impl.dart';
import '../../data/sources/assistant_remote_source.dart';
import '../../data/sources/gemini_chatbot.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/assistant_repository.dart';
import '../../domain/usecases/ask_assistant.dart';
import '../../domain/usecases/open_conversation.dart';

/// Replies come in the app's language (the device's until one is chosen).
final assistantRepositoryProvider = Provider<AssistantRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AssistantRepositoryImpl(
    AssistantRemoteSource(dio),
    ref.watch(bookRepositoryProvider),
    GeminiChatbot(dio),
    () =>
        ref.read(settingsProvider).locale?.languageCode ??
        PlatformDispatcher.instance.locale.languageCode,
  );
});

/// Holds the conversation and the "assistant is typing" flag.
class ConversationNotifier extends AsyncNotifier<List<ChatMessage>> {
  bool _isReplying = false;

  bool get isReplying => _isReplying;

  @override
  Future<List<ChatMessage>> build() => OpenConversation(
    ref.watch(assistantRepositoryProvider),
  )(const NoParams());

  Future<void> send(String prompt) async {
    final trimmed = prompt.trim();
    final history = state.value;
    if (trimmed.isEmpty || history == null || _isReplying) return;

    final turn = ChatMessage(
      id: 'user-${DateTime.now().microsecondsSinceEpoch}',
      role: ChatRole.user,
      text: trimmed,
    );
    _isReplying = true;
    state = AsyncData([...history, turn]);

    try {
      final reply = await AskAssistant(ref.read(assistantRepositoryProvider))((
        prompt: trimmed,
        history: [...history, turn],
      ));
      state = AsyncData([...history, turn, reply]);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    } finally {
      _isReplying = false;
    }
  }
}

final conversationProvider =
    AsyncNotifierProvider<ConversationNotifier, List<ChatMessage>>(
      ConversationNotifier.new,
    );
