// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SellerReviewModel _$SellerReviewModelFromJson(Map<String, dynamic> json) =>
    _SellerReviewModel(
      fromName: json['fromName'] as String,
      stars: (json['stars'] as num).toInt(),
      at: DateTime.parse(json['at'] as String),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$SellerReviewModelToJson(_SellerReviewModel instance) =>
    <String, dynamic>{
      'fromName': instance.fromName,
      'stars': instance.stars,
      'at': instance.at.toIso8601String(),
      'comment': instance.comment,
    };

_SellerProfileModel _$SellerProfileModelFromJson(Map<String, dynamic> json) =>
    _SellerProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      area: json['area'] as String,
      district: json['district'] as String,
      memberSince: DateTime.parse(json['memberSince'] as String),
      booksSold: (json['booksSold'] as num?)?.toInt() ?? 0,
      ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
      ratingAverage: (json['ratingAverage'] as num?)?.toDouble(),
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map(
                (e) => SellerReviewModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <SellerReviewModel>[],
      listings:
          (json['listings'] as List<dynamic>?)
              ?.map((e) => P2pListingModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <P2pListingModel>[],
    );

Map<String, dynamic> _$SellerProfileModelToJson(_SellerProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'area': instance.area,
      'district': instance.district,
      'memberSince': instance.memberSince.toIso8601String(),
      'booksSold': instance.booksSold,
      'ratingCount': instance.ratingCount,
      'ratingAverage': instance.ratingAverage,
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
      'listings': instance.listings.map((e) => e.toJson()).toList(),
    };
