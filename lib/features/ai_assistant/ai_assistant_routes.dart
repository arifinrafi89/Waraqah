import 'package:go_router/go_router.dart';

import 'presentation/pages/ai_chat_page.dart';

abstract final class AiAssistantRoutes {
  static const String aiChat = '/ai-chat';

  static final List<RouteBase> routes = [
    GoRoute(path: aiChat, builder: (_, _) => const AiChatPage()),
  ];
}
