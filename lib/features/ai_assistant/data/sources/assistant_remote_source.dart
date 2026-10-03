import 'package:dio/dio.dart';

import '../../domain/entities/chat_message.dart';
import '../models/assistant_reply_model.dart';
import 'assistant_fake_api.dart';

/// Talks to the `/assistant` endpoints, answered for now by the fake API.
class AssistantRemoteSource {
  AssistantRemoteSource(this._dio);

  final Dio _dio;

  Future<AssistantReplyModel> greeting(String lang) async => _reply(
    await _dio.get<Map<String, dynamic>>(
      AssistantFakeApi.greeting,
      queryParameters: {'lang': lang},
    ),
  );

  Future<AssistantReplyModel> ask(
    String prompt,
    List<ChatMessage> history,
    String lang,
  ) async => _reply(
    await _dio.post<Map<String, dynamic>>(
      AssistantFakeApi.ask,
      data: {
        'prompt': prompt,
        'history': [for (final m in history) m.text],
        'lang': lang,
      },
    ),
  );

  AssistantReplyModel _reply(Response<Map<String, dynamic>> response) =>
      AssistantReplyModel.fromJson(response.data!);
}
