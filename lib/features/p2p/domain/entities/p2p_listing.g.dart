// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_P2pListing _$P2pListingFromJson(Map<String, dynamic> json) => _P2pListing(
  id: json['id'] as String,
  title: json['title'] as String,
  sellerName: json['sellerName'] as String,
  sellerBatch: json['sellerBatch'] as String,
  priceBdt: (json['priceBdt'] as num).toInt(),
  condition:
      $enumDecodeNullable(_$BookConditionEnumMap, json['condition']) ??
      BookCondition.good,
  flags:
      (json['flags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  photos:
      (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  isNegotiable: json['isNegotiable'] as bool? ?? false,
  handover:
      $enumDecodeNullable(_$HandoverMethodEnumMap, json['handover']) ??
      HandoverMethod.meetInPerson,
  status:
      $enumDecodeNullable(_$P2pListingStatusEnumMap, json['status']) ??
      P2pListingStatus.live,
  rejectionReason: json['rejectionReason'] as String?,
  bookId: json['bookId'] as String?,
  coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
  district: json['district'] as String?,
  area: json['area'] as String?,
  category: json['category'] as String?,
  newPriceBdt: (json['newPriceBdt'] as num?)?.toInt(),
);

Map<String, dynamic> _$P2pListingToJson(_P2pListing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sellerName': instance.sellerName,
      'sellerBatch': instance.sellerBatch,
      'priceBdt': instance.priceBdt,
      'condition': _$BookConditionEnumMap[instance.condition]!,
      'flags': instance.flags,
      'photos': instance.photos,
      'isNegotiable': instance.isNegotiable,
      'handover': _$HandoverMethodEnumMap[instance.handover]!,
      'status': _$P2pListingStatusEnumMap[instance.status]!,
      'rejectionReason': instance.rejectionReason,
      'bookId': instance.bookId,
      'coverSeed': instance.coverSeed,
      'district': instance.district,
      'area': instance.area,
      'category': instance.category,
      'newPriceBdt': instance.newPriceBdt,
    };

const _$BookConditionEnumMap = {
  BookCondition.likeNew: 'likeNew',
  BookCondition.veryGood: 'veryGood',
  BookCondition.good: 'good',
  BookCondition.acceptable: 'acceptable',
};

const _$HandoverMethodEnumMap = {
  HandoverMethod.meetInPerson: 'meetInPerson',
  HandoverMethod.delivery: 'delivery',
};

const _$P2pListingStatusEnumMap = {
  P2pListingStatus.draft: 'draft',
  P2pListingStatus.inReview: 'inReview',
  P2pListingStatus.changesRequested: 'changesRequested',
  P2pListingStatus.rejected: 'rejected',
  P2pListingStatus.live: 'live',
  P2pListingStatus.sold: 'sold',
};
