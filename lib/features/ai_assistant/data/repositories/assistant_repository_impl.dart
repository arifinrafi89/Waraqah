import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../../../catalog/domain/repositories/book_repository.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/assistant_repository.dart';
import '../models/assistant_reply_model.dart';
import '../sources/assistant_remote_source.dart';
import '../sources/gemini_chatbot.dart';

/// Answers come from the `/assistant` API, which picks Books from
/// Waraqah's catalog. Built with a Gemini key, Gemini words the answer
/// around those same Books; if it fails, the API's own words stand.
class AssistantRepositoryImpl implements AssistantRepository {
  /// [_lang] says which language to answer in (`en` or `bn`).
  AssistantRepositoryImpl(this._source, this._books, this._gemini, this._lang);

  final AssistantRemoteSource _source;
  final BookRepository _books;
  final GeminiChatbot _gemini;
  final String Function() _lang;

  @override
  Future<List<ChatMessage>> openConversation() async => [
    (await _source.greeting(_lang())).toEntity(),
  ];

  @override
  Future<ChatMessage> ask(String prompt, List<ChatMessage> history) async {
    final reply = (await _source.ask(prompt, history, _lang())).toEntity();
    if (!_gemini.isConfigured) return reply;
    try {
      final books = [
        for (final id in reply.recommendedBookIds) ?await _books.findById(id),
      ];
      return reply.copyWith(
        text: await _gemini.replyTo(prompt, history, books.cast<Book>()),
      );
    } on FormatException {
      return reply;
    } on DioException {
      return reply;
    }
  }
}
