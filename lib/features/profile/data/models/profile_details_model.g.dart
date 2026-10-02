// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileDetailsModel _$ProfileDetailsModelFromJson(Map<String, dynamic> json) =>
    _ProfileDetailsModel(
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$ProfileDetailsModelToJson(
  _ProfileDetailsModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'photo': instance.photo,
};
