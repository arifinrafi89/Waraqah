// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppNotificationModel {

 String get id; NotificationKind get kind; DateTime get createdAt; bool get read; Map<String, String> get params; NotificationTargetModel? get target;
/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationModelCopyWith<AppNotificationModel> get copyWith => _$AppNotificationModelCopyWithImpl<AppNotificationModel>(this as AppNotificationModel, _$identity);

  /// Serializes this AppNotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppNotificationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotificationModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.read, _this.read) || other.read == _this.read)&&const DeepCollectionEquality().equals(other.params, _this.params)&&(identical(other.target, _this.target) || other.target == _this.target));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppNotificationModel;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.createdAt,_this.read,const DeepCollectionEquality().hash(_this.params),_this.target);
}

@override
String toString() {
  final _this = this as AppNotificationModel;
  return 'AppNotificationModel(id: ${_this.id}, kind: ${_this.kind}, createdAt: ${_this.createdAt}, read: ${_this.read}, params: ${_this.params}, target: ${_this.target})';
}


}

/// @nodoc
abstract mixin class $AppNotificationModelCopyWith<$Res>  {
  factory $AppNotificationModelCopyWith(AppNotificationModel value, $Res Function(AppNotificationModel) _then) = _$AppNotificationModelCopyWithImpl;
@useResult
$Res call({
 String id, NotificationKind kind, DateTime createdAt, bool read, Map<String, String> params, NotificationTargetModel? target
});


$NotificationTargetModelCopyWith<$Res>? get target;

}
/// @nodoc
class _$AppNotificationModelCopyWithImpl<$Res>
    implements $AppNotificationModelCopyWith<$Res> {
  _$AppNotificationModelCopyWithImpl(this._self, this._then);

  final AppNotificationModel _self;
  final $Res Function(AppNotificationModel) _then;

/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? createdAt = null,Object? read = null,Object? params = null,Object? target = freezed,}) {
  return _then(AppNotificationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationKind,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Map<String, String>,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as NotificationTargetModel?,
  ));
}
/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTargetModelCopyWith<$Res>? get target {
    if (_self.target == null) {
    return null;
  }

  return $NotificationTargetModelCopyWith<$Res>(_self.target!, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppNotificationModel].
extension AppNotificationModelPatterns on AppNotificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _AppNotificationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  NotificationKind kind,  DateTime createdAt,  bool read,  Map<String, String> params,  NotificationTargetModel? target)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  NotificationKind kind,  DateTime createdAt,  bool read,  Map<String, String> params,  NotificationTargetModel? target)  $default,) {final _that = this;
switch (_that) {
case _AppNotificationModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  NotificationKind kind,  DateTime createdAt,  bool read,  Map<String, String> params,  NotificationTargetModel? target)?  $default,) {final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
return $default(_that.id,_that.kind,_that.createdAt,_that.read,_that.params,_that.target);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _AppNotificationModel implements AppNotificationModel {
  const _AppNotificationModel({required this.id, required this.kind, required this.createdAt, this.read = false,  Map<String, String> params = const <String, String>{}, this.target}): _params = params;
  factory _AppNotificationModel.fromJson(Map<String, dynamic> json) => _$AppNotificationModelFromJson(json);

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

@override final  NotificationTargetModel? target;

/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationModelCopyWith<_AppNotificationModel> get copyWith => __$AppNotificationModelCopyWithImpl<_AppNotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppNotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.read, read) || other.read == read)&&const DeepCollectionEquality().equals(other.params, _params)&&(identical(other.target, target) || other.target == target));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,createdAt,read,const DeepCollectionEquality().hash(_params),target);
}

@override
String toString() {
    return 'AppNotificationModel(id: $id, kind: $kind, createdAt: $createdAt, read: $read, params: $params, target: $target)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationModelCopyWith<$Res> implements $AppNotificationModelCopyWith<$Res> {
  factory _$AppNotificationModelCopyWith(_AppNotificationModel value, $Res Function(_AppNotificationModel) _then) = __$AppNotificationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, NotificationKind kind, DateTime createdAt, bool read, Map<String, String> params, NotificationTargetModel? target
});


@override $NotificationTargetModelCopyWith<$Res>? get target;

}
/// @nodoc
class __$AppNotificationModelCopyWithImpl<$Res>
    implements _$AppNotificationModelCopyWith<$Res> {
  __$AppNotificationModelCopyWithImpl(this._self, this._then);

  final _AppNotificationModel _self;
  final $Res Function(_AppNotificationModel) _then;

/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? createdAt = null,Object? read = null,Object? params = null,Object? target = freezed,}) {
  return _then(_AppNotificationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationKind,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,params: null == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, String>,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as NotificationTargetModel?,
  ));
}

/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTargetModelCopyWith<$Res>? get target {
    if (_self.target == null) {
    return null;
  }

  return $NotificationTargetModelCopyWith<$Res>(_self.target!, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// @nodoc
mixin _$NotificationTargetModel {

 NotificationTargetKind get kind; String get id;
/// Create a copy of NotificationTargetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationTargetModelCopyWith<NotificationTargetModel> get copyWith => _$NotificationTargetModelCopyWithImpl<NotificationTargetModel>(this as NotificationTargetModel, _$identity);

  /// Serializes this NotificationTargetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationTargetModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationTargetModel&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.id, _this.id) || other.id == _this.id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationTargetModel;
  return Object.hash(runtimeType,_this.kind,_this.id);
}

@override
String toString() {
  final _this = this as NotificationTargetModel;
  return 'NotificationTargetModel(kind: ${_this.kind}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $NotificationTargetModelCopyWith<$Res>  {
  factory $NotificationTargetModelCopyWith(NotificationTargetModel value, $Res Function(NotificationTargetModel) _then) = _$NotificationTargetModelCopyWithImpl;
@useResult
$Res call({
 NotificationTargetKind kind, String id
});




}
/// @nodoc
class _$NotificationTargetModelCopyWithImpl<$Res>
    implements $NotificationTargetModelCopyWith<$Res> {
  _$NotificationTargetModelCopyWithImpl(this._self, this._then);

  final NotificationTargetModel _self;
  final $Res Function(NotificationTargetModel) _then;

/// Create a copy of NotificationTargetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? id = null,}) {
  return _then(NotificationTargetModel(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationTargetKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationTargetModel].
extension NotificationTargetModelPatterns on NotificationTargetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationTargetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationTargetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationTargetModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationTargetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationTargetModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationTargetModel() when $default != null:
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
case _NotificationTargetModel() when $default != null:
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
case _NotificationTargetModel():
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
case _NotificationTargetModel() when $default != null:
return $default(_that.kind,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationTargetModel implements NotificationTargetModel {
  const _NotificationTargetModel({required this.kind, this.id = ''});
  factory _NotificationTargetModel.fromJson(Map<String, dynamic> json) => _$NotificationTargetModelFromJson(json);

@override final  NotificationTargetKind kind;
@override@JsonKey() final  String id;

/// Create a copy of NotificationTargetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationTargetModelCopyWith<_NotificationTargetModel> get copyWith => __$NotificationTargetModelCopyWithImpl<_NotificationTargetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationTargetModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationTargetModel&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,id);
}

@override
String toString() {
    return 'NotificationTargetModel(kind: $kind, id: $id)';
}


}

/// @nodoc
abstract mixin class _$NotificationTargetModelCopyWith<$Res> implements $NotificationTargetModelCopyWith<$Res> {
  factory _$NotificationTargetModelCopyWith(_NotificationTargetModel value, $Res Function(_NotificationTargetModel) _then) = __$NotificationTargetModelCopyWithImpl;
@override @useResult
$Res call({
 NotificationTargetKind kind, String id
});




}
/// @nodoc
class __$NotificationTargetModelCopyWithImpl<$Res>
    implements _$NotificationTargetModelCopyWith<$Res> {
  __$NotificationTargetModelCopyWithImpl(this._self, this._then);

  final _NotificationTargetModel _self;
  final $Res Function(_NotificationTargetModel) _then;

/// Create a copy of NotificationTargetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? id = null,}) {
  return _then(_NotificationTargetModel(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationTargetKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
