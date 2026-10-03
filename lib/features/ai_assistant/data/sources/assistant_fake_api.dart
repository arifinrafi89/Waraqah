import 'package:dio/dio.dart';

import 'assistant_brain.dart';

/// The assistant's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. The Go backend will proxy a model here and
/// give it the catalog, so recommendations stay in Waraqah's own store.
abstract final class AssistantFakeApi {
  /// `?lang=bn`: the opening line.
  static const String greeting = '/assistant/greeting';

  /// Body `{prompt, history: [text], lang}`. Answers `{id, text, bookIds}`.
  static const String ask = '/assistant/ask';

  static final Map<String, Object? Function(RequestOptions)> routes = {
    greeting: (o) =>
        AssistantBrain.greeting('${o.queryParameters['lang'] ?? 'en'}'),
    ask: (o) {
      final body = o.data as Map<String, dynamic>? ?? const {};
      return AssistantBrain.ask(body['prompt'] as String? ?? '', [
        ...?(body['history'] as List?)?.cast<String>(),
      ], body['lang'] as String? ?? 'en');
    },
  };
}
