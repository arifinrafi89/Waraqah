// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reorder_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReorderResult {

 int get added; int get skipped;
/// Create a copy of ReorderResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReorderResultCopyWith<ReorderResult> get copyWith => _$ReorderResultCopyWithImpl<ReorderResult>(this as ReorderResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReorderResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderResult&&(identical(other.added, _this.added) || other.added == _this.added)&&(identical(other.skipped, _this.skipped) || other.skipped == _this.skipped));
}


@override
int get hashCode {
  final _this = this as ReorderResult;
  return Object.hash(runtimeType,_this.added,_this.skipped);
}

@override
String toString() {
  final _this = this as ReorderResult;
  return 'ReorderResult(added: ${_this.added}, skipped: ${_this.skipped})';
}


}

/// @nodoc
abstract mixin class $ReorderResultCopyWith<$Res>  {
  factory $ReorderResultCopyWith(ReorderResult value, $Res Function(ReorderResult) _then) = _$ReorderResultCopyWithImpl;
@useResult
$Res call({
 int added, int skipped
});




}
/// @nodoc
class _$ReorderResultCopyWithImpl<$Res>
    implements $ReorderResultCopyWith<$Res> {
  _$ReorderResultCopyWithImpl(this._self, this._then);

  final ReorderResult _self;
  final $Res Function(ReorderResult) _then;

/// Create a copy of ReorderResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? added = null,Object? skipped = null,}) {
  return _then(ReorderResult(
added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as int,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReorderResult].
extension ReorderResultPatterns on ReorderResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReorderResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReorderResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReorderResult value)  $default,){
final _that = this;
switch (_that) {
case _ReorderResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReorderResult value)?  $default,){
final _that = this;
switch (_that) {
case _ReorderResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int added,  int skipped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReorderResult() when $default != null:
return $default(_that.added,_that.skipped);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int added,  int skipped)  $default,) {final _that = this;
switch (_that) {
case _ReorderResult():
return $default(_that.added,_that.skipped);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int added,  int skipped)?  $default,) {final _that = this;
switch (_that) {
case _ReorderResult() when $default != null:
return $default(_that.added,_that.skipped);case _:
  return null;

}
}

}

/// @nodoc


class _ReorderResult implements ReorderResult {
  const _ReorderResult({this.added = 0, this.skipped = 0});
  

@override@JsonKey() final  int added;
@override@JsonKey() final  int skipped;

/// Create a copy of ReorderResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderResultCopyWith<_ReorderResult> get copyWith => __$ReorderResultCopyWithImpl<_ReorderResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderResult&&(identical(other.added, added) || other.added == added)&&(identical(other.skipped, skipped) || other.skipped == skipped));
}


@override
int get hashCode {
    return Object.hash(runtimeType,added,skipped);
}

@override
String toString() {
    return 'ReorderResult(added: $added, skipped: $skipped)';
}


}

/// @nodoc
abstract mixin class _$ReorderResultCopyWith<$Res> implements $ReorderResultCopyWith<$Res> {
  factory _$ReorderResultCopyWith(_ReorderResult value, $Res Function(_ReorderResult) _then) = __$ReorderResultCopyWithImpl;
@override @useResult
$Res call({
 int added, int skipped
});




}
/// @nodoc
class __$ReorderResultCopyWithImpl<$Res>
    implements _$ReorderResultCopyWith<$Res> {
  __$ReorderResultCopyWithImpl(this._self, this._then);

  final _ReorderResult _self;
  final $Res Function(_ReorderResult) _then;

/// Create a copy of ReorderResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? added = null,Object? skipped = null,}) {
  return _then(_ReorderResult(
added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as int,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
