import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/assistant_repository.dart';
import '../sources/assistant_fixtures.dart';

/// Scripted stand-in for `POST /ai/chat`. The signature already matches what
/// the Go proxy will return, so only this class changes when it goes live.
class AssistantRepositoryImpl implements AssistantRepository {
  @override
  Future<List<ChatMessage>> openConversation() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const [
      AssistantFixtures.greeting,
      AssistantFixtures.sampleUserTurn,
      AssistantFixtures.priceComparison,
    ];
  }

  @override
  Future<ChatMessage> ask(String prompt) async {
    await Future<void>.delayed(const Duration(milliseconds: 1100));
    return AssistantFixtures.replyTo(prompt);
  }
}
