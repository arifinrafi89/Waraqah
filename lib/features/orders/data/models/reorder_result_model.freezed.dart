// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reorder_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReorderResultModel {

 int get added; int get skipped;
/// Create a copy of ReorderResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReorderResultModelCopyWith<ReorderResultModel> get copyWith => _$ReorderResultModelCopyWithImpl<ReorderResultModel>(this as ReorderResultModel, _$identity);

  /// Serializes this ReorderResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReorderResultModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderResultModel&&(identical(other.added, _this.added) || other.added == _this.added)&&(identical(other.skipped, _this.skipped) || other.skipped == _this.skipped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReorderResultModel;
  return Object.hash(runtimeType,_this.added,_this.skipped);
}

@override
String toString() {
  final _this = this as ReorderResultModel;
  return 'ReorderResultModel(added: ${_this.added}, skipped: ${_this.skipped})';
}


}

/// @nodoc
abstract mixin class $ReorderResultModelCopyWith<$Res>  {
  factory $ReorderResultModelCopyWith(ReorderResultModel value, $Res Function(ReorderResultModel) _then) = _$ReorderResultModelCopyWithImpl;
@useResult
$Res call({
 int added, int skipped
});




}
/// @nodoc
class _$ReorderResultModelCopyWithImpl<$Res>
    implements $ReorderResultModelCopyWith<$Res> {
  _$ReorderResultModelCopyWithImpl(this._self, this._then);

  final ReorderResultModel _self;
  final $Res Function(ReorderResultModel) _then;

/// Create a copy of ReorderResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? added = null,Object? skipped = null,}) {
  return _then(ReorderResultModel(
added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as int,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReorderResultModel].
extension ReorderResultModelPatterns on ReorderResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReorderResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReorderResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReorderResultModel value)  $default,){
final _that = this;
switch (_that) {
case _ReorderResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReorderResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReorderResultModel() when $default != null:
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
case _ReorderResultModel() when $default != null:
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
case _ReorderResultModel():
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
case _ReorderResultModel() when $default != null:
return $default(_that.added,_that.skipped);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReorderResultModel implements ReorderResultModel {
  const _ReorderResultModel({this.added = 0, this.skipped = 0});
  factory _ReorderResultModel.fromJson(Map<String, dynamic> json) => _$ReorderResultModelFromJson(json);

@override@JsonKey() final  int added;
@override@JsonKey() final  int skipped;

/// Create a copy of ReorderResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderResultModelCopyWith<_ReorderResultModel> get copyWith => __$ReorderResultModelCopyWithImpl<_ReorderResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReorderResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderResultModel&&(identical(other.added, added) || other.added == added)&&(identical(other.skipped, skipped) || other.skipped == skipped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,added,skipped);
}

@override
String toString() {
    return 'ReorderResultModel(added: $added, skipped: $skipped)';
}


}

/// @nodoc
abstract mixin class _$ReorderResultModelCopyWith<$Res> implements $ReorderResultModelCopyWith<$Res> {
  factory _$ReorderResultModelCopyWith(_ReorderResultModel value, $Res Function(_ReorderResultModel) _then) = __$ReorderResultModelCopyWithImpl;
@override @useResult
$Res call({
 int added, int skipped
});




}
/// @nodoc
class __$ReorderResultModelCopyWithImpl<$Res>
    implements _$ReorderResultModelCopyWith<$Res> {
  __$ReorderResultModelCopyWithImpl(this._self, this._then);

  final _ReorderResultModel _self;
  final $Res Function(_ReorderResultModel) _then;

/// Create a copy of ReorderResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? added = null,Object? skipped = null,}) {
  return _then(_ReorderResultModel(
added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as int,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
