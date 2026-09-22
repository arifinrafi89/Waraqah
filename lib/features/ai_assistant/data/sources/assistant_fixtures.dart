import '../../domain/entities/chat_message.dart';

/// Scripted conversation used until the Go backend proxies Gemini.
abstract final class AssistantFixtures {
  static const ChatMessage greeting = ChatMessage(
    id: 'ai-greeting',
    role: ChatRole.assistant,
    text:
        'Assalamu alaikum! Tell me what you are studying or what you enjoy '
        'reading, and I will find it in the Waraqah catalog at the best price.',
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
        'Atomic Habits fits well — it is the most borrowed title on campus '
        'this term. Here is what each vendor is charging right now:',
    recommendedBookId: 'bk-atomic',
    quotes: [
      VendorQuote(vendor: 'Rokomari', priceBdt: 590, isLowest: true),
      VendorQuote(vendor: 'Wafilife', priceBdt: 640),
      VendorQuote(vendor: 'Boi Bazar', priceBdt: 675),
    ],
  );

  /// Fallback reply for anything the script does not cover.
  static ChatMessage replyTo(String prompt) => ChatMessage(
    id: 'ai-${DateTime.now().microsecondsSinceEpoch}',
    role: ChatRole.assistant,
    text:
        'Looking through the catalog for "$prompt". Riyad as-Salihin and '
        'Sapiens both match closely — the first is the better value at '
        'Wafilife.',
    recommendedBookId: 'bk-riyad',
    quotes: const [
      VendorQuote(vendor: 'Wafilife', priceBdt: 480, isLowest: true),
      VendorQuote(vendor: 'Rokomari', priceBdt: 525),
    ],
  );
}
