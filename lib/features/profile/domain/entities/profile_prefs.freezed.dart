// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_prefs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfilePrefs {

 Set<NotificationGroup> get muted;/// Whether other readers can open the Reader's page.
 bool get profileVisible;/// Whether shelves and reading progress show to others.
 bool get activityVisible;
/// Create a copy of ProfilePrefs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfilePrefsCopyWith<ProfilePrefs> get copyWith => _$ProfilePrefsCopyWithImpl<ProfilePrefs>(this as ProfilePrefs, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfilePrefs;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfilePrefs&&const DeepCollectionEquality().equals(other.muted, _this.muted)&&(identical(other.profileVisible, _this.profileVisible) || other.profileVisible == _this.profileVisible)&&(identical(other.activityVisible, _this.activityVisible) || other.activityVisible == _this.activityVisible));
}


@override
int get hashCode {
  final _this = this as ProfilePrefs;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.muted),_this.profileVisible,_this.activityVisible);
}

@override
String toString() {
  final _this = this as ProfilePrefs;
  return 'ProfilePrefs(muted: ${_this.muted}, profileVisible: ${_this.profileVisible}, activityVisible: ${_this.activityVisible})';
}


}

/// @nodoc
abstract mixin class $ProfilePrefsCopyWith<$Res>  {
  factory $ProfilePrefsCopyWith(ProfilePrefs value, $Res Function(ProfilePrefs) _then) = _$ProfilePrefsCopyWithImpl;
@useResult
$Res call({
 Set<NotificationGroup> muted, bool profileVisible, bool activityVisible
});




}
/// @nodoc
class _$ProfilePrefsCopyWithImpl<$Res>
    implements $ProfilePrefsCopyWith<$Res> {
  _$ProfilePrefsCopyWithImpl(this._self, this._then);

  final ProfilePrefs _self;
  final $Res Function(ProfilePrefs) _then;

/// Create a copy of ProfilePrefs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? muted = null,Object? profileVisible = null,Object? activityVisible = null,}) {
  return _then(ProfilePrefs(
muted: null == muted ? _self.muted : muted // ignore: cast_nullable_to_non_nullable
as Set<NotificationGroup>,profileVisible: null == profileVisible ? _self.profileVisible : profileVisible // ignore: cast_nullable_to_non_nullable
as bool,activityVisible: null == activityVisible ? _self.activityVisible : activityVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfilePrefs].
extension ProfilePrefsPatterns on ProfilePrefs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfilePrefs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfilePrefs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfilePrefs value)  $default,){
final _that = this;
switch (_that) {
case _ProfilePrefs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfilePrefs value)?  $default,){
final _that = this;
switch (_that) {
case _ProfilePrefs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<NotificationGroup> muted,  bool profileVisible,  bool activityVisible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfilePrefs() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<NotificationGroup> muted,  bool profileVisible,  bool activityVisible)  $default,) {final _that = this;
switch (_that) {
case _ProfilePrefs():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<NotificationGroup> muted,  bool profileVisible,  bool activityVisible)?  $default,) {final _that = this;
switch (_that) {
case _ProfilePrefs() when $default != null:
return $default(_that.muted,_that.profileVisible,_that.activityVisible);case _:
  return null;

}
}

}

/// @nodoc


class _ProfilePrefs implements ProfilePrefs {
  const _ProfilePrefs({ Set<NotificationGroup> muted = const <NotificationGroup>{}, this.profileVisible = true, this.activityVisible = true}): _muted = muted;
  

 final  Set<NotificationGroup> _muted;
@override@JsonKey() Set<NotificationGroup> get muted {
  if (_muted is EqualUnmodifiableSetView) return _muted;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_muted);
}

/// Whether other readers can open the Reader's page.
@override@JsonKey() final  bool profileVisible;
/// Whether shelves and reading progress show to others.
@override@JsonKey() final  bool activityVisible;

/// Create a copy of ProfilePrefs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfilePrefsCopyWith<_ProfilePrefs> get copyWith => __$ProfilePrefsCopyWithImpl<_ProfilePrefs>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfilePrefs&&const DeepCollectionEquality().equals(other.muted, _muted)&&(identical(other.profileVisible, profileVisible) || other.profileVisible == profileVisible)&&(identical(other.activityVisible, activityVisible) || other.activityVisible == activityVisible));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_muted),profileVisible,activityVisible);
}

@override
String toString() {
    return 'ProfilePrefs(muted: $muted, profileVisible: $profileVisible, activityVisible: $activityVisible)';
}


}

/// @nodoc
abstract mixin class _$ProfilePrefsCopyWith<$Res> implements $ProfilePrefsCopyWith<$Res> {
  factory _$ProfilePrefsCopyWith(_ProfilePrefs value, $Res Function(_ProfilePrefs) _then) = __$ProfilePrefsCopyWithImpl;
@override @useResult
$Res call({
 Set<NotificationGroup> muted, bool profileVisible, bool activityVisible
});




}
/// @nodoc
class __$ProfilePrefsCopyWithImpl<$Res>
    implements _$ProfilePrefsCopyWith<$Res> {
  __$ProfilePrefsCopyWithImpl(this._self, this._then);

  final _ProfilePrefs _self;
  final $Res Function(_ProfilePrefs) _then;

/// Create a copy of ProfilePrefs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? muted = null,Object? profileVisible = null,Object? activityVisible = null,}) {
  return _then(_ProfilePrefs(
muted: null == muted ? _self._muted : muted // ignore: cast_nullable_to_non_nullable
as Set<NotificationGroup>,profileVisible: null == profileVisible ? _self.profileVisible : profileVisible // ignore: cast_nullable_to_non_nullable
as bool,activityVisible: null == activityVisible ? _self.activityVisible : activityVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
