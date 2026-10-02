// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedAddressModel _$SavedAddressModelFromJson(Map<String, dynamic> json) =>
    _SavedAddressModel(
      id: json['id'] as String? ?? '',
      label: json['label'] as String,
      recipient: json['recipient'] as String,
      phone: json['phone'] as String,
      line: json['line'] as String,
      upazila: json['upazila'] as String,
      district: json['district'] as String,
      division: json['division'] as String,
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$SavedAddressModelToJson(_SavedAddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'recipient': instance.recipient,
      'phone': instance.phone,
      'line': instance.line,
      'upazila': instance.upazila,
      'district': instance.district,
      'division': instance.division,
      'isDefault': instance.isDefault,
    };
