// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VendorQuote _$VendorQuoteFromJson(Map<String, dynamic> json) => _VendorQuote(
  vendor: json['vendor'] as String,
  priceBdt: (json['priceBdt'] as num).toInt(),
  isLowest: json['isLowest'] as bool? ?? false,
);

Map<String, dynamic> _$VendorQuoteToJson(_VendorQuote instance) =>
    <String, dynamic>{
      'vendor': instance.vendor,
      'priceBdt': instance.priceBdt,
      'isLowest': instance.isLowest,
    };

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  id: json['id'] as String,
  role: $enumDecode(_$ChatRoleEnumMap, json['role']),
  text: json['text'] as String,
  recommendedBookId: json['recommendedBookId'] as String?,
  quotes:
      (json['quotes'] as List<dynamic>?)
          ?.map((e) => VendorQuote.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <VendorQuote>[],
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$ChatRoleEnumMap[instance.role]!,
      'text': instance.text,
      'recommendedBookId': instance.recommendedBookId,
      'quotes': instance.quotes,
    };

const _$ChatRoleEnumMap = {
  ChatRole.user: 'user',
  ChatRole.assistant: 'assistant',
};
