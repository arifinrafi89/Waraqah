// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blocked_reader_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlockedReaderModel {

 String get id; String get name; DateTime get blockedAt;
/// Create a copy of BlockedReaderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockedReaderModelCopyWith<BlockedReaderModel> get copyWith => _$BlockedReaderModelCopyWithImpl<BlockedReaderModel>(this as BlockedReaderModel, _$identity);

  /// Serializes this BlockedReaderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BlockedReaderModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockedReaderModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.blockedAt, _this.blockedAt) || other.blockedAt == _this.blockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BlockedReaderModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.blockedAt);
}

@override
String toString() {
  final _this = this as BlockedReaderModel;
  return 'BlockedReaderModel(id: ${_this.id}, name: ${_this.name}, blockedAt: ${_this.blockedAt})';
}


}

/// @nodoc
abstract mixin class $BlockedReaderModelCopyWith<$Res>  {
  factory $BlockedReaderModelCopyWith(BlockedReaderModel value, $Res Function(BlockedReaderModel) _then) = _$BlockedReaderModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, DateTime blockedAt
});




}
/// @nodoc
class _$BlockedReaderModelCopyWithImpl<$Res>
    implements $BlockedReaderModelCopyWith<$Res> {
  _$BlockedReaderModelCopyWithImpl(this._self, this._then);

  final BlockedReaderModel _self;
  final $Res Function(BlockedReaderModel) _then;

/// Create a copy of BlockedReaderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? blockedAt = null,}) {
  return _then(BlockedReaderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,blockedAt: null == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockedReaderModel].
extension BlockedReaderModelPatterns on BlockedReaderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockedReaderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockedReaderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockedReaderModel value)  $default,){
final _that = this;
switch (_that) {
case _BlockedReaderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockedReaderModel value)?  $default,){
final _that = this;
switch (_that) {
case _BlockedReaderModel() when $default != null:
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
case _BlockedReaderModel() when $default != null:
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
case _BlockedReaderModel():
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
case _BlockedReaderModel() when $default != null:
return $default(_that.id,_that.name,_that.blockedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BlockedReaderModel implements BlockedReaderModel {
  const _BlockedReaderModel({required this.id, required this.name, required this.blockedAt});
  factory _BlockedReaderModel.fromJson(Map<String, dynamic> json) => _$BlockedReaderModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  DateTime blockedAt;

/// Create a copy of BlockedReaderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockedReaderModelCopyWith<_BlockedReaderModel> get copyWith => __$BlockedReaderModelCopyWithImpl<_BlockedReaderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlockedReaderModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockedReaderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.blockedAt, blockedAt) || other.blockedAt == blockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,blockedAt);
}

@override
String toString() {
    return 'BlockedReaderModel(id: $id, name: $name, blockedAt: $blockedAt)';
}


}

/// @nodoc
abstract mixin class _$BlockedReaderModelCopyWith<$Res> implements $BlockedReaderModelCopyWith<$Res> {
  factory _$BlockedReaderModelCopyWith(_BlockedReaderModel value, $Res Function(_BlockedReaderModel) _then) = __$BlockedReaderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, DateTime blockedAt
});




}
/// @nodoc
class __$BlockedReaderModelCopyWithImpl<$Res>
    implements _$BlockedReaderModelCopyWith<$Res> {
  __$BlockedReaderModelCopyWithImpl(this._self, this._then);

  final _BlockedReaderModel _self;
  final $Res Function(_BlockedReaderModel) _then;

/// Create a copy of BlockedReaderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? blockedAt = null,}) {
  return _then(_BlockedReaderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,blockedAt: null == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
