// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CouponModel {

 String get code; CouponKind get kind; int get value; int get minOrderBdt; int? get maxDiscountBdt; DateTime? get expiresAt;
/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouponModelCopyWith<CouponModel> get copyWith => _$CouponModelCopyWithImpl<CouponModel>(this as CouponModel, _$identity);

  /// Serializes this CouponModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CouponModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponModel&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.minOrderBdt, _this.minOrderBdt) || other.minOrderBdt == _this.minOrderBdt)&&(identical(other.maxDiscountBdt, _this.maxDiscountBdt) || other.maxDiscountBdt == _this.maxDiscountBdt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CouponModel;
  return Object.hash(runtimeType,_this.code,_this.kind,_this.value,_this.minOrderBdt,_this.maxDiscountBdt,_this.expiresAt);
}

@override
String toString() {
  final _this = this as CouponModel;
  return 'CouponModel(code: ${_this.code}, kind: ${_this.kind}, value: ${_this.value}, minOrderBdt: ${_this.minOrderBdt}, maxDiscountBdt: ${_this.maxDiscountBdt}, expiresAt: ${_this.expiresAt})';
}


}

/// @nodoc
abstract mixin class $CouponModelCopyWith<$Res>  {
  factory $CouponModelCopyWith(CouponModel value, $Res Function(CouponModel) _then) = _$CouponModelCopyWithImpl;
@useResult
$Res call({
 String code, CouponKind kind, int value, int minOrderBdt, int? maxDiscountBdt, DateTime? expiresAt
});




}
/// @nodoc
class _$CouponModelCopyWithImpl<$Res>
    implements $CouponModelCopyWith<$Res> {
  _$CouponModelCopyWithImpl(this._self, this._then);

  final CouponModel _self;
  final $Res Function(CouponModel) _then;

/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? kind = null,Object? value = null,Object? minOrderBdt = null,Object? maxDiscountBdt = freezed,Object? expiresAt = freezed,}) {
  return _then(CouponModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CouponKind,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,minOrderBdt: null == minOrderBdt ? _self.minOrderBdt : minOrderBdt // ignore: cast_nullable_to_non_nullable
as int,maxDiscountBdt: freezed == maxDiscountBdt ? _self.maxDiscountBdt : maxDiscountBdt // ignore: cast_nullable_to_non_nullable
as int?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CouponModel].
extension CouponModelPatterns on CouponModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CouponModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CouponModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CouponModel value)  $default,){
final _that = this;
switch (_that) {
case _CouponModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CouponModel value)?  $default,){
final _that = this;
switch (_that) {
case _CouponModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  CouponKind kind,  int value,  int minOrderBdt,  int? maxDiscountBdt,  DateTime? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CouponModel() when $default != null:
return $default(_that.code,_that.kind,_that.value,_that.minOrderBdt,_that.maxDiscountBdt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  CouponKind kind,  int value,  int minOrderBdt,  int? maxDiscountBdt,  DateTime? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _CouponModel():
return $default(_that.code,_that.kind,_that.value,_that.minOrderBdt,_that.maxDiscountBdt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  CouponKind kind,  int value,  int minOrderBdt,  int? maxDiscountBdt,  DateTime? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _CouponModel() when $default != null:
return $default(_that.code,_that.kind,_that.value,_that.minOrderBdt,_that.maxDiscountBdt,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CouponModel implements CouponModel {
  const _CouponModel({required this.code, required this.kind, this.value = 0, this.minOrderBdt = 0, this.maxDiscountBdt, this.expiresAt});
  factory _CouponModel.fromJson(Map<String, dynamic> json) => _$CouponModelFromJson(json);

@override final  String code;
@override final  CouponKind kind;
@override@JsonKey() final  int value;
@override@JsonKey() final  int minOrderBdt;
@override final  int? maxDiscountBdt;
@override final  DateTime? expiresAt;

/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CouponModelCopyWith<_CouponModel> get copyWith => __$CouponModelCopyWithImpl<_CouponModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CouponModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CouponModel&&(identical(other.code, code) || other.code == code)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.value, value) || other.value == value)&&(identical(other.minOrderBdt, minOrderBdt) || other.minOrderBdt == minOrderBdt)&&(identical(other.maxDiscountBdt, maxDiscountBdt) || other.maxDiscountBdt == maxDiscountBdt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,kind,value,minOrderBdt,maxDiscountBdt,expiresAt);
}

@override
String toString() {
    return 'CouponModel(code: $code, kind: $kind, value: $value, minOrderBdt: $minOrderBdt, maxDiscountBdt: $maxDiscountBdt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$CouponModelCopyWith<$Res> implements $CouponModelCopyWith<$Res> {
  factory _$CouponModelCopyWith(_CouponModel value, $Res Function(_CouponModel) _then) = __$CouponModelCopyWithImpl;
@override @useResult
$Res call({
 String code, CouponKind kind, int value, int minOrderBdt, int? maxDiscountBdt, DateTime? expiresAt
});




}
/// @nodoc
class __$CouponModelCopyWithImpl<$Res>
    implements _$CouponModelCopyWith<$Res> {
  __$CouponModelCopyWithImpl(this._self, this._then);

  final _CouponModel _self;
  final $Res Function(_CouponModel) _then;

/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? kind = null,Object? value = null,Object? minOrderBdt = null,Object? maxDiscountBdt = freezed,Object? expiresAt = freezed,}) {
  return _then(_CouponModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CouponKind,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,minOrderBdt: null == minOrderBdt ? _self.minOrderBdt : minOrderBdt // ignore: cast_nullable_to_non_nullable
as int,maxDiscountBdt: freezed == maxDiscountBdt ? _self.maxDiscountBdt : maxDiscountBdt // ignore: cast_nullable_to_non_nullable
as int?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
