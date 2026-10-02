// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeoDivisionModel _$GeoDivisionModelFromJson(Map<String, dynamic> json) =>
    _GeoDivisionModel(
      name: json['name'] as String,
      nameBn: json['nameBn'] as String,
      districts: (json['districts'] as List<dynamic>)
          .map((e) => GeoDistrictModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GeoDivisionModelToJson(_GeoDivisionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameBn': instance.nameBn,
      'districts': instance.districts,
    };

_GeoDistrictModel _$GeoDistrictModelFromJson(Map<String, dynamic> json) =>
    _GeoDistrictModel(
      name: json['name'] as String,
      nameBn: json['nameBn'] as String,
      upazilas: (json['upazilas'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GeoDistrictModelToJson(_GeoDistrictModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameBn': instance.nameBn,
      'upazilas': instance.upazilas,
    };
