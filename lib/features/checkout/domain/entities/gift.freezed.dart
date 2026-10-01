// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Gift {

 String get recipientName; String get message; bool get wrapped;
/// Create a copy of Gift
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftCopyWith<Gift> get copyWith => _$GiftCopyWithImpl<Gift>(this as Gift, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Gift;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Gift&&(identical(other.recipientName, _this.recipientName) || other.recipientName == _this.recipientName)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.wrapped, _this.wrapped) || other.wrapped == _this.wrapped));
}


@override
int get hashCode {
  final _this = this as Gift;
  return Object.hash(runtimeType,_this.recipientName,_this.message,_this.wrapped);
}

@override
String toString() {
  final _this = this as Gift;
  return 'Gift(recipientName: ${_this.recipientName}, message: ${_this.message}, wrapped: ${_this.wrapped})';
}


}

/// @nodoc
abstract mixin class $GiftCopyWith<$Res>  {
  factory $GiftCopyWith(Gift value, $Res Function(Gift) _then) = _$GiftCopyWithImpl;
@useResult
$Res call({
 String recipientName, String message, bool wrapped
});




}
/// @nodoc
class _$GiftCopyWithImpl<$Res>
    implements $GiftCopyWith<$Res> {
  _$GiftCopyWithImpl(this._self, this._then);

  final Gift _self;
  final $Res Function(Gift) _then;

/// Create a copy of Gift
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipientName = null,Object? message = null,Object? wrapped = null,}) {
  return _then(Gift(
recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,wrapped: null == wrapped ? _self.wrapped : wrapped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Gift].
extension GiftPatterns on Gift {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Gift value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Gift() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Gift value)  $default,){
final _that = this;
switch (_that) {
case _Gift():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Gift value)?  $default,){
final _that = this;
switch (_that) {
case _Gift() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String recipientName,  String message,  bool wrapped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Gift() when $default != null:
return $default(_that.recipientName,_that.message,_that.wrapped);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String recipientName,  String message,  bool wrapped)  $default,) {final _that = this;
switch (_that) {
case _Gift():
return $default(_that.recipientName,_that.message,_that.wrapped);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String recipientName,  String message,  bool wrapped)?  $default,) {final _that = this;
switch (_that) {
case _Gift() when $default != null:
return $default(_that.recipientName,_that.message,_that.wrapped);case _:
  return null;

}
}

}

/// @nodoc


class _Gift extends Gift {
  const _Gift({this.recipientName = '', this.message = '', this.wrapped = false}): super._();
  

@override@JsonKey() final  String recipientName;
@override@JsonKey() final  String message;
@override@JsonKey() final  bool wrapped;

/// Create a copy of Gift
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftCopyWith<_Gift> get copyWith => __$GiftCopyWithImpl<_Gift>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Gift&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.message, message) || other.message == message)&&(identical(other.wrapped, wrapped) || other.wrapped == wrapped));
}


@override
int get hashCode {
    return Object.hash(runtimeType,recipientName,message,wrapped);
}

@override
String toString() {
    return 'Gift(recipientName: $recipientName, message: $message, wrapped: $wrapped)';
}


}

/// @nodoc
abstract mixin class _$GiftCopyWith<$Res> implements $GiftCopyWith<$Res> {
  factory _$GiftCopyWith(_Gift value, $Res Function(_Gift) _then) = __$GiftCopyWithImpl;
@override @useResult
$Res call({
 String recipientName, String message, bool wrapped
});




}
/// @nodoc
class __$GiftCopyWithImpl<$Res>
    implements _$GiftCopyWith<$Res> {
  __$GiftCopyWithImpl(this._self, this._then);

  final _Gift _self;
  final $Res Function(_Gift) _then;

/// Create a copy of Gift
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipientName = null,Object? message = null,Object? wrapped = null,}) {
  return _then(_Gift(
recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,wrapped: null == wrapped ? _self.wrapped : wrapped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
