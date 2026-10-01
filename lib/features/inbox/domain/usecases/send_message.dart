import '../../../../core/usecase/usecase.dart';
import '../entities/inbox_thread.dart';
import '../entities/offer_rules.dart';
import '../repositories/inbox_repository.dart';

class SendMessageParams {
  const SendMessageParams({required this.threadId, required this.text});

  final String threadId;
  final String text;
}

/// Sends a chat message, trimmed; refuses an empty or over-long one.
class SendMessage extends UseCase<InboxThread, SendMessageParams> {
  SendMessage(this._repository);

  final InboxRepository _repository;

  @override
  Future<InboxThread> call(SendMessageParams params) {
    final text = params.text.trim();
    if (text.isEmpty || text.length > OfferRules.maxMessageLength) {
      throw ArgumentError.value(params.text, 'text');
    }
    return _repository.send(params.threadId, text);
  }
}
