// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatusChange {

 OrderStatus get status; DateTime get at;
/// Create a copy of StatusChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusChangeCopyWith<StatusChange> get copyWith => _$StatusChangeCopyWithImpl<StatusChange>(this as StatusChange, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StatusChange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusChange&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.at, _this.at) || other.at == _this.at));
}


@override
int get hashCode {
  final _this = this as StatusChange;
  return Object.hash(runtimeType,_this.status,_this.at);
}

@override
String toString() {
  final _this = this as StatusChange;
  return 'StatusChange(status: ${_this.status}, at: ${_this.at})';
}


}

/// @nodoc
abstract mixin class $StatusChangeCopyWith<$Res>  {
  factory $StatusChangeCopyWith(StatusChange value, $Res Function(StatusChange) _then) = _$StatusChangeCopyWithImpl;
@useResult
$Res call({
 OrderStatus status, DateTime at
});




}
/// @nodoc
class _$StatusChangeCopyWithImpl<$Res>
    implements $StatusChangeCopyWith<$Res> {
  _$StatusChangeCopyWithImpl(this._self, this._then);

  final StatusChange _self;
  final $Res Function(StatusChange) _then;

/// Create a copy of StatusChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? at = null,}) {
  return _then(StatusChange(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusChange].
extension StatusChangePatterns on StatusChange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusChange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusChange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusChange value)  $default,){
final _that = this;
switch (_that) {
case _StatusChange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusChange value)?  $default,){
final _that = this;
switch (_that) {
case _StatusChange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderStatus status,  DateTime at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusChange() when $default != null:
return $default(_that.status,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderStatus status,  DateTime at)  $default,) {final _that = this;
switch (_that) {
case _StatusChange():
return $default(_that.status,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderStatus status,  DateTime at)?  $default,) {final _that = this;
switch (_that) {
case _StatusChange() when $default != null:
return $default(_that.status,_that.at);case _:
  return null;

}
}

}

/// @nodoc


class _StatusChange implements StatusChange {
  const _StatusChange({required this.status, required this.at});
  

@override final  OrderStatus status;
@override final  DateTime at;

/// Create a copy of StatusChange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusChangeCopyWith<_StatusChange> get copyWith => __$StatusChangeCopyWithImpl<_StatusChange>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusChange&&(identical(other.status, status) || other.status == status)&&(identical(other.at, at) || other.at == at));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,at);
}

@override
String toString() {
    return 'StatusChange(status: $status, at: $at)';
}


}

/// @nodoc
abstract mixin class _$StatusChangeCopyWith<$Res> implements $StatusChangeCopyWith<$Res> {
  factory _$StatusChangeCopyWith(_StatusChange value, $Res Function(_StatusChange) _then) = __$StatusChangeCopyWithImpl;
@override @useResult
$Res call({
 OrderStatus status, DateTime at
});




}
/// @nodoc
class __$StatusChangeCopyWithImpl<$Res>
    implements _$StatusChangeCopyWith<$Res> {
  __$StatusChangeCopyWithImpl(this._self, this._then);

  final _StatusChange _self;
  final $Res Function(_StatusChange) _then;

/// Create a copy of StatusChange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? at = null,}) {
  return _then(_StatusChange(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
