import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

enum ChatRole { user, assistant }

/// A single turn in the AI reading-assistant conversation. The assistant may
/// attach recommended book ids from Waraqah's own catalog.
@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required ChatRole role,
    required String text,
    String? recommendedBookId,
    @Default(<String>[]) List<String> recommendedBookIds,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

extension ChatMessageX on ChatMessage {
  bool get isUser => role == ChatRole.user;
  bool get hasRecommendation => recommendedBookId != null;
}
