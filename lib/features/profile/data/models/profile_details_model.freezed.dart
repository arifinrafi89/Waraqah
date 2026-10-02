// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDetailsModel {

 String get name; String get phone; String? get photo;
/// Create a copy of ProfileDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDetailsModelCopyWith<ProfileDetailsModel> get copyWith => _$ProfileDetailsModelCopyWithImpl<ProfileDetailsModel>(this as ProfileDetailsModel, _$identity);

  /// Serializes this ProfileDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfileDetailsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDetailsModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.photo, _this.photo) || other.photo == _this.photo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileDetailsModel;
  return Object.hash(runtimeType,_this.name,_this.phone,_this.photo);
}

@override
String toString() {
  final _this = this as ProfileDetailsModel;
  return 'ProfileDetailsModel(name: ${_this.name}, phone: ${_this.phone}, photo: ${_this.photo})';
}


}

/// @nodoc
abstract mixin class $ProfileDetailsModelCopyWith<$Res>  {
  factory $ProfileDetailsModelCopyWith(ProfileDetailsModel value, $Res Function(ProfileDetailsModel) _then) = _$ProfileDetailsModelCopyWithImpl;
@useResult
$Res call({
 String name, String phone, String? photo
});




}
/// @nodoc
class _$ProfileDetailsModelCopyWithImpl<$Res>
    implements $ProfileDetailsModelCopyWith<$Res> {
  _$ProfileDetailsModelCopyWithImpl(this._self, this._then);

  final ProfileDetailsModel _self;
  final $Res Function(ProfileDetailsModel) _then;

/// Create a copy of ProfileDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phone = null,Object? photo = freezed,}) {
  return _then(ProfileDetailsModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileDetailsModel].
extension ProfileDetailsModelPatterns on ProfileDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String phone,  String? photo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDetailsModel() when $default != null:
return $default(_that.name,_that.phone,_that.photo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String phone,  String? photo)  $default,) {final _that = this;
switch (_that) {
case _ProfileDetailsModel():
return $default(_that.name,_that.phone,_that.photo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String phone,  String? photo)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDetailsModel() when $default != null:
return $default(_that.name,_that.phone,_that.photo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDetailsModel implements ProfileDetailsModel {
  const _ProfileDetailsModel({this.name = '', this.phone = '', this.photo});
  factory _ProfileDetailsModel.fromJson(Map<String, dynamic> json) => _$ProfileDetailsModelFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String phone;
@override final  String? photo;

/// Create a copy of ProfileDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDetailsModelCopyWith<_ProfileDetailsModel> get copyWith => __$ProfileDetailsModelCopyWithImpl<_ProfileDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDetailsModel&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.photo, photo) || other.photo == photo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,phone,photo);
}

@override
String toString() {
    return 'ProfileDetailsModel(name: $name, phone: $phone, photo: $photo)';
}


}

/// @nodoc
abstract mixin class _$ProfileDetailsModelCopyWith<$Res> implements $ProfileDetailsModelCopyWith<$Res> {
  factory _$ProfileDetailsModelCopyWith(_ProfileDetailsModel value, $Res Function(_ProfileDetailsModel) _then) = __$ProfileDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String phone, String? photo
});




}
/// @nodoc
class __$ProfileDetailsModelCopyWithImpl<$Res>
    implements _$ProfileDetailsModelCopyWith<$Res> {
  __$ProfileDetailsModelCopyWithImpl(this._self, this._then);

  final _ProfileDetailsModel _self;
  final $Res Function(_ProfileDetailsModel) _then;

/// Create a copy of ProfileDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phone = null,Object? photo = freezed,}) {
  return _then(_ProfileDetailsModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
