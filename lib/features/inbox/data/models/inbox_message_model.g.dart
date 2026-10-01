// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => _OfferModel(
  id: json['id'] as String,
  amountBdt: (json['amountBdt'] as num).toInt(),
  handover: $enumDecode(_$OfferHandoverEnumMap, json['handover']),
  status:
      $enumDecodeNullable(_$OfferStatusEnumMap, json['status']) ??
      OfferStatus.pending,
);

Map<String, dynamic> _$OfferModelToJson(_OfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amountBdt': instance.amountBdt,
      'handover': _$OfferHandoverEnumMap[instance.handover]!,
      'status': _$OfferStatusEnumMap[instance.status]!,
    };

const _$OfferHandoverEnumMap = {
  OfferHandover.meetup: 'meetup',
  OfferHandover.courier: 'courier',
};

const _$OfferStatusEnumMap = {
  OfferStatus.pending: 'pending',
  OfferStatus.accepted: 'accepted',
  OfferStatus.declined: 'declined',
  OfferStatus.closed: 'closed',
};

_InboxMessageModel _$InboxMessageModelFromJson(Map<String, dynamic> json) =>
    _InboxMessageModel(
      id: json['id'] as String,
      from: $enumDecode(_$MessageFromEnumMap, json['from']),
      at: DateTime.parse(json['at'] as String),
      text: json['text'] as String?,
      offer: json['offer'] == null
          ? null
          : OfferModel.fromJson(json['offer'] as Map<String, dynamic>),
      event: $enumDecodeNullable(_$ThreadEventEnumMap, json['event']),
      amountBdt: (json['amountBdt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InboxMessageModelToJson(_InboxMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': _$MessageFromEnumMap[instance.from]!,
      'at': instance.at.toIso8601String(),
      'text': ?instance.text,
      'offer': ?instance.offer?.toJson(),
      'event': ?_$ThreadEventEnumMap[instance.event],
      'amountBdt': ?instance.amountBdt,
    };

const _$MessageFromEnumMap = {
  MessageFrom.me: 'me',
  MessageFrom.them: 'them',
  MessageFrom.system: 'system',
};

const _$ThreadEventEnumMap = {
  ThreadEvent.offerAccepted: 'offerAccepted',
  ThreadEvent.offerDeclined: 'offerDeclined',
  ThreadEvent.reservedElsewhere: 'reservedElsewhere',
  ThreadEvent.madeAvailable: 'madeAvailable',
  ThreadEvent.sold: 'sold',
  ThreadEvent.soldElsewhere: 'soldElsewhere',
};
