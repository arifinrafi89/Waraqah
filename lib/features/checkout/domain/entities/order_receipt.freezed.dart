// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderReceipt {

/// "WQ-100231", said to support on the phone.
 String get number; int get totalBdt; int get itemCount; PaymentMethod get payment; bool get needsDelivery; bool get insideDhaka; bool get hasPreorders;
/// Create a copy of OrderReceipt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderReceiptCopyWith<OrderReceipt> get copyWith => _$OrderReceiptCopyWithImpl<OrderReceipt>(this as OrderReceipt, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OrderReceipt;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderReceipt&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.totalBdt, _this.totalBdt) || other.totalBdt == _this.totalBdt)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount)&&(identical(other.payment, _this.payment) || other.payment == _this.payment)&&(identical(other.needsDelivery, _this.needsDelivery) || other.needsDelivery == _this.needsDelivery)&&(identical(other.insideDhaka, _this.insideDhaka) || other.insideDhaka == _this.insideDhaka)&&(identical(other.hasPreorders, _this.hasPreorders) || other.hasPreorders == _this.hasPreorders));
}


@override
int get hashCode {
  final _this = this as OrderReceipt;
  return Object.hash(runtimeType,_this.number,_this.totalBdt,_this.itemCount,_this.payment,_this.needsDelivery,_this.insideDhaka,_this.hasPreorders);
}

@override
String toString() {
  final _this = this as OrderReceipt;
  return 'OrderReceipt(number: ${_this.number}, totalBdt: ${_this.totalBdt}, itemCount: ${_this.itemCount}, payment: ${_this.payment}, needsDelivery: ${_this.needsDelivery}, insideDhaka: ${_this.insideDhaka}, hasPreorders: ${_this.hasPreorders})';
}


}

/// @nodoc
abstract mixin class $OrderReceiptCopyWith<$Res>  {
  factory $OrderReceiptCopyWith(OrderReceipt value, $Res Function(OrderReceipt) _then) = _$OrderReceiptCopyWithImpl;
@useResult
$Res call({
 String number, int totalBdt, int itemCount, PaymentMethod payment, bool needsDelivery, bool insideDhaka, bool hasPreorders
});




}
/// @nodoc
class _$OrderReceiptCopyWithImpl<$Res>
    implements $OrderReceiptCopyWith<$Res> {
  _$OrderReceiptCopyWithImpl(this._self, this._then);

  final OrderReceipt _self;
  final $Res Function(OrderReceipt) _then;

/// Create a copy of OrderReceipt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? totalBdt = null,Object? itemCount = null,Object? payment = null,Object? needsDelivery = null,Object? insideDhaka = null,Object? hasPreorders = null,}) {
  return _then(OrderReceipt(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,needsDelivery: null == needsDelivery ? _self.needsDelivery : needsDelivery // ignore: cast_nullable_to_non_nullable
as bool,insideDhaka: null == insideDhaka ? _self.insideDhaka : insideDhaka // ignore: cast_nullable_to_non_nullable
as bool,hasPreorders: null == hasPreorders ? _self.hasPreorders : hasPreorders // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderReceipt].
extension OrderReceiptPatterns on OrderReceipt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderReceipt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderReceipt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderReceipt value)  $default,){
final _that = this;
switch (_that) {
case _OrderReceipt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderReceipt value)?  $default,){
final _that = this;
switch (_that) {
case _OrderReceipt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  int totalBdt,  int itemCount,  PaymentMethod payment,  bool needsDelivery,  bool insideDhaka,  bool hasPreorders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderReceipt() when $default != null:
return $default(_that.number,_that.totalBdt,_that.itemCount,_that.payment,_that.needsDelivery,_that.insideDhaka,_that.hasPreorders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  int totalBdt,  int itemCount,  PaymentMethod payment,  bool needsDelivery,  bool insideDhaka,  bool hasPreorders)  $default,) {final _that = this;
switch (_that) {
case _OrderReceipt():
return $default(_that.number,_that.totalBdt,_that.itemCount,_that.payment,_that.needsDelivery,_that.insideDhaka,_that.hasPreorders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  int totalBdt,  int itemCount,  PaymentMethod payment,  bool needsDelivery,  bool insideDhaka,  bool hasPreorders)?  $default,) {final _that = this;
switch (_that) {
case _OrderReceipt() when $default != null:
return $default(_that.number,_that.totalBdt,_that.itemCount,_that.payment,_that.needsDelivery,_that.insideDhaka,_that.hasPreorders);case _:
  return null;

}
}

}

/// @nodoc


class _OrderReceipt implements OrderReceipt {
  const _OrderReceipt({required this.number, required this.totalBdt, required this.itemCount, required this.payment, required this.needsDelivery, required this.insideDhaka, this.hasPreorders = false});
  

/// "WQ-100231", said to support on the phone.
@override final  String number;
@override final  int totalBdt;
@override final  int itemCount;
@override final  PaymentMethod payment;
@override final  bool needsDelivery;
@override final  bool insideDhaka;
@override@JsonKey() final  bool hasPreorders;

/// Create a copy of OrderReceipt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderReceiptCopyWith<_OrderReceipt> get copyWith => __$OrderReceiptCopyWithImpl<_OrderReceipt>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderReceipt&&(identical(other.number, number) || other.number == number)&&(identical(other.totalBdt, totalBdt) || other.totalBdt == totalBdt)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.needsDelivery, needsDelivery) || other.needsDelivery == needsDelivery)&&(identical(other.insideDhaka, insideDhaka) || other.insideDhaka == insideDhaka)&&(identical(other.hasPreorders, hasPreorders) || other.hasPreorders == hasPreorders));
}


@override
int get hashCode {
    return Object.hash(runtimeType,number,totalBdt,itemCount,payment,needsDelivery,insideDhaka,hasPreorders);
}

@override
String toString() {
    return 'OrderReceipt(number: $number, totalBdt: $totalBdt, itemCount: $itemCount, payment: $payment, needsDelivery: $needsDelivery, insideDhaka: $insideDhaka, hasPreorders: $hasPreorders)';
}


}

/// @nodoc
abstract mixin class _$OrderReceiptCopyWith<$Res> implements $OrderReceiptCopyWith<$Res> {
  factory _$OrderReceiptCopyWith(_OrderReceipt value, $Res Function(_OrderReceipt) _then) = __$OrderReceiptCopyWithImpl;
@override @useResult
$Res call({
 String number, int totalBdt, int itemCount, PaymentMethod payment, bool needsDelivery, bool insideDhaka, bool hasPreorders
});




}
/// @nodoc
class __$OrderReceiptCopyWithImpl<$Res>
    implements _$OrderReceiptCopyWith<$Res> {
  __$OrderReceiptCopyWithImpl(this._self, this._then);

  final _OrderReceipt _self;
  final $Res Function(_OrderReceipt) _then;

/// Create a copy of OrderReceipt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? totalBdt = null,Object? itemCount = null,Object? payment = null,Object? needsDelivery = null,Object? insideDhaka = null,Object? hasPreorders = null,}) {
  return _then(_OrderReceipt(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,needsDelivery: null == needsDelivery ? _self.needsDelivery : needsDelivery // ignore: cast_nullable_to_non_nullable
as bool,insideDhaka: null == insideDhaka ? _self.insideDhaka : insideDhaka // ignore: cast_nullable_to_non_nullable
as bool,hasPreorders: null == hasPreorders ? _self.hasPreorders : hasPreorders // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
