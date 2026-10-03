// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_P2pListingModel _$P2pListingModelFromJson(Map<String, dynamic> json) =>
    _P2pListingModel(
      id: json['id'] as String,
      title: json['title'] as String,
      sellerId: json['sellerId'] as String,
      sellerName: json['sellerName'] as String,
      priceBdt: (json['priceBdt'] as num).toInt(),
      condition:
          $enumDecodeNullable(_$BookConditionEnumMap, json['condition']) ??
          BookCondition.good,
      flags:
          (json['flags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      photos:
          (json['photos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      isNegotiable: json['isNegotiable'] as bool? ?? false,
      handover:
          $enumDecodeNullable(_$HandoverMethodEnumMap, json['handover']) ??
          HandoverMethod.meetInPerson,
      status:
          $enumDecodeNullable(_$P2pListingStatusEnumMap, json['status']) ??
          P2pListingStatus.live,
      isMine: json['isMine'] as bool? ?? false,
      isMyDeal: json['isMyDeal'] as bool? ?? false,
      rejectionReason: json['rejectionReason'] as String?,
      bookId: json['bookId'] as String?,
      coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
      district: json['district'] as String?,
      area: json['area'] as String?,
      categoryId: json['categoryId'] as String?,
      section: $enumDecodeNullable(_$SectionEnumMap, json['section']),
      newPriceBdt: (json['newPriceBdt'] as num?)?.toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$P2pListingModelToJson(_P2pListingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sellerId': instance.sellerId,
      'sellerName': instance.sellerName,
      'priceBdt': instance.priceBdt,
      'condition': _$BookConditionEnumMap[instance.condition]!,
      'flags': instance.flags,
      'photos': instance.photos,
      'isNegotiable': instance.isNegotiable,
      'handover': _$HandoverMethodEnumMap[instance.handover]!,
      'status': _$P2pListingStatusEnumMap[instance.status]!,
      'isMine': instance.isMine,
      'isMyDeal': instance.isMyDeal,
      'rejectionReason': instance.rejectionReason,
      'bookId': instance.bookId,
      'coverSeed': instance.coverSeed,
      'district': instance.district,
      'area': instance.area,
      'categoryId': instance.categoryId,
      'section': _$SectionEnumMap[instance.section],
      'newPriceBdt': instance.newPriceBdt,
      'note': instance.note,
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
  P2pListingStatus.reserved: 'reserved',
  P2pListingStatus.sold: 'sold',
};

const _$SectionEnumMap = {
  Section.academic: 'academic',
  Section.religious: 'religious',
  Section.literature: 'literature',
  Section.admissionJobPrep: 'admissionJobPrep',
  Section.schoolCollege: 'schoolCollege',
  Section.nonFiction: 'nonFiction',
  Section.skillsTech: 'skillsTech',
  Section.children: 'children',
};
