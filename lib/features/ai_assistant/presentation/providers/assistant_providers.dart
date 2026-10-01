import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../data/repositories/assistant_repository_impl.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/assistant_repository.dart';

final assistantRepositoryProvider = Provider<AssistantRepository>(
  (ref) => AssistantRepositoryImpl(
    ref.watch(dioProvider),
    ref.watch(bookRepositoryProvider),
  ),
);

/// Holds the conversation and the "assistant is typing" flag.
class ConversationNotifier extends AsyncNotifier<List<ChatMessage>> {
  bool _isReplying = false;

  bool get isReplying => _isReplying;

  @override
  Future<List<ChatMessage>> build() =>
      ref.watch(assistantRepositoryProvider).openConversation();

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
      final reply = await ref.read(assistantRepositoryProvider).ask(trimmed, [
        ...history,
        turn,
      ]);
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
