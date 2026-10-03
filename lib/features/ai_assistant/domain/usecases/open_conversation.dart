import '../../../../core/usecase/usecase.dart';
import '../entities/chat_message.dart';
import '../repositories/assistant_repository.dart';

/// The greeting the chat opens with.
class OpenConversation extends UseCase<List<ChatMessage>, NoParams> {
  OpenConversation(this._repository);

  final AssistantRepository _repository;

  @override
  Future<List<ChatMessage>> call(NoParams params) =>
      _repository.openConversation();
}
