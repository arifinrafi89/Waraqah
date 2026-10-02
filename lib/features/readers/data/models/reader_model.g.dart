// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReaderModel _$ReaderModelFromJson(Map<String, dynamic> json) => _ReaderModel(
  id: json['id'] as String,
  name: json['name'] as String,
  area: json['area'] as String? ?? '',
  district: json['district'] as String? ?? '',
  memberSince: json['memberSince'] == null
      ? null
      : DateTime.parse(json['memberSince'] as String),
  followers: (json['followers'] as num?)?.toInt() ?? 0,
  following: (json['following'] as num?)?.toInt() ?? 0,
  isFollowing: json['isFollowing'] as bool? ?? false,
  isMe: json['isMe'] as bool? ?? false,
  profileVisible: json['profileVisible'] as bool? ?? true,
  biteCount: (json['biteCount'] as num?)?.toInt() ?? 0,
  liveListingCount: (json['liveListingCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ReaderModelToJson(_ReaderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'area': instance.area,
      'district': instance.district,
      'memberSince': instance.memberSince?.toIso8601String(),
      'followers': instance.followers,
      'following': instance.following,
      'isFollowing': instance.isFollowing,
      'isMe': instance.isMe,
      'profileVisible': instance.profileVisible,
      'biteCount': instance.biteCount,
      'liveListingCount': instance.liveListingCount,
    };
