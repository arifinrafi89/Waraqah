import 'package:dio/dio.dart';

import '../../../catalog/domain/repositories/book_repository.dart';
import '../../../../core/models/book.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/assistant_repository.dart';
import '../sources/assistant_fixtures.dart';
import '../sources/assistant_intent.dart';
import '../sources/gemini_chatbot.dart';
import '../sources/waraqah_chatbot.dart';

class AssistantRepositoryImpl implements AssistantRepository {
  AssistantRepositoryImpl(Dio dio, this._books)
    : _gemini = GeminiChatbot(dio),
      _local = WaraqahChatbot();

  final BookRepository _books;
  final GeminiChatbot _gemini;
  final WaraqahChatbot _local;

  @override
  Future<List<ChatMessage>> openConversation() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const [AssistantFixtures.greeting];
  }

  @override
  Future<ChatMessage> ask(String prompt, List<ChatMessage> history) async {
    final intent = AssistantIntent.detect(prompt, [
      for (final message in history) message.text,
    ]);
    final books = intent.searchesBooks
        ? await _searchBooks(intent)
        : const <Book>[];
    if (!_gemini.isConfigured) {
      return _local.replyTo(prompt, intent: intent, books: books);
    }

    try {
      final reply = await _gemini.replyTo(prompt, history, books);
      return reply.copyWith(
        recommendedBookIds: [for (final book in books) book.id],
      );
    } on FormatException {
      return _local.replyTo(prompt, intent: intent, books: books);
    } on DioException {
      return _local.replyTo(prompt, intent: intent, books: books);
    }
  }

  Future<List<Book>> _searchBooks(AssistantIntent intent) async {
    final books = await _books.searchCatalog(
      category: intent.isIslamic ? 'Islamic Studies' : null,
      query: intent.query,
    );
    final relevantBooks = books.where((book) {
      final searchableText = [book.title, book.author, ...book.tags]
        .join(' ')
        .toLowerCase();
      return switch (intent.kind) {
      AssistantIntentKind.quran => searchableText.contains('quran') ||
        searchableText.contains('tafsir'),
      AssistantIntentKind.hadith => searchableText.contains('hadith'),
      AssistantIntentKind.seerah => searchableText.contains('seerah') ||
        searchableText.contains('sealed nectar'),
      AssistantIntentKind.islamicHistory =>
        searchableText.contains('history'),
      _ => true,
      };
    });
    final filtered = intent.maxPrice == null
      ? relevantBooks
      : relevantBooks.where((book) => book.priceBdt <= intent.maxPrice!);
    return filtered.take(4).toList();
  }
}
