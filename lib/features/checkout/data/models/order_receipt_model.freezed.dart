// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_receipt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderReceiptModel {

 String get number; int get totalBdt; int get itemCount; PaymentMethod get payment; bool get needsDelivery; bool get insideDhaka; bool get hasPreorders; int get pointsEarned;/// Who the order is a gift for, if it is one.
 String? get giftFor; int get walletUsedBdt;
/// Create a copy of OrderReceiptModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderReceiptModelCopyWith<OrderReceiptModel> get copyWith => _$OrderReceiptModelCopyWithImpl<OrderReceiptModel>(this as OrderReceiptModel, _$identity);

  /// Serializes this OrderReceiptModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderReceiptModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderReceiptModel&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.totalBdt, _this.totalBdt) || other.totalBdt == _this.totalBdt)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount)&&(identical(other.payment, _this.payment) || other.payment == _this.payment)&&(identical(other.needsDelivery, _this.needsDelivery) || other.needsDelivery == _this.needsDelivery)&&(identical(other.insideDhaka, _this.insideDhaka) || other.insideDhaka == _this.insideDhaka)&&(identical(other.hasPreorders, _this.hasPreorders) || other.hasPreorders == _this.hasPreorders)&&(identical(other.pointsEarned, _this.pointsEarned) || other.pointsEarned == _this.pointsEarned)&&(identical(other.giftFor, _this.giftFor) || other.giftFor == _this.giftFor)&&(identical(other.walletUsedBdt, _this.walletUsedBdt) || other.walletUsedBdt == _this.walletUsedBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderReceiptModel;
  return Object.hash(runtimeType,_this.number,_this.totalBdt,_this.itemCount,_this.payment,_this.needsDelivery,_this.insideDhaka,_this.hasPreorders,_this.pointsEarned,_this.giftFor,_this.walletUsedBdt);
}

@override
String toString() {
  final _this = this as OrderReceiptModel;
  return 'OrderReceiptModel(number: ${_this.number}, totalBdt: ${_this.totalBdt}, itemCount: ${_this.itemCount}, payment: ${_this.payment}, needsDelivery: ${_this.needsDelivery}, insideDhaka: ${_this.insideDhaka}, hasPreorders: ${_this.hasPreorders}, pointsEarned: ${_this.pointsEarned}, giftFor: ${_this.giftFor}, walletUsedBdt: ${_this.walletUsedBdt})';
}


}

/// @nodoc
abstract mixin class $OrderReceiptModelCopyWith<$Res>  {
  factory $OrderReceiptModelCopyWith(OrderReceiptModel value, $Res Function(OrderReceiptModel) _then) = _$OrderReceiptModelCopyWithImpl;
@useResult
$Res call({
 String number, int totalBdt, int itemCount, PaymentMethod payment, bool needsDelivery, bool insideDhaka, bool hasPreorders, int pointsEarned, String? giftFor, int walletUsedBdt
});




}
/// @nodoc
class _$OrderReceiptModelCopyWithImpl<$Res>
    implements $OrderReceiptModelCopyWith<$Res> {
  _$OrderReceiptModelCopyWithImpl(this._self, this._then);

  final OrderReceiptModel _self;
  final $Res Function(OrderReceiptModel) _then;

/// Create a copy of OrderReceiptModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? totalBdt = null,Object? itemCount = null,Object? payment = null,Object? needsDelivery = null,Object? insideDhaka = null,Object? hasPreorders = null,Object? pointsEarned = null,Object? giftFor = freezed,Object? walletUsedBdt = null,}) {
  return _then(OrderReceiptModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,needsDelivery: null == needsDelivery ? _self.needsDelivery : needsDelivery // ignore: cast_nullable_to_non_nullable
as bool,insideDhaka: null == insideDhaka ? _self.insideDhaka : insideDhaka // ignore: cast_nullable_to_non_nullable
as bool,hasPreorders: null == hasPreorders ? _self.hasPreorders : hasPreorders // ignore: cast_nullable_to_non_nullable
as bool,pointsEarned: null == pointsEarned ? _self.pointsEarned : pointsEarned // ignore: cast_nullable_to_non_nullable
as int,giftFor: freezed == giftFor ? _self.giftFor : giftFor // ignore: cast_nullable_to_non_nullable
as String?,walletUsedBdt: null == walletUsedBdt ? _self.walletUsedBdt : walletUsedBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderReceiptModel].
extension OrderReceiptModelPatterns on OrderReceiptModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderReceiptModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderReceiptModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderReceiptModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderReceiptModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderReceiptModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderReceiptModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  int totalBdt,  int itemCount,  PaymentMethod payment,  bool needsDelivery,  bool insideDhaka,  bool hasPreorders,  int pointsEarned,  String? giftFor,  int walletUsedBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderReceiptModel() when $default != null:
return $default(_that.number,_that.totalBdt,_that.itemCount,_that.payment,_that.needsDelivery,_that.insideDhaka,_that.hasPreorders,_that.pointsEarned,_that.giftFor,_that.walletUsedBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  int totalBdt,  int itemCount,  PaymentMethod payment,  bool needsDelivery,  bool insideDhaka,  bool hasPreorders,  int pointsEarned,  String? giftFor,  int walletUsedBdt)  $default,) {final _that = this;
switch (_that) {
case _OrderReceiptModel():
return $default(_that.number,_that.totalBdt,_that.itemCount,_that.payment,_that.needsDelivery,_that.insideDhaka,_that.hasPreorders,_that.pointsEarned,_that.giftFor,_that.walletUsedBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  int totalBdt,  int itemCount,  PaymentMethod payment,  bool needsDelivery,  bool insideDhaka,  bool hasPreorders,  int pointsEarned,  String? giftFor,  int walletUsedBdt)?  $default,) {final _that = this;
switch (_that) {
case _OrderReceiptModel() when $default != null:
return $default(_that.number,_that.totalBdt,_that.itemCount,_that.payment,_that.needsDelivery,_that.insideDhaka,_that.hasPreorders,_that.pointsEarned,_that.giftFor,_that.walletUsedBdt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderReceiptModel implements OrderReceiptModel {
  const _OrderReceiptModel({required this.number, required this.totalBdt, required this.itemCount, required this.payment, required this.needsDelivery, required this.insideDhaka, this.hasPreorders = false, this.pointsEarned = 0, this.giftFor, this.walletUsedBdt = 0});
  factory _OrderReceiptModel.fromJson(Map<String, dynamic> json) => _$OrderReceiptModelFromJson(json);

@override final  String number;
@override final  int totalBdt;
@override final  int itemCount;
@override final  PaymentMethod payment;
@override final  bool needsDelivery;
@override final  bool insideDhaka;
@override@JsonKey() final  bool hasPreorders;
@override@JsonKey() final  int pointsEarned;
/// Who the order is a gift for, if it is one.
@override final  String? giftFor;
@override@JsonKey() final  int walletUsedBdt;

/// Create a copy of OrderReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderReceiptModelCopyWith<_OrderReceiptModel> get copyWith => __$OrderReceiptModelCopyWithImpl<_OrderReceiptModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderReceiptModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderReceiptModel&&(identical(other.number, number) || other.number == number)&&(identical(other.totalBdt, totalBdt) || other.totalBdt == totalBdt)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.needsDelivery, needsDelivery) || other.needsDelivery == needsDelivery)&&(identical(other.insideDhaka, insideDhaka) || other.insideDhaka == insideDhaka)&&(identical(other.hasPreorders, hasPreorders) || other.hasPreorders == hasPreorders)&&(identical(other.pointsEarned, pointsEarned) || other.pointsEarned == pointsEarned)&&(identical(other.giftFor, giftFor) || other.giftFor == giftFor)&&(identical(other.walletUsedBdt, walletUsedBdt) || other.walletUsedBdt == walletUsedBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,totalBdt,itemCount,payment,needsDelivery,insideDhaka,hasPreorders,pointsEarned,giftFor,walletUsedBdt);
}

@override
String toString() {
    return 'OrderReceiptModel(number: $number, totalBdt: $totalBdt, itemCount: $itemCount, payment: $payment, needsDelivery: $needsDelivery, insideDhaka: $insideDhaka, hasPreorders: $hasPreorders, pointsEarned: $pointsEarned, giftFor: $giftFor, walletUsedBdt: $walletUsedBdt)';
}


}

/// @nodoc
abstract mixin class _$OrderReceiptModelCopyWith<$Res> implements $OrderReceiptModelCopyWith<$Res> {
  factory _$OrderReceiptModelCopyWith(_OrderReceiptModel value, $Res Function(_OrderReceiptModel) _then) = __$OrderReceiptModelCopyWithImpl;
@override @useResult
$Res call({
 String number, int totalBdt, int itemCount, PaymentMethod payment, bool needsDelivery, bool insideDhaka, bool hasPreorders, int pointsEarned, String? giftFor, int walletUsedBdt
});




}
/// @nodoc
class __$OrderReceiptModelCopyWithImpl<$Res>
    implements _$OrderReceiptModelCopyWith<$Res> {
  __$OrderReceiptModelCopyWithImpl(this._self, this._then);

  final _OrderReceiptModel _self;
  final $Res Function(_OrderReceiptModel) _then;

/// Create a copy of OrderReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? totalBdt = null,Object? itemCount = null,Object? payment = null,Object? needsDelivery = null,Object? insideDhaka = null,Object? hasPreorders = null,Object? pointsEarned = null,Object? giftFor = freezed,Object? walletUsedBdt = null,}) {
  return _then(_OrderReceiptModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,needsDelivery: null == needsDelivery ? _self.needsDelivery : needsDelivery // ignore: cast_nullable_to_non_nullable
as bool,insideDhaka: null == insideDhaka ? _self.insideDhaka : insideDhaka // ignore: cast_nullable_to_non_nullable
as bool,hasPreorders: null == hasPreorders ? _self.hasPreorders : hasPreorders // ignore: cast_nullable_to_non_nullable
as bool,pointsEarned: null == pointsEarned ? _self.pointsEarned : pointsEarned // ignore: cast_nullable_to_non_nullable
as int,giftFor: freezed == giftFor ? _self.giftFor : giftFor // ignore: cast_nullable_to_non_nullable
as String?,walletUsedBdt: null == walletUsedBdt ? _self.walletUsedBdt : walletUsedBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
