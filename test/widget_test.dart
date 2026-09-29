import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/theme/app_palette.dart';
import 'package:waraqah/core/utils/formatters.dart';
import 'package:waraqah/features/ai_assistant/data/repositories/assistant_repository_impl.dart';
import 'package:waraqah/features/ai_assistant/data/sources/assistant_fixtures.dart';
import 'package:waraqah/features/ai_assistant/data/sources/waraqah_chatbot.dart';
import 'package:waraqah/features/ai_assistant/data/sources/assistant_intent.dart';
import 'package:waraqah/features/ai_assistant/data/sources/gemini_chatbot.dart';
import 'package:waraqah/features/ai_assistant/domain/entities/chat_message.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog/domain/repositories/book_repository.dart';

void main() {
  group('Bdt.format', () {
    test('adds the taka symbol', () {
      expect(Bdt.format(650), '৳650');
    });

    test('groups thousands', () {
      expect(Bdt.format(12500), '৳12,500');
      expect(Bdt.format(1204), '৳1,204');
    });
  });

  group('AppPalette', () {
    test('light and dark expose the same number of chip colours', () {
      expect(AppPalette.light.chips.length, AppPalette.dark.chips.length);
    });

    test('chipFor wraps around and is stable for a seed', () {
      final palette = AppPalette.dark;
      expect(palette.chipFor(0), palette.chips[0]);
      expect(palette.chipFor(4), palette.chips[0]);
      expect(palette.chipFor(7), palette.chipFor(7));
    });

    test('is registered as a theme extension on both themes', () {
      for (final palette in [AppPalette.light, AppPalette.dark]) {
        final theme = ThemeData(extensions: [palette]);
        expect(theme.extension<AppPalette>(), palette);
      }
    });
  });

  group('WaraqahChatbot', () {
    final chatbot = WaraqahChatbot();

    test('answers greetings with an assistant message', () async {
      final reply = await chatbot.replyTo('Hello there');

      expect(reply.role, ChatRole.assistant);
      expect(reply.text, contains('books'));
    });

    test('answers price prompts with vendor quotes', () async {
      final reply = await chatbot.replyTo('Find a cheap study book under 600');

      expect(reply.recommendedBookId, 'bk-atomic');
      expect(reply.quotes.first.vendor, 'Rokomari');
      expect(reply.quotes.first.isLowest, isTrue);
    });

    test('keeps unknown prompts conversational and app-related', () async {
      final reply = await chatbot.replyTo('Tell me something about this app');

      expect(reply.text, contains('Waraqah'));
      expect(reply.text, contains('this app'));
    });
  });

  group('AssistantIntent', () {
    test('treats Islamic books as a recommendation refinement', () {
      final intent = AssistantIntent.detect('Islamic books', const [
        'Suggest me books',
      ]);

      expect(intent.kind, AssistantIntentKind.islamicRecommendations);
      expect(intent.isIslamic, isTrue);
    });

    test('extracts Islamic price and subject intents', () {
      final budget = AssistantIntent.detect(
        'Islamic books under 500 taka',
        const [],
      );
      final seerah = AssistantIntent.detect('books about Seerah', const []);
      final author = AssistantIntent.detect('books by Ibn Kathir', const []);

      expect(budget.maxPrice, 500);
      expect(budget.isIslamic, isTrue);
      expect(seerah.kind, AssistantIntentKind.seerah);
      expect(author.query, 'Ibn Kathir');
    });
  });

  test(
    'uses conversation context and real catalog results for Islamic requests',
    () async {
      final catalog = _FixtureBookRepository();
      final repository = AssistantRepositoryImpl(Dio(), catalog);
      var history = await repository.openConversation();

      final hello = await repository.ask('hello', history);
      history = [
        ...history,
        ChatMessage(id: 'user-1', role: ChatRole.user, text: 'hello'),
        hello,
      ];
      final general = await repository.ask('suggest me books', history);
      history = [
        ...history,
        ChatMessage(
          id: 'user-2',
          role: ChatRole.user,
          text: 'suggest me books',
        ),
        general,
      ];
      final islamic = await repository.ask('Islamic books', history);
      expect(catalog.lastCategory, 'Islamic Studies');
      expect(catalog.lastQuery, isEmpty);
      final budget = await repository.ask(
        'Islamic books under 500 taka',
        history,
      );
      final seerah = await repository.ask('books about Seerah', history);
      final hadith = await repository.ask('Hadith books', history);
      final author = await repository.ask('books by Ibn Kathir', history);

      expect(islamic.recommendedBookIds, contains('bk-riyad'));
      expect(islamic.recommendedBookIds, isNot(contains('bk-atomic')));
      expect(budget.recommendedBookIds, contains('bk-quran'));
      expect(budget.recommendedBookIds, isNot(contains('bk-fiqh')));
      expect(seerah.recommendedBookIds, ['bk-nectar']);
      expect(hadith.recommendedBookIds, ['bk-riyad']);
      expect(author.recommendedBookIds, ['bk-ibn-kathir']);
    },
  );

  test(
    'sends the complete conversation and Islamic catalog context to Gemini',
    () async {
      final dio = Dio();
      Map<String, dynamic>? requestBody;
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            requestBody = options.data as Map<String, dynamic>;
            handler.resolve(
              Response<Map<String, dynamic>>(
                requestOptions: options,
                data: {
                  'candidates': [
                    {
                      'content': {
                        'parts': [
                          {'text': 'Here are Islamic books from Waraqah.'},
                        ],
                      },
                    },
                  ],
                },
              ),
            );
          },
        ),
      );
      final history = [
        AssistantFixtures.greeting,
        const ChatMessage(id: 'u1', role: ChatRole.user, text: 'hello'),
        const ChatMessage(id: 'a1', role: ChatRole.assistant, text: 'Hello!'),
        const ChatMessage(
          id: 'u2',
          role: ChatRole.user,
          text: 'suggest me books',
        ),
        const ChatMessage(
          id: 'a2',
          role: ChatRole.assistant,
          text: 'Here are some books.',
        ),
        const ChatMessage(id: 'u3', role: ChatRole.user, text: 'Islamic books'),
      ];
      final chatbot = GeminiChatbot(dio);
      await chatbot.replyTo('Islamic books', history, [BookFixtures.all.last]);

      final contents = requestBody!['contents'] as List<dynamic>;
      final contentTexts = [
        for (final content in contents)
          (content as Map)['parts'][0]['text'] as String,
      ];
      final instruction =
          ((requestBody!['systemInstruction'] as Map)['parts']
                  as List<dynamic>)[0]['text']
              as String;

      expect(contentTexts, [
        'Assalamu Alaikum. How can I help you?',
        'hello',
        'Hello!',
        'suggest me books',
        'Here are some books.',
        'Islamic books',
      ]);
      expect(
        contentTexts.where((text) => text == 'Islamic books'),
        hasLength(1),
      );
      expect(instruction, contains('Riyad as-Salihin'));
    },
  );
}

final class _FixtureBookRepository implements BookRepository {
  String? lastCategory;
  String lastQuery = '';

  @override
  Future<List<Book>> fetchNewArrivals() async => BookFixtures.all;

  @override
  Future<List<Book>> searchCatalog({
    String? category,
    String query = '',
  }) async {
    lastCategory = category;
    lastQuery = query;
    final lower = query.toLowerCase();
    final books = BookFixtures.all.where((book) {
      final categoryMatches = category == null || book.category == category;
      final text = [
        book.title,
        book.author,
        ...book.tags,
      ].join(' ').toLowerCase();
      return categoryMatches && (lower.isEmpty || text.contains(lower));
    }).toList();
    books.sort((a, b) => a.priceBdt.compareTo(b.priceBdt));
    return books;
  }

  @override
  Future<Book?> findById(String id) async =>
      BookFixtures.all.where((book) => book.id == id).firstOrNull;
}
