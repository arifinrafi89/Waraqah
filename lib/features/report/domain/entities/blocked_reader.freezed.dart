// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blocked_reader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlockedReader {

 String get id; String get name; DateTime get blockedAt;
/// Create a copy of BlockedReader
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockedReaderCopyWith<BlockedReader> get copyWith => _$BlockedReaderCopyWithImpl<BlockedReader>(this as BlockedReader, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BlockedReader;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockedReader&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.blockedAt, _this.blockedAt) || other.blockedAt == _this.blockedAt));
}


@override
int get hashCode {
  final _this = this as BlockedReader;
  return Object.hash(runtimeType,_this.id,_this.name,_this.blockedAt);
}

@override
String toString() {
  final _this = this as BlockedReader;
  return 'BlockedReader(id: ${_this.id}, name: ${_this.name}, blockedAt: ${_this.blockedAt})';
}


}

/// @nodoc
abstract mixin class $BlockedReaderCopyWith<$Res>  {
  factory $BlockedReaderCopyWith(BlockedReader value, $Res Function(BlockedReader) _then) = _$BlockedReaderCopyWithImpl;
@useResult
$Res call({
 String id, String name, DateTime blockedAt
});




}
/// @nodoc
class _$BlockedReaderCopyWithImpl<$Res>
    implements $BlockedReaderCopyWith<$Res> {
  _$BlockedReaderCopyWithImpl(this._self, this._then);

  final BlockedReader _self;
  final $Res Function(BlockedReader) _then;

/// Create a copy of BlockedReader
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? blockedAt = null,}) {
  return _then(BlockedReader(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,blockedAt: null == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockedReader].
extension BlockedReaderPatterns on BlockedReader {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockedReader value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockedReader() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockedReader value)  $default,){
final _that = this;
switch (_that) {
case _BlockedReader():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockedReader value)?  $default,){
final _that = this;
switch (_that) {
case _BlockedReader() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  DateTime blockedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockedReader() when $default != null:
return $default(_that.id,_that.name,_that.blockedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  DateTime blockedAt)  $default,) {final _that = this;
switch (_that) {
case _BlockedReader():
return $default(_that.id,_that.name,_that.blockedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  DateTime blockedAt)?  $default,) {final _that = this;
switch (_that) {
case _BlockedReader() when $default != null:
return $default(_that.id,_that.name,_that.blockedAt);case _:
  return null;

}
}

}

/// @nodoc


class _BlockedReader implements BlockedReader {
  const _BlockedReader({required this.id, required this.name, required this.blockedAt});
  

@override final  String id;
@override final  String name;
@override final  DateTime blockedAt;

/// Create a copy of BlockedReader
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockedReaderCopyWith<_BlockedReader> get copyWith => __$BlockedReaderCopyWithImpl<_BlockedReader>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockedReader&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.blockedAt, blockedAt) || other.blockedAt == blockedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,blockedAt);
}

@override
String toString() {
    return 'BlockedReader(id: $id, name: $name, blockedAt: $blockedAt)';
}


}

/// @nodoc
abstract mixin class _$BlockedReaderCopyWith<$Res> implements $BlockedReaderCopyWith<$Res> {
  factory _$BlockedReaderCopyWith(_BlockedReader value, $Res Function(_BlockedReader) _then) = __$BlockedReaderCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, DateTime blockedAt
});




}
/// @nodoc
class __$BlockedReaderCopyWithImpl<$Res>
    implements _$BlockedReaderCopyWith<$Res> {
  __$BlockedReaderCopyWithImpl(this._self, this._then);

  final _BlockedReader _self;
  final $Res Function(_BlockedReader) _then;

/// Create a copy of BlockedReader
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? blockedAt = null,}) {
  return _then(_BlockedReader(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,blockedAt: null == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
