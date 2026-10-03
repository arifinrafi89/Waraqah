import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/chat_message.dart';

part 'assistant_reply_model.freezed.dart';
part 'assistant_reply_model.g.dart';

/// JSON shape of an assistant turn: its words and the catalog Books it
/// recommends, by id.
@freezed
abstract class AssistantReplyModel with _$AssistantReplyModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory AssistantReplyModel({
    required String id,
    required String text,
    @Default(<String>[]) List<String> bookIds,
    AssistantBasketModel? basket,
  }) = _AssistantReplyModel;

  factory AssistantReplyModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantReplyModelFromJson(json);
}

@freezed
abstract class AssistantBasketModel with _$AssistantBasketModel {
  const factory AssistantBasketModel({
    required List<String> editionIds,
    required int totalBdt,
  }) = _AssistantBasketModel;

  factory AssistantBasketModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantBasketModelFromJson(json);
}

extension AssistantReplyModelX on AssistantReplyModel {
  ChatMessage toEntity() => ChatMessage(
    id: id,
    role: ChatRole.assistant,
    text: text,
    recommendedBookIds: bookIds,
    basket: switch (basket) {
      final b? => (editionIds: b.editionIds, totalBdt: b.totalBdt),
      null => null,
    },
  );
}
