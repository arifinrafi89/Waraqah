// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {

 String get number; DateTime get placedAt; OrderStatus get status; List<OrderLineModel> get lines; List<StatusChangeModel> get history; String get addressLabel; String get addressLine; PaymentMethod get payment; int get subtotalBdt; int get deliveryFeeBdt; int get discountBdt; int get totalBdt; bool get needsDelivery; int get pointsUsed; int get pointsEarned; ReturnRequestModel? get returnRequest;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.placedAt, _this.placedAt) || other.placedAt == _this.placedAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&const DeepCollectionEquality().equals(other.history, _this.history)&&(identical(other.addressLabel, _this.addressLabel) || other.addressLabel == _this.addressLabel)&&(identical(other.addressLine, _this.addressLine) || other.addressLine == _this.addressLine)&&(identical(other.payment, _this.payment) || other.payment == _this.payment)&&(identical(other.subtotalBdt, _this.subtotalBdt) || other.subtotalBdt == _this.subtotalBdt)&&(identical(other.deliveryFeeBdt, _this.deliveryFeeBdt) || other.deliveryFeeBdt == _this.deliveryFeeBdt)&&(identical(other.discountBdt, _this.discountBdt) || other.discountBdt == _this.discountBdt)&&(identical(other.totalBdt, _this.totalBdt) || other.totalBdt == _this.totalBdt)&&(identical(other.needsDelivery, _this.needsDelivery) || other.needsDelivery == _this.needsDelivery)&&(identical(other.pointsUsed, _this.pointsUsed) || other.pointsUsed == _this.pointsUsed)&&(identical(other.pointsEarned, _this.pointsEarned) || other.pointsEarned == _this.pointsEarned)&&(identical(other.returnRequest, _this.returnRequest) || other.returnRequest == _this.returnRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderModel;
  return Object.hash(runtimeType,_this.number,_this.placedAt,_this.status,const DeepCollectionEquality().hash(_this.lines),const DeepCollectionEquality().hash(_this.history),_this.addressLabel,_this.addressLine,_this.payment,_this.subtotalBdt,_this.deliveryFeeBdt,_this.discountBdt,_this.totalBdt,_this.needsDelivery,_this.pointsUsed,_this.pointsEarned,_this.returnRequest);
}

@override
String toString() {
  final _this = this as OrderModel;
  return 'OrderModel(number: ${_this.number}, placedAt: ${_this.placedAt}, status: ${_this.status}, lines: ${_this.lines}, history: ${_this.history}, addressLabel: ${_this.addressLabel}, addressLine: ${_this.addressLine}, payment: ${_this.payment}, subtotalBdt: ${_this.subtotalBdt}, deliveryFeeBdt: ${_this.deliveryFeeBdt}, discountBdt: ${_this.discountBdt}, totalBdt: ${_this.totalBdt}, needsDelivery: ${_this.needsDelivery}, pointsUsed: ${_this.pointsUsed}, pointsEarned: ${_this.pointsEarned}, returnRequest: ${_this.returnRequest})';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 String number, DateTime placedAt, OrderStatus status, List<OrderLineModel> lines, List<StatusChangeModel> history, String addressLabel, String addressLine, PaymentMethod payment, int subtotalBdt, int deliveryFeeBdt, int discountBdt, int totalBdt, bool needsDelivery, int pointsUsed, int pointsEarned, ReturnRequestModel? returnRequest
});


$ReturnRequestModelCopyWith<$Res>? get returnRequest;

}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? placedAt = null,Object? status = null,Object? lines = null,Object? history = null,Object? addressLabel = null,Object? addressLine = null,Object? payment = null,Object? subtotalBdt = null,Object? deliveryFeeBdt = null,Object? discountBdt = null,Object? totalBdt = null,Object? needsDelivery = null,Object? pointsUsed = null,Object? pointsEarned = null,Object? returnRequest = freezed,}) {
  return _then(OrderModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLineModel>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<StatusChangeModel>,addressLabel: null == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,subtotalBdt: null == subtotalBdt ? _self.subtotalBdt : subtotalBdt // ignore: cast_nullable_to_non_nullable
as int,deliveryFeeBdt: null == deliveryFeeBdt ? _self.deliveryFeeBdt : deliveryFeeBdt // ignore: cast_nullable_to_non_nullable
as int,discountBdt: null == discountBdt ? _self.discountBdt : discountBdt // ignore: cast_nullable_to_non_nullable
as int,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,needsDelivery: null == needsDelivery ? _self.needsDelivery : needsDelivery // ignore: cast_nullable_to_non_nullable
as bool,pointsUsed: null == pointsUsed ? _self.pointsUsed : pointsUsed // ignore: cast_nullable_to_non_nullable
as int,pointsEarned: null == pointsEarned ? _self.pointsEarned : pointsEarned // ignore: cast_nullable_to_non_nullable
as int,returnRequest: freezed == returnRequest ? _self.returnRequest : returnRequest // ignore: cast_nullable_to_non_nullable
as ReturnRequestModel?,
  ));
}
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReturnRequestModelCopyWith<$Res>? get returnRequest {
    if (_self.returnRequest == null) {
    return null;
  }

  return $ReturnRequestModelCopyWith<$Res>(_self.returnRequest!, (value) {
    return _then(_self.copyWith(returnRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  DateTime placedAt,  OrderStatus status,  List<OrderLineModel> lines,  List<StatusChangeModel> history,  String addressLabel,  String addressLine,  PaymentMethod payment,  int subtotalBdt,  int deliveryFeeBdt,  int discountBdt,  int totalBdt,  bool needsDelivery,  int pointsUsed,  int pointsEarned,  ReturnRequestModel? returnRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.number,_that.placedAt,_that.status,_that.lines,_that.history,_that.addressLabel,_that.addressLine,_that.payment,_that.subtotalBdt,_that.deliveryFeeBdt,_that.discountBdt,_that.totalBdt,_that.needsDelivery,_that.pointsUsed,_that.pointsEarned,_that.returnRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  DateTime placedAt,  OrderStatus status,  List<OrderLineModel> lines,  List<StatusChangeModel> history,  String addressLabel,  String addressLine,  PaymentMethod payment,  int subtotalBdt,  int deliveryFeeBdt,  int discountBdt,  int totalBdt,  bool needsDelivery,  int pointsUsed,  int pointsEarned,  ReturnRequestModel? returnRequest)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.number,_that.placedAt,_that.status,_that.lines,_that.history,_that.addressLabel,_that.addressLine,_that.payment,_that.subtotalBdt,_that.deliveryFeeBdt,_that.discountBdt,_that.totalBdt,_that.needsDelivery,_that.pointsUsed,_that.pointsEarned,_that.returnRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  DateTime placedAt,  OrderStatus status,  List<OrderLineModel> lines,  List<StatusChangeModel> history,  String addressLabel,  String addressLine,  PaymentMethod payment,  int subtotalBdt,  int deliveryFeeBdt,  int discountBdt,  int totalBdt,  bool needsDelivery,  int pointsUsed,  int pointsEarned,  ReturnRequestModel? returnRequest)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.number,_that.placedAt,_that.status,_that.lines,_that.history,_that.addressLabel,_that.addressLine,_that.payment,_that.subtotalBdt,_that.deliveryFeeBdt,_that.discountBdt,_that.totalBdt,_that.needsDelivery,_that.pointsUsed,_that.pointsEarned,_that.returnRequest);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _OrderModel implements OrderModel {
  const _OrderModel({required this.number, required this.placedAt, required this.status, required  List<OrderLineModel> lines, required  List<StatusChangeModel> history, required this.addressLabel, required this.addressLine, required this.payment, required this.subtotalBdt, required this.deliveryFeeBdt, required this.discountBdt, required this.totalBdt, this.needsDelivery = true, this.pointsUsed = 0, this.pointsEarned = 0, this.returnRequest}): _lines = lines,_history = history;
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override final  String number;
@override final  DateTime placedAt;
@override final  OrderStatus status;
 final  List<OrderLineModel> _lines;
@override List<OrderLineModel> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

 final  List<StatusChangeModel> _history;
@override List<StatusChangeModel> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override final  String addressLabel;
@override final  String addressLine;
@override final  PaymentMethod payment;
@override final  int subtotalBdt;
@override final  int deliveryFeeBdt;
@override final  int discountBdt;
@override final  int totalBdt;
@override@JsonKey() final  bool needsDelivery;
@override@JsonKey() final  int pointsUsed;
@override@JsonKey() final  int pointsEarned;
@override final  ReturnRequestModel? returnRequest;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.number, number) || other.number == number)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.lines, _lines)&&const DeepCollectionEquality().equals(other.history, _history)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.subtotalBdt, subtotalBdt) || other.subtotalBdt == subtotalBdt)&&(identical(other.deliveryFeeBdt, deliveryFeeBdt) || other.deliveryFeeBdt == deliveryFeeBdt)&&(identical(other.discountBdt, discountBdt) || other.discountBdt == discountBdt)&&(identical(other.totalBdt, totalBdt) || other.totalBdt == totalBdt)&&(identical(other.needsDelivery, needsDelivery) || other.needsDelivery == needsDelivery)&&(identical(other.pointsUsed, pointsUsed) || other.pointsUsed == pointsUsed)&&(identical(other.pointsEarned, pointsEarned) || other.pointsEarned == pointsEarned)&&(identical(other.returnRequest, returnRequest) || other.returnRequest == returnRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,placedAt,status,const DeepCollectionEquality().hash(_lines),const DeepCollectionEquality().hash(_history),addressLabel,addressLine,payment,subtotalBdt,deliveryFeeBdt,discountBdt,totalBdt,needsDelivery,pointsUsed,pointsEarned,returnRequest);
}

@override
String toString() {
    return 'OrderModel(number: $number, placedAt: $placedAt, status: $status, lines: $lines, history: $history, addressLabel: $addressLabel, addressLine: $addressLine, payment: $payment, subtotalBdt: $subtotalBdt, deliveryFeeBdt: $deliveryFeeBdt, discountBdt: $discountBdt, totalBdt: $totalBdt, needsDelivery: $needsDelivery, pointsUsed: $pointsUsed, pointsEarned: $pointsEarned, returnRequest: $returnRequest)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 String number, DateTime placedAt, OrderStatus status, List<OrderLineModel> lines, List<StatusChangeModel> history, String addressLabel, String addressLine, PaymentMethod payment, int subtotalBdt, int deliveryFeeBdt, int discountBdt, int totalBdt, bool needsDelivery, int pointsUsed, int pointsEarned, ReturnRequestModel? returnRequest
});


@override $ReturnRequestModelCopyWith<$Res>? get returnRequest;

}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? placedAt = null,Object? status = null,Object? lines = null,Object? history = null,Object? addressLabel = null,Object? addressLine = null,Object? payment = null,Object? subtotalBdt = null,Object? deliveryFeeBdt = null,Object? discountBdt = null,Object? totalBdt = null,Object? needsDelivery = null,Object? pointsUsed = null,Object? pointsEarned = null,Object? returnRequest = freezed,}) {
  return _then(_OrderModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLineModel>,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<StatusChangeModel>,addressLabel: null == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,subtotalBdt: null == subtotalBdt ? _self.subtotalBdt : subtotalBdt // ignore: cast_nullable_to_non_nullable
as int,deliveryFeeBdt: null == deliveryFeeBdt ? _self.deliveryFeeBdt : deliveryFeeBdt // ignore: cast_nullable_to_non_nullable
as int,discountBdt: null == discountBdt ? _self.discountBdt : discountBdt // ignore: cast_nullable_to_non_nullable
as int,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,needsDelivery: null == needsDelivery ? _self.needsDelivery : needsDelivery // ignore: cast_nullable_to_non_nullable
as bool,pointsUsed: null == pointsUsed ? _self.pointsUsed : pointsUsed // ignore: cast_nullable_to_non_nullable
as int,pointsEarned: null == pointsEarned ? _self.pointsEarned : pointsEarned // ignore: cast_nullable_to_non_nullable
as int,returnRequest: freezed == returnRequest ? _self.returnRequest : returnRequest // ignore: cast_nullable_to_non_nullable
as ReturnRequestModel?,
  ));
}

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReturnRequestModelCopyWith<$Res>? get returnRequest {
    if (_self.returnRequest == null) {
    return null;
  }

  return $ReturnRequestModelCopyWith<$Res>(_self.returnRequest!, (value) {
    return _then(_self.copyWith(returnRequest: value));
  });
}
}

// dart format on
