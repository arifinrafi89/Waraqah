import '../../domain/entities/chat_message.dart';

/// Scripted conversation used until the Go backend proxies Gemini.
abstract final class AssistantFixtures {
  static const ChatMessage greeting = ChatMessage(
    id: 'ai-greeting',
    role: ChatRole.assistant,
    text: 'Assalamu Alaikum. How can I help you?',
  );

  static const ChatMessage sampleUserTurn = ChatMessage(
    id: 'ai-user-1',
    role: ChatRole.user,
    text: 'Something on building better study habits, under 600 taka.',
  );

  static const ChatMessage priceComparison = ChatMessage(
    id: 'ai-reply-1',
    role: ChatRole.assistant,
    text:
        'Atomic Habits fits well for building a consistent reading routine. '
        'Here is the Waraqah catalog price:',
    recommendedBookId: 'bk-atomic',
  );

  /// Fallback reply for anything the script does not cover.
  static ChatMessage replyTo(String prompt) => ChatMessage(
    id: 'ai-${DateTime.now().microsecondsSinceEpoch}',
    role: ChatRole.assistant,
    text:
        'Looking through the Waraqah catalog for "$prompt". Riyad as-Salihin '
        'and Sapiens both match closely.',
    recommendedBookId: 'bk-riyad',
  );
}
