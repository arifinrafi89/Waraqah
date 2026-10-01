// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpertModel {

 String get id; String get name; String get nameBn; String get credentialEn; String get credentialBn; ExpertKind get kind; bool get verified;
/// Create a copy of ExpertModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpertModelCopyWith<ExpertModel> get copyWith => _$ExpertModelCopyWithImpl<ExpertModel>(this as ExpertModel, _$identity);

  /// Serializes this ExpertModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ExpertModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpertModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn)&&(identical(other.credentialEn, _this.credentialEn) || other.credentialEn == _this.credentialEn)&&(identical(other.credentialBn, _this.credentialBn) || other.credentialBn == _this.credentialBn)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.verified, _this.verified) || other.verified == _this.verified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ExpertModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.nameBn,_this.credentialEn,_this.credentialBn,_this.kind,_this.verified);
}

@override
String toString() {
  final _this = this as ExpertModel;
  return 'ExpertModel(id: ${_this.id}, name: ${_this.name}, nameBn: ${_this.nameBn}, credentialEn: ${_this.credentialEn}, credentialBn: ${_this.credentialBn}, kind: ${_this.kind}, verified: ${_this.verified})';
}


}

/// @nodoc
abstract mixin class $ExpertModelCopyWith<$Res>  {
  factory $ExpertModelCopyWith(ExpertModel value, $Res Function(ExpertModel) _then) = _$ExpertModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String nameBn, String credentialEn, String credentialBn, ExpertKind kind, bool verified
});




}
/// @nodoc
class _$ExpertModelCopyWithImpl<$Res>
    implements $ExpertModelCopyWith<$Res> {
  _$ExpertModelCopyWithImpl(this._self, this._then);

  final ExpertModel _self;
  final $Res Function(ExpertModel) _then;

/// Create a copy of ExpertModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameBn = null,Object? credentialEn = null,Object? credentialBn = null,Object? kind = null,Object? verified = null,}) {
  return _then(ExpertModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,credentialEn: null == credentialEn ? _self.credentialEn : credentialEn // ignore: cast_nullable_to_non_nullable
as String,credentialBn: null == credentialBn ? _self.credentialBn : credentialBn // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ExpertKind,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpertModel].
extension ExpertModelPatterns on ExpertModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpertModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpertModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpertModel value)  $default,){
final _that = this;
switch (_that) {
case _ExpertModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpertModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExpertModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String nameBn,  String credentialEn,  String credentialBn,  ExpertKind kind,  bool verified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpertModel() when $default != null:
return $default(_that.id,_that.name,_that.nameBn,_that.credentialEn,_that.credentialBn,_that.kind,_that.verified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String nameBn,  String credentialEn,  String credentialBn,  ExpertKind kind,  bool verified)  $default,) {final _that = this;
switch (_that) {
case _ExpertModel():
return $default(_that.id,_that.name,_that.nameBn,_that.credentialEn,_that.credentialBn,_that.kind,_that.verified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String nameBn,  String credentialEn,  String credentialBn,  ExpertKind kind,  bool verified)?  $default,) {final _that = this;
switch (_that) {
case _ExpertModel() when $default != null:
return $default(_that.id,_that.name,_that.nameBn,_that.credentialEn,_that.credentialBn,_that.kind,_that.verified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpertModel implements ExpertModel {
  const _ExpertModel({required this.id, required this.name, required this.nameBn, required this.credentialEn, required this.credentialBn, required this.kind, this.verified = false});
  factory _ExpertModel.fromJson(Map<String, dynamic> json) => _$ExpertModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String nameBn;
@override final  String credentialEn;
@override final  String credentialBn;
@override final  ExpertKind kind;
@override@JsonKey() final  bool verified;

/// Create a copy of ExpertModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpertModelCopyWith<_ExpertModel> get copyWith => __$ExpertModelCopyWithImpl<_ExpertModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpertModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpertModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.credentialEn, credentialEn) || other.credentialEn == credentialEn)&&(identical(other.credentialBn, credentialBn) || other.credentialBn == credentialBn)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.verified, verified) || other.verified == verified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,nameBn,credentialEn,credentialBn,kind,verified);
}

@override
String toString() {
    return 'ExpertModel(id: $id, name: $name, nameBn: $nameBn, credentialEn: $credentialEn, credentialBn: $credentialBn, kind: $kind, verified: $verified)';
}


}

/// @nodoc
abstract mixin class _$ExpertModelCopyWith<$Res> implements $ExpertModelCopyWith<$Res> {
  factory _$ExpertModelCopyWith(_ExpertModel value, $Res Function(_ExpertModel) _then) = __$ExpertModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String nameBn, String credentialEn, String credentialBn, ExpertKind kind, bool verified
});




}
/// @nodoc
class __$ExpertModelCopyWithImpl<$Res>
    implements _$ExpertModelCopyWith<$Res> {
  __$ExpertModelCopyWithImpl(this._self, this._then);

  final _ExpertModel _self;
  final $Res Function(_ExpertModel) _then;

/// Create a copy of ExpertModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameBn = null,Object? credentialEn = null,Object? credentialBn = null,Object? kind = null,Object? verified = null,}) {
  return _then(_ExpertModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,credentialEn: null == credentialEn ? _self.credentialEn : credentialEn // ignore: cast_nullable_to_non_nullable
as String,credentialBn: null == credentialBn ? _self.credentialBn : credentialBn // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ExpertKind,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
