import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/chat_message.dart';

final class GeminiChatbot {
  GeminiChatbot(this._dio);

  static const _apiKey = String.fromEnvironment('GEMINI_API_KEY');
  static const _model = 'gemini-3.8-flash';
  static const _endpoint =
      'https://generativelanguage.googleapis.com/v1beta/models/$_model:generateContent';

  final Dio _dio;

  bool get isConfigured => _apiKey.isNotEmpty;

  Future<ChatMessage> replyTo(
    String prompt,
    List<ChatMessage> history,
    List<Book> books,
  ) async {
    final conversation = history.isEmpty
        ? [
            ChatMessage(
              id: 'user-${DateTime.now().microsecondsSinceEpoch}',
              role: ChatRole.user,
              text: prompt,
            ),
          ]
        : history;
    final contents = [
      for (final message in conversation)
        {
          'role': message.role == ChatRole.user ? 'user' : 'model',
          'parts': [
            {'text': message.text},
          ],
        },
    ];
    final catalogContext = books.isEmpty
        ? 'No matching books were found in the Waraqah catalog.'
        : books
              .map(
                (book) =>
                    '${book.id}: ${book.title} by ${book.author}; '
                    '${book.priceBdt} BDT; rating ${book.rating}; '
                    'category ${book.category ?? 'Uncategorized'}',
              )
              .join('\n');

    final response = await _dio.post<Map<String, dynamic>>(
      _endpoint,
      queryParameters: {'key': _apiKey},
      data: {
        'systemInstruction': {
          'parts': [
            {
              'text':
                  'You are Waraqah AI, the reading assistant inside the Waraqah '
                  'app. This is the Reading Assistant for Waraqah, an Islamic '
                  'book discovery and review app. Maintain conversation context '
                  'and treat later user messages as refinements of earlier '
                  'requests when appropriate. If the user explicitly requests '
                  'Islamic books, recommend Islamic books. Do not ask the user '
                  'to repeat information that is already clear. Use only the '
                  'application book-search results supplied below for actual '
                  'book results. Never fabricate books, prices, ratings, authors, '
                  'or availability. Answer only questions about Waraqah, its book catalog, '
                  'book recommendations, vendors, prices, study resources, '
                  'peer-to-peer listings, profile, and app navigation. If a '
                  'question is outside the app, politely say you can only help '
                  'with Waraqah. Do not invent catalog data, prices, or features. '
                  'Keep replies concise and helpful.\n\n'
                  'Available Waraqah catalog results:\n$catalogContext',
            },
          ],
        },
        'contents': contents,
        'generationConfig': {'temperature': 0.4, 'maxOutputTokens': 300},
      },
    );

    final text = _extractText(response.data);
    if (text == null || text.isEmpty) {
      throw const FormatException('Gemini returned no text.');
    }

    return ChatMessage(
      id: 'ai-${DateTime.now().microsecondsSinceEpoch}',
      role: ChatRole.assistant,
      text: text,
      recommendedBookIds: [for (final book in books) book.id],
    );
  }

  String? _extractText(Map<String, dynamic>? data) {
    final candidates = data?['candidates'];
    if (candidates is! List || candidates.isEmpty) return null;

    final content = candidates.first['content'];
    if (content is! Map) return null;
    final parts = content['parts'];
    if (parts is! List) return null;

    final text = parts
        .whereType<Map>()
        .map((part) => part['text'])
        .whereType<String>()
        .join();
    return text.trim();
  }
}
