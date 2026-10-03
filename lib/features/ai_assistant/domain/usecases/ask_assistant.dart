import '../../../../core/usecase/usecase.dart';
import '../entities/chat_message.dart';
import '../repositories/assistant_repository.dart';

/// One question, with the conversation so far.
typedef AssistantQuestion = ({String prompt, List<ChatMessage> history});

/// Sends the reader's turn; answers the assistant's reply.
class AskAssistant extends UseCase<ChatMessage, AssistantQuestion> {
  AskAssistant(this._repository);

  final AssistantRepository _repository;

  @override
  Future<ChatMessage> call(AssistantQuestion params) =>
      _repository.ask(params.prompt, params.history);
}
