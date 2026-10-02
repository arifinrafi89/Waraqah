// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppNotification {

 String get id; NotificationKind get kind; DateTime get createdAt; bool get read; Map<String, String> get params; NotificationTarget? get target;
/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationCopyWith<AppNotification> get copyWith => _$AppNotificationCopyWithImpl<AppNotification>(this as AppNotification, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AppNotification;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotification&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.read, _this.read) || other.read == _this.read)&&const DeepCollectionEquality().equals(other.params, _this.params)&&(identical(other.target, _this.target) || other.target == _this.target));
}


@override
int get hashCode {
  final _this = this as AppNotification;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.createdAt,_this.read,const DeepCollectionEquality().hash(_this.params),_this.target);
}

@override
String toString() {
  final _this = this as AppNotification;
  return 'AppNotification(id: ${_this.id}, kind: ${_this.kind}, createdAt: ${_this.createdAt}, read: ${_this.read}, params: ${_this.params}, target: ${_this.target})';
}


}

/// @nodoc
abstract mixin class $AppNotificationCopyWith<$Res>  {
  factory $AppNotificationCopyWith(AppNotification value, $Res Function(AppNotification) _then) = _$AppNotificationCopyWithImpl;
@useResult
$Res call({
 String id, NotificationKind kind, DateTime createdAt, bool read, Map<String, String> params, NotificationTarget? target
});


$NotificationTargetCopyWith<$Res>? get target;

}
/// @nodoc
class _$AppNotificationCopyWithImpl<$Res>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._self, this._then);

  final AppNotification _self;
  final $Res Function(AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? createdAt = null,Object? read = null,Object? params = null,Object? target = freezed,}) {
  return _then(AppNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationKind,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Map<String, String>,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as NotificationTarget?,
  ));
}
/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTargetCopyWith<$Res>? get target {
    if (_self.target == null) {
    return null;
  }

  return $NotificationTargetCopyWith<$Res>(_self.target!, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppNotification].
extension AppNotificationPatterns on AppNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotification value)  $default,){
final _that = this;
switch (_that) {
case _AppNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotification value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  NotificationKind kind,  DateTime createdAt,  bool read,  Map<String, String> params,  NotificationTarget? target)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that.id,_that.kind,_that.createdAt,_that.read,_that.params,_that.target);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  NotificationKind kind,  DateTime createdAt,  bool read,  Map<String, String> params,  NotificationTarget? target)  $default,) {final _that = this;
switch (_that) {
case _AppNotification():
return $default(_that.id,_that.kind,_that.createdAt,_that.read,_that.params,_that.target);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  NotificationKind kind,  DateTime createdAt,  bool read,  Map<String, String> params,  NotificationTarget? target)?  $default,) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that.id,_that.kind,_that.createdAt,_that.read,_that.params,_that.target);case _:
  return null;

}
}

}

/// @nodoc


class _AppNotification implements AppNotification {
  const _AppNotification({required this.id, required this.kind, required this.createdAt, this.read = false,  Map<String, String> params = const <String, String>{}, this.target}): _params = params;
  

@override final  String id;
@override final  NotificationKind kind;
@override final  DateTime createdAt;
@override@JsonKey() final  bool read;
 final  Map<String, String> _params;
@override@JsonKey() Map<String, String> get params {
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_params);
}

@override final  NotificationTarget? target;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationCopyWith<_AppNotification> get copyWith => __$AppNotificationCopyWithImpl<_AppNotification>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.read, read) || other.read == read)&&const DeepCollectionEquality().equals(other.params, _params)&&(identical(other.target, target) || other.target == target));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,createdAt,read,const DeepCollectionEquality().hash(_params),target);
}

@override
String toString() {
    return 'AppNotification(id: $id, kind: $kind, createdAt: $createdAt, read: $read, params: $params, target: $target)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationCopyWith<$Res> implements $AppNotificationCopyWith<$Res> {
  factory _$AppNotificationCopyWith(_AppNotification value, $Res Function(_AppNotification) _then) = __$AppNotificationCopyWithImpl;
@override @useResult
$Res call({
 String id, NotificationKind kind, DateTime createdAt, bool read, Map<String, String> params, NotificationTarget? target
});


@override $NotificationTargetCopyWith<$Res>? get target;

}
/// @nodoc
class __$AppNotificationCopyWithImpl<$Res>
    implements _$AppNotificationCopyWith<$Res> {
  __$AppNotificationCopyWithImpl(this._self, this._then);

  final _AppNotification _self;
  final $Res Function(_AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? createdAt = null,Object? read = null,Object? params = null,Object? target = freezed,}) {
  return _then(_AppNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationKind,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,params: null == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, String>,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as NotificationTarget?,
  ));
}

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTargetCopyWith<$Res>? get target {
    if (_self.target == null) {
    return null;
  }

  return $NotificationTargetCopyWith<$Res>(_self.target!, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}

/// @nodoc
mixin _$NotificationTarget {

 NotificationTargetKind get kind; String get id;
/// Create a copy of NotificationTarget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationTargetCopyWith<NotificationTarget> get copyWith => _$NotificationTargetCopyWithImpl<NotificationTarget>(this as NotificationTarget, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NotificationTarget;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationTarget&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.id, _this.id) || other.id == _this.id));
}


@override
int get hashCode {
  final _this = this as NotificationTarget;
  return Object.hash(runtimeType,_this.kind,_this.id);
}

@override
String toString() {
  final _this = this as NotificationTarget;
  return 'NotificationTarget(kind: ${_this.kind}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $NotificationTargetCopyWith<$Res>  {
  factory $NotificationTargetCopyWith(NotificationTarget value, $Res Function(NotificationTarget) _then) = _$NotificationTargetCopyWithImpl;
@useResult
$Res call({
 NotificationTargetKind kind, String id
});




}
/// @nodoc
class _$NotificationTargetCopyWithImpl<$Res>
    implements $NotificationTargetCopyWith<$Res> {
  _$NotificationTargetCopyWithImpl(this._self, this._then);

  final NotificationTarget _self;
  final $Res Function(NotificationTarget) _then;

/// Create a copy of NotificationTarget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? id = null,}) {
  return _then(NotificationTarget(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationTargetKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationTarget].
extension NotificationTargetPatterns on NotificationTarget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationTarget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationTarget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationTarget value)  $default,){
final _that = this;
switch (_that) {
case _NotificationTarget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationTarget value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationTarget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationTargetKind kind,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationTarget() when $default != null:
return $default(_that.kind,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationTargetKind kind,  String id)  $default,) {final _that = this;
switch (_that) {
case _NotificationTarget():
return $default(_that.kind,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationTargetKind kind,  String id)?  $default,) {final _that = this;
switch (_that) {
case _NotificationTarget() when $default != null:
return $default(_that.kind,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationTarget implements NotificationTarget {
  const _NotificationTarget({required this.kind, this.id = ''});
  

@override final  NotificationTargetKind kind;
@override@JsonKey() final  String id;

/// Create a copy of NotificationTarget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationTargetCopyWith<_NotificationTarget> get copyWith => __$NotificationTargetCopyWithImpl<_NotificationTarget>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationTarget&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kind,id);
}

@override
String toString() {
    return 'NotificationTarget(kind: $kind, id: $id)';
}


}

/// @nodoc
abstract mixin class _$NotificationTargetCopyWith<$Res> implements $NotificationTargetCopyWith<$Res> {
  factory _$NotificationTargetCopyWith(_NotificationTarget value, $Res Function(_NotificationTarget) _then) = __$NotificationTargetCopyWithImpl;
@override @useResult
$Res call({
 NotificationTargetKind kind, String id
});




}
/// @nodoc
class __$NotificationTargetCopyWithImpl<$Res>
    implements _$NotificationTargetCopyWith<$Res> {
  __$NotificationTargetCopyWithImpl(this._self, this._then);

  final _NotificationTarget _self;
  final $Res Function(_NotificationTarget) _then;

/// Create a copy of NotificationTarget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? id = null,}) {
  return _then(_NotificationTarget(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationTargetKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
