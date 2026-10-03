import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/chat_message.dart';

part 'assistant_reply_model.freezed.dart';
part 'assistant_reply_model.g.dart';

/// JSON shape of an assistant turn: its words and the catalog Books it
/// recommends, by id.
@freezed
abstract class AssistantReplyModel with _$AssistantReplyModel {
  const factory AssistantReplyModel({
    required String id,
    required String text,
    @Default(<String>[]) List<String> bookIds,
  }) = _AssistantReplyModel;

  factory AssistantReplyModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantReplyModelFromJson(json);
}

extension AssistantReplyModelX on AssistantReplyModel {
  ChatMessage toEntity() => ChatMessage(
    id: id,
    role: ChatRole.assistant,
    text: text,
    recommendedBookIds: bookIds,
  );
}
