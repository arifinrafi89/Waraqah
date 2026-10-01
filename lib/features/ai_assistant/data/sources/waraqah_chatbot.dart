import '../../domain/entities/chat_message.dart';
import '../../../../core/models/book.dart';
import 'assistant_intent.dart';

/// Local chatbot backend for the Waraqah assistant.
///
/// The service keeps the repository contract independent from the UI and can
/// later be replaced by a remote model without changing the conversation
/// widgets or notifier.
final class WaraqahChatbot {
  Future<ChatMessage> replyTo(
    String prompt, {
    AssistantIntent? intent,
    List<Book> books = const [],
  }) async {
    final normalized = prompt.trim().toLowerCase();
    final detectedIntent = intent ?? AssistantIntent.detect(prompt, const []);
    if (intent != null && detectedIntent.searchesBooks) {
      final text = books.isEmpty
          ? 'I could not find matching books in the Waraqah catalog. Try a '
                'different title, author, subject, or price range.'
          : _catalogReply(detectedIntent, books);
      await Future<void>.delayed(const Duration(milliseconds: 450));
      return ChatMessage(
        id: 'ai-${DateTime.now().microsecondsSinceEpoch}',
        role: ChatRole.assistant,
        text: text,
        recommendedBookIds: [for (final book in books) book.id],
      );
    }
    final reply = _replyFor(normalized, prompt.trim());

    await Future<void>.delayed(const Duration(milliseconds: 450));
    return ChatMessage(
      id: 'ai-${DateTime.now().microsecondsSinceEpoch}',
      role: ChatRole.assistant,
      text: reply.text,
      recommendedBookId: reply.recommendedBookId,
      quotes: reply.quotes,
    );
  }

  String _catalogReply(AssistantIntent intent, List<Book> books) {
    final label = switch (intent.kind) {
      AssistantIntentKind.seerah => 'about the Seerah',
      AssistantIntentKind.hadith => 'Hadith',
      AssistantIntentKind.quran => 'Quran',
      AssistantIntentKind.islamicHistory => 'Islamic history',
      AssistantIntentKind.islamicStudies => 'Islamic studies',
      AssistantIntentKind.islamicSelfDevelopment => 'Islamic self-development',
      AssistantIntentKind.authorSearch => 'by ${intent.query}',
      AssistantIntentKind.priceFilteredSearch => 'within your price range',
      _ => 'you may like',
    };
    final priceNote = intent.maxPrice == null
        ? ''
        : ' under ${intent.maxPrice} taka';
    return 'Here are $label books$priceNote from the Waraqah catalog.';
  }

  _ChatbotReply _replyFor(String normalized, String originalPrompt) {
    if (_containsAny(normalized, ['hello', 'hi', 'hey', 'salam', 'assalamu'])) {
      return const _ChatbotReply(
        'Wa alaikum assalam! I can help you discover books, compare prices, '
        'find study resources, or navigate Waraqah. What are you reading for?',
      );
    }

    if (_containsAny(normalized, [
      'price',
      'cost',
      'cheap',
      'budget',
      'under',
    ])) {
      return const _ChatbotReply(
        'I can help compare book prices across Waraqah vendors. For a '
        'budget-friendly study pick, Atomic Habits is currently the best value.',
        recommendedBookId: 'bk-atomic',
        quotes: [
          VendorQuote(vendor: 'Rokomari', priceBdt: 590, isLowest: true),
          VendorQuote(vendor: 'Wafilife', priceBdt: 640),
          VendorQuote(vendor: 'Boi Bazar', priceBdt: 675),
        ],
      );
    }

    if (_containsAny(normalized, [
      'study',
      'exam',
      'exams',
      'prep',
      'preparation',
      'focus',
      'habit',
      'productivity',
    ])) {
      return const _ChatbotReply(
        'Absolutely. I can help you prepare with a focused study plan, '
        'revision resources, and book recommendations. Tell me the subject, '
        'exam date, and topics you find difficult, and we will break them '
        'into manageable study sessions. Atomic Habits is a practical read '
        'for building a consistent routine.',
        recommendedBookId: 'bk-atomic',
      );
    }

    if (_containsAny(normalized, [
      'quran',
      'qur\'an',
      'islam',
      'hadith',
      'religion',
    ])) {
      return const _ChatbotReply(
        'Waraqah can help you discover Islamic reading as well as academic '
        'books. Riyad as-Salihin is a useful choice for hadith study, and I '
        'can compare its availability and price for you.',
        recommendedBookId: 'bk-riyad',
      );
    }

    if (_containsAny(normalized, [
      'sell',
      'seller',
      'resale',
      'used',
      'second hand',
    ])) {
      return const _ChatbotReply(
        'You can use Waraqah\'s peer-to-peer marketplace to list books you no '
        'longer need. Include the condition, edition, and a fair asking price '
        'so other readers can find them easily.',
      );
    }

    if (_containsAny(normalized, [
      'recommend',
      'suggest',
      'book',
      'read',
      'reading',
    ])) {
      return const _ChatbotReply(
        'Tell me the subject, mood, author, or budget you have in mind. '
        'For a general personal-growth read, Atomic Habits is a strong place '
        'to start, and I can attach the best available vendor price.',
        recommendedBookId: 'bk-atomic',
      );
    }

    if (_containsAny(normalized, ['thank', 'thanks', 'great', 'okay', 'ok'])) {
      return const _ChatbotReply(
        'You are welcome! I am here whenever you want to find a book, compare '
        'a price, or plan your next reading session.',
      );
    }

    return _ChatbotReply(
      'I can help with books, study resources, vendor prices, recommendations, '
      'and Waraqah\'s peer-to-peer marketplace. About "$originalPrompt": tell '
      'me a subject, author, reading goal, or budget and I will narrow it down.',
    );
  }

  bool _containsAny(String value, List<String> terms) {
    final words = value.split(RegExp(r'[^a-z0-9]+')).toSet();
    return terms.any(
      (term) =>
          term.contains(' ') ? value.contains(term) : words.contains(term),
    );
  }
}

final class _ChatbotReply {
  const _ChatbotReply(
    this.text, {
    this.recommendedBookId,
    this.quotes = const [],
  });

  final String text;
  final String? recommendedBookId;
  final List<VendorQuote> quotes;
}
