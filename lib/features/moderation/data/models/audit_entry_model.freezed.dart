// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditEntryModel {

 String get id; DateTime get at; String get by; AuditAction get action; String get subject; String? get reason;
/// Create a copy of AuditEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditEntryModelCopyWith<AuditEntryModel> get copyWith => _$AuditEntryModelCopyWithImpl<AuditEntryModel>(this as AuditEntryModel, _$identity);

  /// Serializes this AuditEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuditEntryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditEntryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.by, _this.by) || other.by == _this.by)&&(identical(other.action, _this.action) || other.action == _this.action)&&(identical(other.subject, _this.subject) || other.subject == _this.subject)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuditEntryModel;
  return Object.hash(runtimeType,_this.id,_this.at,_this.by,_this.action,_this.subject,_this.reason);
}

@override
String toString() {
  final _this = this as AuditEntryModel;
  return 'AuditEntryModel(id: ${_this.id}, at: ${_this.at}, by: ${_this.by}, action: ${_this.action}, subject: ${_this.subject}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $AuditEntryModelCopyWith<$Res>  {
  factory $AuditEntryModelCopyWith(AuditEntryModel value, $Res Function(AuditEntryModel) _then) = _$AuditEntryModelCopyWithImpl;
@useResult
$Res call({
 String id, DateTime at, String by, AuditAction action, String subject, String? reason
});




}
/// @nodoc
class _$AuditEntryModelCopyWithImpl<$Res>
    implements $AuditEntryModelCopyWith<$Res> {
  _$AuditEntryModelCopyWithImpl(this._self, this._then);

  final AuditEntryModel _self;
  final $Res Function(AuditEntryModel) _then;

/// Create a copy of AuditEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? at = null,Object? by = null,Object? action = null,Object? subject = null,Object? reason = freezed,}) {
  return _then(AuditEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,by: null == by ? _self.by : by // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AuditAction,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditEntryModel].
extension AuditEntryModelPatterns on AuditEntryModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditEntryModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _AuditEntryModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuditEntryModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime at,  String by,  AuditAction action,  String subject,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditEntryModel() when $default != null:
return $default(_that.id,_that.at,_that.by,_that.action,_that.subject,_that.reason);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime at,  String by,  AuditAction action,  String subject,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _AuditEntryModel():
return $default(_that.id,_that.at,_that.by,_that.action,_that.subject,_that.reason);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime at,  String by,  AuditAction action,  String subject,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _AuditEntryModel() when $default != null:
return $default(_that.id,_that.at,_that.by,_that.action,_that.subject,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditEntryModel implements AuditEntryModel {
  const _AuditEntryModel({required this.id, required this.at, required this.by, required this.action, required this.subject, this.reason});
  factory _AuditEntryModel.fromJson(Map<String, dynamic> json) => _$AuditEntryModelFromJson(json);

@override final  String id;
@override final  DateTime at;
@override final  String by;
@override final  AuditAction action;
@override final  String subject;
@override final  String? reason;

/// Create a copy of AuditEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditEntryModelCopyWith<_AuditEntryModel> get copyWith => __$AuditEntryModelCopyWithImpl<_AuditEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.at, at) || other.at == at)&&(identical(other.by, by) || other.by == by)&&(identical(other.action, action) || other.action == action)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,at,by,action,subject,reason);
}

@override
String toString() {
    return 'AuditEntryModel(id: $id, at: $at, by: $by, action: $action, subject: $subject, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$AuditEntryModelCopyWith<$Res> implements $AuditEntryModelCopyWith<$Res> {
  factory _$AuditEntryModelCopyWith(_AuditEntryModel value, $Res Function(_AuditEntryModel) _then) = __$AuditEntryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime at, String by, AuditAction action, String subject, String? reason
});




}
/// @nodoc
class __$AuditEntryModelCopyWithImpl<$Res>
    implements _$AuditEntryModelCopyWith<$Res> {
  __$AuditEntryModelCopyWithImpl(this._self, this._then);

  final _AuditEntryModel _self;
  final $Res Function(_AuditEntryModel) _then;

/// Create a copy of AuditEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? at = null,Object? by = null,Object? action = null,Object? subject = null,Object? reason = freezed,}) {
  return _then(_AuditEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,by: null == by ? _self.by : by // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AuditAction,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
