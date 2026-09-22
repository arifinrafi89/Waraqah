import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

enum ChatRole { user, assistant }

/// One vendor row inside an assistant price-comparison answer.
@freezed
abstract class VendorQuote with _$VendorQuote {
  const factory VendorQuote({
    required String vendor,
    required int priceBdt,
    @Default(false) bool isLowest,
  }) = _VendorQuote;

  factory VendorQuote.fromJson(Map<String, dynamic> json) =>
      _$VendorQuoteFromJson(json);
}

/// A single turn in the AI reading-assistant conversation. The assistant may
/// attach a recommended book id plus the vendor quotes it compared.
@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required ChatRole role,
    required String text,
    String? recommendedBookId,
    @Default(<VendorQuote>[]) List<VendorQuote> quotes,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

extension ChatMessageX on ChatMessage {
  bool get isUser => role == ChatRole.user;
  bool get hasRecommendation => recommendedBookId != null;
}
