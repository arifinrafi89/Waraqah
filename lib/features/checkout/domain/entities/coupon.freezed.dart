// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Coupon {

 String get code; CouponKind get kind;/// Percent for [CouponKind.percentOff], taka for [CouponKind.amountOff],
/// unused for free delivery.
 int get value;/// The subtotal needed before the code works.
 int get minOrderBdt;/// Most a percent-off code can take off.
 int? get maxDiscountBdt;
/// Create a copy of Coupon
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouponCopyWith<Coupon> get copyWith => _$CouponCopyWithImpl<Coupon>(this as Coupon, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Coupon;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Coupon&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.minOrderBdt, _this.minOrderBdt) || other.minOrderBdt == _this.minOrderBdt)&&(identical(other.maxDiscountBdt, _this.maxDiscountBdt) || other.maxDiscountBdt == _this.maxDiscountBdt));
}


@override
int get hashCode {
  final _this = this as Coupon;
  return Object.hash(runtimeType,_this.code,_this.kind,_this.value,_this.minOrderBdt,_this.maxDiscountBdt);
}

@override
String toString() {
  final _this = this as Coupon;
  return 'Coupon(code: ${_this.code}, kind: ${_this.kind}, value: ${_this.value}, minOrderBdt: ${_this.minOrderBdt}, maxDiscountBdt: ${_this.maxDiscountBdt})';
}


}

/// @nodoc
abstract mixin class $CouponCopyWith<$Res>  {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) _then) = _$CouponCopyWithImpl;
@useResult
$Res call({
 String code, CouponKind kind, int value, int minOrderBdt, int? maxDiscountBdt
});




}
/// @nodoc
class _$CouponCopyWithImpl<$Res>
    implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._self, this._then);

  final Coupon _self;
  final $Res Function(Coupon) _then;

/// Create a copy of Coupon
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? kind = null,Object? value = null,Object? minOrderBdt = null,Object? maxDiscountBdt = freezed,}) {
  return _then(Coupon(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CouponKind,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,minOrderBdt: null == minOrderBdt ? _self.minOrderBdt : minOrderBdt // ignore: cast_nullable_to_non_nullable
as int,maxDiscountBdt: freezed == maxDiscountBdt ? _self.maxDiscountBdt : maxDiscountBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Coupon].
extension CouponPatterns on Coupon {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Coupon value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Coupon() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Coupon value)  $default,){
final _that = this;
switch (_that) {
case _Coupon():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Coupon value)?  $default,){
final _that = this;
switch (_that) {
case _Coupon() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  CouponKind kind,  int value,  int minOrderBdt,  int? maxDiscountBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Coupon() when $default != null:
return $default(_that.code,_that.kind,_that.value,_that.minOrderBdt,_that.maxDiscountBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  CouponKind kind,  int value,  int minOrderBdt,  int? maxDiscountBdt)  $default,) {final _that = this;
switch (_that) {
case _Coupon():
return $default(_that.code,_that.kind,_that.value,_that.minOrderBdt,_that.maxDiscountBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  CouponKind kind,  int value,  int minOrderBdt,  int? maxDiscountBdt)?  $default,) {final _that = this;
switch (_that) {
case _Coupon() when $default != null:
return $default(_that.code,_that.kind,_that.value,_that.minOrderBdt,_that.maxDiscountBdt);case _:
  return null;

}
}

}

/// @nodoc


class _Coupon implements Coupon {
  const _Coupon({required this.code, required this.kind, this.value = 0, this.minOrderBdt = 0, this.maxDiscountBdt});
  

@override final  String code;
@override final  CouponKind kind;
/// Percent for [CouponKind.percentOff], taka for [CouponKind.amountOff],
/// unused for free delivery.
@override@JsonKey() final  int value;
/// The subtotal needed before the code works.
@override@JsonKey() final  int minOrderBdt;
/// Most a percent-off code can take off.
@override final  int? maxDiscountBdt;

/// Create a copy of Coupon
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CouponCopyWith<_Coupon> get copyWith => __$CouponCopyWithImpl<_Coupon>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Coupon&&(identical(other.code, code) || other.code == code)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.value, value) || other.value == value)&&(identical(other.minOrderBdt, minOrderBdt) || other.minOrderBdt == minOrderBdt)&&(identical(other.maxDiscountBdt, maxDiscountBdt) || other.maxDiscountBdt == maxDiscountBdt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code,kind,value,minOrderBdt,maxDiscountBdt);
}

@override
String toString() {
    return 'Coupon(code: $code, kind: $kind, value: $value, minOrderBdt: $minOrderBdt, maxDiscountBdt: $maxDiscountBdt)';
}


}

/// @nodoc
abstract mixin class _$CouponCopyWith<$Res> implements $CouponCopyWith<$Res> {
  factory _$CouponCopyWith(_Coupon value, $Res Function(_Coupon) _then) = __$CouponCopyWithImpl;
@override @useResult
$Res call({
 String code, CouponKind kind, int value, int minOrderBdt, int? maxDiscountBdt
});




}
/// @nodoc
class __$CouponCopyWithImpl<$Res>
    implements _$CouponCopyWith<$Res> {
  __$CouponCopyWithImpl(this._self, this._then);

  final _Coupon _self;
  final $Res Function(_Coupon) _then;

/// Create a copy of Coupon
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? kind = null,Object? value = null,Object? minOrderBdt = null,Object? maxDiscountBdt = freezed,}) {
  return _then(_Coupon(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CouponKind,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,minOrderBdt: null == minOrderBdt ? _self.minOrderBdt : minOrderBdt // ignore: cast_nullable_to_non_nullable
as int,maxDiscountBdt: freezed == maxDiscountBdt ? _self.maxDiscountBdt : maxDiscountBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
