// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_thread_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThreadListingModel _$ThreadListingModelFromJson(Map<String, dynamic> json) =>
    _ThreadListingModel(
      id: json['id'] as String,
      title: json['title'] as String,
      priceBdt: (json['priceBdt'] as num).toInt(),
      status: $enumDecode(_$P2pListingStatusEnumMap, json['status']),
      coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
      isNegotiable: json['isNegotiable'] as bool? ?? false,
      handover:
          $enumDecodeNullable(_$HandoverMethodEnumMap, json['handover']) ??
          HandoverMethod.meetInPerson,
    );

Map<String, dynamic> _$ThreadListingModelToJson(_ThreadListingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'priceBdt': instance.priceBdt,
      'status': _$P2pListingStatusEnumMap[instance.status]!,
      'coverSeed': instance.coverSeed,
      'isNegotiable': instance.isNegotiable,
      'handover': _$HandoverMethodEnumMap[instance.handover]!,
    };

const _$P2pListingStatusEnumMap = {
  P2pListingStatus.draft: 'draft',
  P2pListingStatus.inReview: 'inReview',
  P2pListingStatus.changesRequested: 'changesRequested',
  P2pListingStatus.rejected: 'rejected',
  P2pListingStatus.live: 'live',
  P2pListingStatus.reserved: 'reserved',
  P2pListingStatus.sold: 'sold',
};

const _$HandoverMethodEnumMap = {
  HandoverMethod.meetInPerson: 'meetInPerson',
  HandoverMethod.delivery: 'delivery',
};

_InboxThreadModel _$InboxThreadModelFromJson(
  Map<String, dynamic> json,
) => _InboxThreadModel(
  id: json['id'] as String,
  role: $enumDecode(_$ThreadRoleEnumMap, json['role']),
  otherId: json['otherId'] as String,
  otherName: json['otherName'] as String,
  listing: ThreadListingModel.fromJson(json['listing'] as Map<String, dynamic>),
  dealHere: json['dealHere'] as bool? ?? false,
  unread: (json['unread'] as num?)?.toInt() ?? 0,
  messages:
      (json['messages'] as List<dynamic>?)
          ?.map((e) => InboxMessageModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <InboxMessageModel>[],
  myRating: (json['myRating'] as num?)?.toInt(),
  theirRating: (json['theirRating'] as num?)?.toInt(),
);

Map<String, dynamic> _$InboxThreadModelToJson(_InboxThreadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$ThreadRoleEnumMap[instance.role]!,
      'otherId': instance.otherId,
      'otherName': instance.otherName,
      'listing': instance.listing.toJson(),
      'dealHere': instance.dealHere,
      'unread': instance.unread,
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      'myRating': instance.myRating,
      'theirRating': instance.theirRating,
    };

const _$ThreadRoleEnumMap = {
  ThreadRole.buyer: 'buyer',
  ThreadRole.seller: 'seller',
};

_InboxChangeModel _$InboxChangeModelFromJson(Map<String, dynamic> json) =>
    _InboxChangeModel(
      seq: (json['seq'] as num).toInt(),
      threadId: json['threadId'] as String,
      listingId: json['listingId'] as String,
    );

Map<String, dynamic> _$InboxChangeModelToJson(_InboxChangeModel instance) =>
    <String, dynamic>{
      'seq': instance.seq,
      'threadId': instance.threadId,
      'listingId': instance.listingId,
    };
