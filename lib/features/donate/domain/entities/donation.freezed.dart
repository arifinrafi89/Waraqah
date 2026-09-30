// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DonationRequest {

 String get recipientId; String get bookId; int get quantity; PaymentMethod get payment; String get note;
/// Create a copy of DonationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DonationRequestCopyWith<DonationRequest> get copyWith => _$DonationRequestCopyWithImpl<DonationRequest>(this as DonationRequest, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DonationRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DonationRequest&&(identical(other.recipientId, _this.recipientId) || other.recipientId == _this.recipientId)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.payment, _this.payment) || other.payment == _this.payment)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as DonationRequest;
  return Object.hash(runtimeType,_this.recipientId,_this.bookId,_this.quantity,_this.payment,_this.note);
}

@override
String toString() {
  final _this = this as DonationRequest;
  return 'DonationRequest(recipientId: ${_this.recipientId}, bookId: ${_this.bookId}, quantity: ${_this.quantity}, payment: ${_this.payment}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $DonationRequestCopyWith<$Res>  {
  factory $DonationRequestCopyWith(DonationRequest value, $Res Function(DonationRequest) _then) = _$DonationRequestCopyWithImpl;
@useResult
$Res call({
 String recipientId, String bookId, int quantity, PaymentMethod payment, String note
});




}
/// @nodoc
class _$DonationRequestCopyWithImpl<$Res>
    implements $DonationRequestCopyWith<$Res> {
  _$DonationRequestCopyWithImpl(this._self, this._then);

  final DonationRequest _self;
  final $Res Function(DonationRequest) _then;

/// Create a copy of DonationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipientId = null,Object? bookId = null,Object? quantity = null,Object? payment = null,Object? note = null,}) {
  return _then(DonationRequest(
recipientId: null == recipientId ? _self.recipientId : recipientId // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DonationRequest].
extension DonationRequestPatterns on DonationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DonationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DonationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DonationRequest value)  $default,){
final _that = this;
switch (_that) {
case _DonationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DonationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DonationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String recipientId,  String bookId,  int quantity,  PaymentMethod payment,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DonationRequest() when $default != null:
return $default(_that.recipientId,_that.bookId,_that.quantity,_that.payment,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String recipientId,  String bookId,  int quantity,  PaymentMethod payment,  String note)  $default,) {final _that = this;
switch (_that) {
case _DonationRequest():
return $default(_that.recipientId,_that.bookId,_that.quantity,_that.payment,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String recipientId,  String bookId,  int quantity,  PaymentMethod payment,  String note)?  $default,) {final _that = this;
switch (_that) {
case _DonationRequest() when $default != null:
return $default(_that.recipientId,_that.bookId,_that.quantity,_that.payment,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _DonationRequest implements DonationRequest {
  const _DonationRequest({required this.recipientId, required this.bookId, required this.quantity, required this.payment, this.note = ''});
  

@override final  String recipientId;
@override final  String bookId;
@override final  int quantity;
@override final  PaymentMethod payment;
@override@JsonKey() final  String note;

/// Create a copy of DonationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DonationRequestCopyWith<_DonationRequest> get copyWith => __$DonationRequestCopyWithImpl<_DonationRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DonationRequest&&(identical(other.recipientId, recipientId) || other.recipientId == recipientId)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,recipientId,bookId,quantity,payment,note);
}

@override
String toString() {
    return 'DonationRequest(recipientId: $recipientId, bookId: $bookId, quantity: $quantity, payment: $payment, note: $note)';
}


}

/// @nodoc
abstract mixin class _$DonationRequestCopyWith<$Res> implements $DonationRequestCopyWith<$Res> {
  factory _$DonationRequestCopyWith(_DonationRequest value, $Res Function(_DonationRequest) _then) = __$DonationRequestCopyWithImpl;
@override @useResult
$Res call({
 String recipientId, String bookId, int quantity, PaymentMethod payment, String note
});




}
/// @nodoc
class __$DonationRequestCopyWithImpl<$Res>
    implements _$DonationRequestCopyWith<$Res> {
  __$DonationRequestCopyWithImpl(this._self, this._then);

  final _DonationRequest _self;
  final $Res Function(_DonationRequest) _then;

/// Create a copy of DonationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipientId = null,Object? bookId = null,Object? quantity = null,Object? payment = null,Object? note = null,}) {
  return _then(_DonationRequest(
recipientId: null == recipientId ? _self.recipientId : recipientId // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Donation {

/// "WQ-100231", tracked in My orders.
 String get orderNumber; int get totalBdt;
/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DonationCopyWith<Donation> get copyWith => _$DonationCopyWithImpl<Donation>(this as Donation, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Donation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Donation&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.totalBdt, _this.totalBdt) || other.totalBdt == _this.totalBdt));
}


@override
int get hashCode {
  final _this = this as Donation;
  return Object.hash(runtimeType,_this.orderNumber,_this.totalBdt);
}

@override
String toString() {
  final _this = this as Donation;
  return 'Donation(orderNumber: ${_this.orderNumber}, totalBdt: ${_this.totalBdt})';
}


}

/// @nodoc
abstract mixin class $DonationCopyWith<$Res>  {
  factory $DonationCopyWith(Donation value, $Res Function(Donation) _then) = _$DonationCopyWithImpl;
@useResult
$Res call({
 String orderNumber, int totalBdt
});




}
/// @nodoc
class _$DonationCopyWithImpl<$Res>
    implements $DonationCopyWith<$Res> {
  _$DonationCopyWithImpl(this._self, this._then);

  final Donation _self;
  final $Res Function(Donation) _then;

/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderNumber = null,Object? totalBdt = null,}) {
  return _then(Donation(
orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Donation].
extension DonationPatterns on Donation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Donation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Donation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Donation value)  $default,){
final _that = this;
switch (_that) {
case _Donation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Donation value)?  $default,){
final _that = this;
switch (_that) {
case _Donation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderNumber,  int totalBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Donation() when $default != null:
return $default(_that.orderNumber,_that.totalBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderNumber,  int totalBdt)  $default,) {final _that = this;
switch (_that) {
case _Donation():
return $default(_that.orderNumber,_that.totalBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderNumber,  int totalBdt)?  $default,) {final _that = this;
switch (_that) {
case _Donation() when $default != null:
return $default(_that.orderNumber,_that.totalBdt);case _:
  return null;

}
}

}

/// @nodoc


class _Donation implements Donation {
  const _Donation({required this.orderNumber, required this.totalBdt});
  

/// "WQ-100231", tracked in My orders.
@override final  String orderNumber;
@override final  int totalBdt;

/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DonationCopyWith<_Donation> get copyWith => __$DonationCopyWithImpl<_Donation>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Donation&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.totalBdt, totalBdt) || other.totalBdt == totalBdt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,orderNumber,totalBdt);
}

@override
String toString() {
    return 'Donation(orderNumber: $orderNumber, totalBdt: $totalBdt)';
}


}

/// @nodoc
abstract mixin class _$DonationCopyWith<$Res> implements $DonationCopyWith<$Res> {
  factory _$DonationCopyWith(_Donation value, $Res Function(_Donation) _then) = __$DonationCopyWithImpl;
@override @useResult
$Res call({
 String orderNumber, int totalBdt
});




}
/// @nodoc
class __$DonationCopyWithImpl<$Res>
    implements _$DonationCopyWith<$Res> {
  __$DonationCopyWithImpl(this._self, this._then);

  final _Donation _self;
  final $Res Function(_Donation) _then;

/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderNumber = null,Object? totalBdt = null,}) {
  return _then(_Donation(
orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
