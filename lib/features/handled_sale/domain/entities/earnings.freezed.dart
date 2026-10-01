// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'earnings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Payout {

 int get amountBdt; DateTime get at;
/// Create a copy of Payout
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutCopyWith<Payout> get copyWith => _$PayoutCopyWithImpl<Payout>(this as Payout, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Payout;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payout&&(identical(other.amountBdt, _this.amountBdt) || other.amountBdt == _this.amountBdt)&&(identical(other.at, _this.at) || other.at == _this.at));
}


@override
int get hashCode {
  final _this = this as Payout;
  return Object.hash(runtimeType,_this.amountBdt,_this.at);
}

@override
String toString() {
  final _this = this as Payout;
  return 'Payout(amountBdt: ${_this.amountBdt}, at: ${_this.at})';
}


}

/// @nodoc
abstract mixin class $PayoutCopyWith<$Res>  {
  factory $PayoutCopyWith(Payout value, $Res Function(Payout) _then) = _$PayoutCopyWithImpl;
@useResult
$Res call({
 int amountBdt, DateTime at
});




}
/// @nodoc
class _$PayoutCopyWithImpl<$Res>
    implements $PayoutCopyWith<$Res> {
  _$PayoutCopyWithImpl(this._self, this._then);

  final Payout _self;
  final $Res Function(Payout) _then;

/// Create a copy of Payout
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amountBdt = null,Object? at = null,}) {
  return _then(Payout(
amountBdt: null == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Payout].
extension PayoutPatterns on Payout {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payout value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payout() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payout value)  $default,){
final _that = this;
switch (_that) {
case _Payout():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payout value)?  $default,){
final _that = this;
switch (_that) {
case _Payout() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int amountBdt,  DateTime at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payout() when $default != null:
return $default(_that.amountBdt,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int amountBdt,  DateTime at)  $default,) {final _that = this;
switch (_that) {
case _Payout():
return $default(_that.amountBdt,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int amountBdt,  DateTime at)?  $default,) {final _that = this;
switch (_that) {
case _Payout() when $default != null:
return $default(_that.amountBdt,_that.at);case _:
  return null;

}
}

}

/// @nodoc


class _Payout implements Payout {
  const _Payout({required this.amountBdt, required this.at});
  

@override final  int amountBdt;
@override final  DateTime at;

/// Create a copy of Payout
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutCopyWith<_Payout> get copyWith => __$PayoutCopyWithImpl<_Payout>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payout&&(identical(other.amountBdt, amountBdt) || other.amountBdt == amountBdt)&&(identical(other.at, at) || other.at == at));
}


@override
int get hashCode {
    return Object.hash(runtimeType,amountBdt,at);
}

@override
String toString() {
    return 'Payout(amountBdt: $amountBdt, at: $at)';
}


}

/// @nodoc
abstract mixin class _$PayoutCopyWith<$Res> implements $PayoutCopyWith<$Res> {
  factory _$PayoutCopyWith(_Payout value, $Res Function(_Payout) _then) = __$PayoutCopyWithImpl;
@override @useResult
$Res call({
 int amountBdt, DateTime at
});




}
/// @nodoc
class __$PayoutCopyWithImpl<$Res>
    implements _$PayoutCopyWith<$Res> {
  __$PayoutCopyWithImpl(this._self, this._then);

  final _Payout _self;
  final $Res Function(_Payout) _then;

/// Create a copy of Payout
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amountBdt = null,Object? at = null,}) {
  return _then(_Payout(
amountBdt: null == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$Earnings {

/// Waraqah holds it until buyers confirm.
 int get heldBdt;/// Released by buyers or moderators, all time.
 int get earnedBdt; int get paidOutBdt;/// Newest first.
 List<Payout> get payouts;
/// Create a copy of Earnings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EarningsCopyWith<Earnings> get copyWith => _$EarningsCopyWithImpl<Earnings>(this as Earnings, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Earnings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Earnings&&(identical(other.heldBdt, _this.heldBdt) || other.heldBdt == _this.heldBdt)&&(identical(other.earnedBdt, _this.earnedBdt) || other.earnedBdt == _this.earnedBdt)&&(identical(other.paidOutBdt, _this.paidOutBdt) || other.paidOutBdt == _this.paidOutBdt)&&const DeepCollectionEquality().equals(other.payouts, _this.payouts));
}


@override
int get hashCode {
  final _this = this as Earnings;
  return Object.hash(runtimeType,_this.heldBdt,_this.earnedBdt,_this.paidOutBdt,const DeepCollectionEquality().hash(_this.payouts));
}

@override
String toString() {
  final _this = this as Earnings;
  return 'Earnings(heldBdt: ${_this.heldBdt}, earnedBdt: ${_this.earnedBdt}, paidOutBdt: ${_this.paidOutBdt}, payouts: ${_this.payouts})';
}


}

/// @nodoc
abstract mixin class $EarningsCopyWith<$Res>  {
  factory $EarningsCopyWith(Earnings value, $Res Function(Earnings) _then) = _$EarningsCopyWithImpl;
@useResult
$Res call({
 int heldBdt, int earnedBdt, int paidOutBdt, List<Payout> payouts
});




}
/// @nodoc
class _$EarningsCopyWithImpl<$Res>
    implements $EarningsCopyWith<$Res> {
  _$EarningsCopyWithImpl(this._self, this._then);

  final Earnings _self;
  final $Res Function(Earnings) _then;

/// Create a copy of Earnings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? heldBdt = null,Object? earnedBdt = null,Object? paidOutBdt = null,Object? payouts = null,}) {
  return _then(Earnings(
heldBdt: null == heldBdt ? _self.heldBdt : heldBdt // ignore: cast_nullable_to_non_nullable
as int,earnedBdt: null == earnedBdt ? _self.earnedBdt : earnedBdt // ignore: cast_nullable_to_non_nullable
as int,paidOutBdt: null == paidOutBdt ? _self.paidOutBdt : paidOutBdt // ignore: cast_nullable_to_non_nullable
as int,payouts: null == payouts ? _self.payouts : payouts // ignore: cast_nullable_to_non_nullable
as List<Payout>,
  ));
}

}


/// Adds pattern-matching-related methods to [Earnings].
extension EarningsPatterns on Earnings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Earnings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Earnings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Earnings value)  $default,){
final _that = this;
switch (_that) {
case _Earnings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Earnings value)?  $default,){
final _that = this;
switch (_that) {
case _Earnings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int heldBdt,  int earnedBdt,  int paidOutBdt,  List<Payout> payouts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Earnings() when $default != null:
return $default(_that.heldBdt,_that.earnedBdt,_that.paidOutBdt,_that.payouts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int heldBdt,  int earnedBdt,  int paidOutBdt,  List<Payout> payouts)  $default,) {final _that = this;
switch (_that) {
case _Earnings():
return $default(_that.heldBdt,_that.earnedBdt,_that.paidOutBdt,_that.payouts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int heldBdt,  int earnedBdt,  int paidOutBdt,  List<Payout> payouts)?  $default,) {final _that = this;
switch (_that) {
case _Earnings() when $default != null:
return $default(_that.heldBdt,_that.earnedBdt,_that.paidOutBdt,_that.payouts);case _:
  return null;

}
}

}

/// @nodoc


class _Earnings implements Earnings {
  const _Earnings({required this.heldBdt, required this.earnedBdt, required this.paidOutBdt,  List<Payout> payouts = const <Payout>[]}): _payouts = payouts;
  

/// Waraqah holds it until buyers confirm.
@override final  int heldBdt;
/// Released by buyers or moderators, all time.
@override final  int earnedBdt;
@override final  int paidOutBdt;
/// Newest first.
 final  List<Payout> _payouts;
/// Newest first.
@override@JsonKey() List<Payout> get payouts {
  if (_payouts is EqualUnmodifiableListView) return _payouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payouts);
}


/// Create a copy of Earnings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EarningsCopyWith<_Earnings> get copyWith => __$EarningsCopyWithImpl<_Earnings>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Earnings&&(identical(other.heldBdt, heldBdt) || other.heldBdt == heldBdt)&&(identical(other.earnedBdt, earnedBdt) || other.earnedBdt == earnedBdt)&&(identical(other.paidOutBdt, paidOutBdt) || other.paidOutBdt == paidOutBdt)&&const DeepCollectionEquality().equals(other.payouts, _payouts));
}


@override
int get hashCode {
    return Object.hash(runtimeType,heldBdt,earnedBdt,paidOutBdt,const DeepCollectionEquality().hash(_payouts));
}

@override
String toString() {
    return 'Earnings(heldBdt: $heldBdt, earnedBdt: $earnedBdt, paidOutBdt: $paidOutBdt, payouts: $payouts)';
}


}

/// @nodoc
abstract mixin class _$EarningsCopyWith<$Res> implements $EarningsCopyWith<$Res> {
  factory _$EarningsCopyWith(_Earnings value, $Res Function(_Earnings) _then) = __$EarningsCopyWithImpl;
@override @useResult
$Res call({
 int heldBdt, int earnedBdt, int paidOutBdt, List<Payout> payouts
});




}
/// @nodoc
class __$EarningsCopyWithImpl<$Res>
    implements _$EarningsCopyWith<$Res> {
  __$EarningsCopyWithImpl(this._self, this._then);

  final _Earnings _self;
  final $Res Function(_Earnings) _then;

/// Create a copy of Earnings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heldBdt = null,Object? earnedBdt = null,Object? paidOutBdt = null,Object? payouts = null,}) {
  return _then(_Earnings(
heldBdt: null == heldBdt ? _self.heldBdt : heldBdt // ignore: cast_nullable_to_non_nullable
as int,earnedBdt: null == earnedBdt ? _self.earnedBdt : earnedBdt // ignore: cast_nullable_to_non_nullable
as int,paidOutBdt: null == paidOutBdt ? _self.paidOutBdt : paidOutBdt // ignore: cast_nullable_to_non_nullable
as int,payouts: null == payouts ? _self._payouts : payouts // ignore: cast_nullable_to_non_nullable
as List<Payout>,
  ));
}


}

// dart format on
