// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_prefs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfilePrefsModel {

 List<String> get muted; bool get profileVisible; bool get activityVisible;
/// Create a copy of ProfilePrefsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfilePrefsModelCopyWith<ProfilePrefsModel> get copyWith => _$ProfilePrefsModelCopyWithImpl<ProfilePrefsModel>(this as ProfilePrefsModel, _$identity);

  /// Serializes this ProfilePrefsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfilePrefsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfilePrefsModel&&const DeepCollectionEquality().equals(other.muted, _this.muted)&&(identical(other.profileVisible, _this.profileVisible) || other.profileVisible == _this.profileVisible)&&(identical(other.activityVisible, _this.activityVisible) || other.activityVisible == _this.activityVisible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfilePrefsModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.muted),_this.profileVisible,_this.activityVisible);
}

@override
String toString() {
  final _this = this as ProfilePrefsModel;
  return 'ProfilePrefsModel(muted: ${_this.muted}, profileVisible: ${_this.profileVisible}, activityVisible: ${_this.activityVisible})';
}


}

/// @nodoc
abstract mixin class $ProfilePrefsModelCopyWith<$Res>  {
  factory $ProfilePrefsModelCopyWith(ProfilePrefsModel value, $Res Function(ProfilePrefsModel) _then) = _$ProfilePrefsModelCopyWithImpl;
@useResult
$Res call({
 List<String> muted, bool profileVisible, bool activityVisible
});




}
/// @nodoc
class _$ProfilePrefsModelCopyWithImpl<$Res>
    implements $ProfilePrefsModelCopyWith<$Res> {
  _$ProfilePrefsModelCopyWithImpl(this._self, this._then);

  final ProfilePrefsModel _self;
  final $Res Function(ProfilePrefsModel) _then;

/// Create a copy of ProfilePrefsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? muted = null,Object? profileVisible = null,Object? activityVisible = null,}) {
  return _then(ProfilePrefsModel(
muted: null == muted ? _self.muted : muted // ignore: cast_nullable_to_non_nullable
as List<String>,profileVisible: null == profileVisible ? _self.profileVisible : profileVisible // ignore: cast_nullable_to_non_nullable
as bool,activityVisible: null == activityVisible ? _self.activityVisible : activityVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfilePrefsModel].
extension ProfilePrefsModelPatterns on ProfilePrefsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfilePrefsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfilePrefsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfilePrefsModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfilePrefsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfilePrefsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfilePrefsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> muted,  bool profileVisible,  bool activityVisible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfilePrefsModel() when $default != null:
return $default(_that.muted,_that.profileVisible,_that.activityVisible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> muted,  bool profileVisible,  bool activityVisible)  $default,) {final _that = this;
switch (_that) {
case _ProfilePrefsModel():
return $default(_that.muted,_that.profileVisible,_that.activityVisible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> muted,  bool profileVisible,  bool activityVisible)?  $default,) {final _that = this;
switch (_that) {
case _ProfilePrefsModel() when $default != null:
return $default(_that.muted,_that.profileVisible,_that.activityVisible);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfilePrefsModel implements ProfilePrefsModel {
  const _ProfilePrefsModel({ List<String> muted = const <String>[], this.profileVisible = true, this.activityVisible = true}): _muted = muted;
  factory _ProfilePrefsModel.fromJson(Map<String, dynamic> json) => _$ProfilePrefsModelFromJson(json);

 final  List<String> _muted;
@override@JsonKey() List<String> get muted {
  if (_muted is EqualUnmodifiableListView) return _muted;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_muted);
}

@override@JsonKey() final  bool profileVisible;
@override@JsonKey() final  bool activityVisible;

/// Create a copy of ProfilePrefsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfilePrefsModelCopyWith<_ProfilePrefsModel> get copyWith => __$ProfilePrefsModelCopyWithImpl<_ProfilePrefsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfilePrefsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfilePrefsModel&&const DeepCollectionEquality().equals(other.muted, _muted)&&(identical(other.profileVisible, profileVisible) || other.profileVisible == profileVisible)&&(identical(other.activityVisible, activityVisible) || other.activityVisible == activityVisible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_muted),profileVisible,activityVisible);
}

@override
String toString() {
    return 'ProfilePrefsModel(muted: $muted, profileVisible: $profileVisible, activityVisible: $activityVisible)';
}


}

/// @nodoc
abstract mixin class _$ProfilePrefsModelCopyWith<$Res> implements $ProfilePrefsModelCopyWith<$Res> {
  factory _$ProfilePrefsModelCopyWith(_ProfilePrefsModel value, $Res Function(_ProfilePrefsModel) _then) = __$ProfilePrefsModelCopyWithImpl;
@override @useResult
$Res call({
 List<String> muted, bool profileVisible, bool activityVisible
});




}
/// @nodoc
class __$ProfilePrefsModelCopyWithImpl<$Res>
    implements _$ProfilePrefsModelCopyWith<$Res> {
  __$ProfilePrefsModelCopyWithImpl(this._self, this._then);

  final _ProfilePrefsModel _self;
  final $Res Function(_ProfilePrefsModel) _then;

/// Create a copy of ProfilePrefsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? muted = null,Object? profileVisible = null,Object? activityVisible = null,}) {
  return _then(_ProfilePrefsModel(
muted: null == muted ? _self._muted : muted // ignore: cast_nullable_to_non_nullable
as List<String>,profileVisible: null == profileVisible ? _self.profileVisible : profileVisible // ignore: cast_nullable_to_non_nullable
as bool,activityVisible: null == activityVisible ? _self.activityVisible : activityVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
