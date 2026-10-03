import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';

enum ChatRole { user, assistant }

/// A single turn in the AI reading-assistant conversation. The assistant
/// may attach Books from Waraqah's own catalog.
@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required ChatRole role,
    required String text,
    @Default(<String>[]) List<String> recommendedBookIds,

    /// A set of Editions that fits the reader's budget, ready for the cart.
    AssistantBasket? basket,
  }) = _ChatMessage;
}

/// Editions the assistant put together, and what they cost in all.
typedef AssistantBasket = ({List<String> editionIds, int totalBdt});

extension ChatMessageX on ChatMessage {
  bool get isUser => role == ChatRole.user;
}
