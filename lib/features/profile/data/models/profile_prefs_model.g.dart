// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_prefs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfilePrefsModel _$ProfilePrefsModelFromJson(Map<String, dynamic> json) =>
    _ProfilePrefsModel(
      muted:
          (json['muted'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      profileVisible: json['profileVisible'] as bool? ?? true,
      activityVisible: json['activityVisible'] as bool? ?? true,
    );

Map<String, dynamic> _$ProfilePrefsModelToJson(_ProfilePrefsModel instance) =>
    <String, dynamic>{
      'muted': instance.muted,
      'profileVisible': instance.profileVisible,
      'activityVisible': instance.activityVisible,
    };
