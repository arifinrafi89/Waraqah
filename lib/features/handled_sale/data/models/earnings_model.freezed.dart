// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'earnings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PayoutModel {

 int get amountBdt; DateTime get at;
/// Create a copy of PayoutModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutModelCopyWith<PayoutModel> get copyWith => _$PayoutModelCopyWithImpl<PayoutModel>(this as PayoutModel, _$identity);

  /// Serializes this PayoutModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PayoutModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutModel&&(identical(other.amountBdt, _this.amountBdt) || other.amountBdt == _this.amountBdt)&&(identical(other.at, _this.at) || other.at == _this.at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PayoutModel;
  return Object.hash(runtimeType,_this.amountBdt,_this.at);
}

@override
String toString() {
  final _this = this as PayoutModel;
  return 'PayoutModel(amountBdt: ${_this.amountBdt}, at: ${_this.at})';
}


}

/// @nodoc
abstract mixin class $PayoutModelCopyWith<$Res>  {
  factory $PayoutModelCopyWith(PayoutModel value, $Res Function(PayoutModel) _then) = _$PayoutModelCopyWithImpl;
@useResult
$Res call({
 int amountBdt, DateTime at
});




}
/// @nodoc
class _$PayoutModelCopyWithImpl<$Res>
    implements $PayoutModelCopyWith<$Res> {
  _$PayoutModelCopyWithImpl(this._self, this._then);

  final PayoutModel _self;
  final $Res Function(PayoutModel) _then;

/// Create a copy of PayoutModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amountBdt = null,Object? at = null,}) {
  return _then(PayoutModel(
amountBdt: null == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PayoutModel].
extension PayoutModelPatterns on PayoutModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutModel value)  $default,){
final _that = this;
switch (_that) {
case _PayoutModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutModel value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutModel() when $default != null:
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
case _PayoutModel() when $default != null:
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
case _PayoutModel():
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
case _PayoutModel() when $default != null:
return $default(_that.amountBdt,_that.at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PayoutModel implements PayoutModel {
  const _PayoutModel({required this.amountBdt, required this.at});
  factory _PayoutModel.fromJson(Map<String, dynamic> json) => _$PayoutModelFromJson(json);

@override final  int amountBdt;
@override final  DateTime at;

/// Create a copy of PayoutModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutModelCopyWith<_PayoutModel> get copyWith => __$PayoutModelCopyWithImpl<_PayoutModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PayoutModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutModel&&(identical(other.amountBdt, amountBdt) || other.amountBdt == amountBdt)&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,amountBdt,at);
}

@override
String toString() {
    return 'PayoutModel(amountBdt: $amountBdt, at: $at)';
}


}

/// @nodoc
abstract mixin class _$PayoutModelCopyWith<$Res> implements $PayoutModelCopyWith<$Res> {
  factory _$PayoutModelCopyWith(_PayoutModel value, $Res Function(_PayoutModel) _then) = __$PayoutModelCopyWithImpl;
@override @useResult
$Res call({
 int amountBdt, DateTime at
});




}
/// @nodoc
class __$PayoutModelCopyWithImpl<$Res>
    implements _$PayoutModelCopyWith<$Res> {
  __$PayoutModelCopyWithImpl(this._self, this._then);

  final _PayoutModel _self;
  final $Res Function(_PayoutModel) _then;

/// Create a copy of PayoutModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amountBdt = null,Object? at = null,}) {
  return _then(_PayoutModel(
amountBdt: null == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$EarningsModel {

 int get heldBdt; int get earnedBdt; int get paidOutBdt; List<PayoutModel> get payouts;
/// Create a copy of EarningsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EarningsModelCopyWith<EarningsModel> get copyWith => _$EarningsModelCopyWithImpl<EarningsModel>(this as EarningsModel, _$identity);

  /// Serializes this EarningsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EarningsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EarningsModel&&(identical(other.heldBdt, _this.heldBdt) || other.heldBdt == _this.heldBdt)&&(identical(other.earnedBdt, _this.earnedBdt) || other.earnedBdt == _this.earnedBdt)&&(identical(other.paidOutBdt, _this.paidOutBdt) || other.paidOutBdt == _this.paidOutBdt)&&const DeepCollectionEquality().equals(other.payouts, _this.payouts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EarningsModel;
  return Object.hash(runtimeType,_this.heldBdt,_this.earnedBdt,_this.paidOutBdt,const DeepCollectionEquality().hash(_this.payouts));
}

@override
String toString() {
  final _this = this as EarningsModel;
  return 'EarningsModel(heldBdt: ${_this.heldBdt}, earnedBdt: ${_this.earnedBdt}, paidOutBdt: ${_this.paidOutBdt}, payouts: ${_this.payouts})';
}


}

/// @nodoc
abstract mixin class $EarningsModelCopyWith<$Res>  {
  factory $EarningsModelCopyWith(EarningsModel value, $Res Function(EarningsModel) _then) = _$EarningsModelCopyWithImpl;
@useResult
$Res call({
 int heldBdt, int earnedBdt, int paidOutBdt, List<PayoutModel> payouts
});




}
/// @nodoc
class _$EarningsModelCopyWithImpl<$Res>
    implements $EarningsModelCopyWith<$Res> {
  _$EarningsModelCopyWithImpl(this._self, this._then);

  final EarningsModel _self;
  final $Res Function(EarningsModel) _then;

/// Create a copy of EarningsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? heldBdt = null,Object? earnedBdt = null,Object? paidOutBdt = null,Object? payouts = null,}) {
  return _then(EarningsModel(
heldBdt: null == heldBdt ? _self.heldBdt : heldBdt // ignore: cast_nullable_to_non_nullable
as int,earnedBdt: null == earnedBdt ? _self.earnedBdt : earnedBdt // ignore: cast_nullable_to_non_nullable
as int,paidOutBdt: null == paidOutBdt ? _self.paidOutBdt : paidOutBdt // ignore: cast_nullable_to_non_nullable
as int,payouts: null == payouts ? _self.payouts : payouts // ignore: cast_nullable_to_non_nullable
as List<PayoutModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [EarningsModel].
extension EarningsModelPatterns on EarningsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EarningsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EarningsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EarningsModel value)  $default,){
final _that = this;
switch (_that) {
case _EarningsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EarningsModel value)?  $default,){
final _that = this;
switch (_that) {
case _EarningsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int heldBdt,  int earnedBdt,  int paidOutBdt,  List<PayoutModel> payouts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EarningsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int heldBdt,  int earnedBdt,  int paidOutBdt,  List<PayoutModel> payouts)  $default,) {final _that = this;
switch (_that) {
case _EarningsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int heldBdt,  int earnedBdt,  int paidOutBdt,  List<PayoutModel> payouts)?  $default,) {final _that = this;
switch (_that) {
case _EarningsModel() when $default != null:
return $default(_that.heldBdt,_that.earnedBdt,_that.paidOutBdt,_that.payouts);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _EarningsModel implements EarningsModel {
  const _EarningsModel({required this.heldBdt, required this.earnedBdt, required this.paidOutBdt,  List<PayoutModel> payouts = const <PayoutModel>[]}): _payouts = payouts;
  factory _EarningsModel.fromJson(Map<String, dynamic> json) => _$EarningsModelFromJson(json);

@override final  int heldBdt;
@override final  int earnedBdt;
@override final  int paidOutBdt;
 final  List<PayoutModel> _payouts;
@override@JsonKey() List<PayoutModel> get payouts {
  if (_payouts is EqualUnmodifiableListView) return _payouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payouts);
}


/// Create a copy of EarningsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EarningsModelCopyWith<_EarningsModel> get copyWith => __$EarningsModelCopyWithImpl<_EarningsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EarningsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EarningsModel&&(identical(other.heldBdt, heldBdt) || other.heldBdt == heldBdt)&&(identical(other.earnedBdt, earnedBdt) || other.earnedBdt == earnedBdt)&&(identical(other.paidOutBdt, paidOutBdt) || other.paidOutBdt == paidOutBdt)&&const DeepCollectionEquality().equals(other.payouts, _payouts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,heldBdt,earnedBdt,paidOutBdt,const DeepCollectionEquality().hash(_payouts));
}

@override
String toString() {
    return 'EarningsModel(heldBdt: $heldBdt, earnedBdt: $earnedBdt, paidOutBdt: $paidOutBdt, payouts: $payouts)';
}


}

/// @nodoc
abstract mixin class _$EarningsModelCopyWith<$Res> implements $EarningsModelCopyWith<$Res> {
  factory _$EarningsModelCopyWith(_EarningsModel value, $Res Function(_EarningsModel) _then) = __$EarningsModelCopyWithImpl;
@override @useResult
$Res call({
 int heldBdt, int earnedBdt, int paidOutBdt, List<PayoutModel> payouts
});




}
/// @nodoc
class __$EarningsModelCopyWithImpl<$Res>
    implements _$EarningsModelCopyWith<$Res> {
  __$EarningsModelCopyWithImpl(this._self, this._then);

  final _EarningsModel _self;
  final $Res Function(_EarningsModel) _then;

/// Create a copy of EarningsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heldBdt = null,Object? earnedBdt = null,Object? paidOutBdt = null,Object? payouts = null,}) {
  return _then(_EarningsModel(
heldBdt: null == heldBdt ? _self.heldBdt : heldBdt // ignore: cast_nullable_to_non_nullable
as int,earnedBdt: null == earnedBdt ? _self.earnedBdt : earnedBdt // ignore: cast_nullable_to_non_nullable
as int,paidOutBdt: null == paidOutBdt ? _self.paidOutBdt : paidOutBdt // ignore: cast_nullable_to_non_nullable
as int,payouts: null == payouts ? _self._payouts : payouts // ignore: cast_nullable_to_non_nullable
as List<PayoutModel>,
  ));
}


}


/// @nodoc
mixin _$SaleDisputeModel {

 HandledSaleModel get sale; String get buyerName; String get sellerName;
/// Create a copy of SaleDisputeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleDisputeModelCopyWith<SaleDisputeModel> get copyWith => _$SaleDisputeModelCopyWithImpl<SaleDisputeModel>(this as SaleDisputeModel, _$identity);

  /// Serializes this SaleDisputeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SaleDisputeModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleDisputeModel&&(identical(other.sale, _this.sale) || other.sale == _this.sale)&&(identical(other.buyerName, _this.buyerName) || other.buyerName == _this.buyerName)&&(identical(other.sellerName, _this.sellerName) || other.sellerName == _this.sellerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SaleDisputeModel;
  return Object.hash(runtimeType,_this.sale,_this.buyerName,_this.sellerName);
}

@override
String toString() {
  final _this = this as SaleDisputeModel;
  return 'SaleDisputeModel(sale: ${_this.sale}, buyerName: ${_this.buyerName}, sellerName: ${_this.sellerName})';
}


}

/// @nodoc
abstract mixin class $SaleDisputeModelCopyWith<$Res>  {
  factory $SaleDisputeModelCopyWith(SaleDisputeModel value, $Res Function(SaleDisputeModel) _then) = _$SaleDisputeModelCopyWithImpl;
@useResult
$Res call({
 HandledSaleModel sale, String buyerName, String sellerName
});


$HandledSaleModelCopyWith<$Res> get sale;

}
/// @nodoc
class _$SaleDisputeModelCopyWithImpl<$Res>
    implements $SaleDisputeModelCopyWith<$Res> {
  _$SaleDisputeModelCopyWithImpl(this._self, this._then);

  final SaleDisputeModel _self;
  final $Res Function(SaleDisputeModel) _then;

/// Create a copy of SaleDisputeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sale = null,Object? buyerName = null,Object? sellerName = null,}) {
  return _then(SaleDisputeModel(
sale: null == sale ? _self.sale : sale // ignore: cast_nullable_to_non_nullable
as HandledSaleModel,buyerName: null == buyerName ? _self.buyerName : buyerName // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SaleDisputeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HandledSaleModelCopyWith<$Res> get sale {
  
  return $HandledSaleModelCopyWith<$Res>(_self.sale, (value) {
    return _then(_self.copyWith(sale: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleDisputeModel].
extension SaleDisputeModelPatterns on SaleDisputeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleDisputeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleDisputeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleDisputeModel value)  $default,){
final _that = this;
switch (_that) {
case _SaleDisputeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleDisputeModel value)?  $default,){
final _that = this;
switch (_that) {
case _SaleDisputeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HandledSaleModel sale,  String buyerName,  String sellerName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleDisputeModel() when $default != null:
return $default(_that.sale,_that.buyerName,_that.sellerName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HandledSaleModel sale,  String buyerName,  String sellerName)  $default,) {final _that = this;
switch (_that) {
case _SaleDisputeModel():
return $default(_that.sale,_that.buyerName,_that.sellerName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HandledSaleModel sale,  String buyerName,  String sellerName)?  $default,) {final _that = this;
switch (_that) {
case _SaleDisputeModel() when $default != null:
return $default(_that.sale,_that.buyerName,_that.sellerName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SaleDisputeModel implements SaleDisputeModel {
  const _SaleDisputeModel({required this.sale, required this.buyerName, required this.sellerName});
  factory _SaleDisputeModel.fromJson(Map<String, dynamic> json) => _$SaleDisputeModelFromJson(json);

@override final  HandledSaleModel sale;
@override final  String buyerName;
@override final  String sellerName;

/// Create a copy of SaleDisputeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleDisputeModelCopyWith<_SaleDisputeModel> get copyWith => __$SaleDisputeModelCopyWithImpl<_SaleDisputeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleDisputeModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleDisputeModel&&(identical(other.sale, sale) || other.sale == sale)&&(identical(other.buyerName, buyerName) || other.buyerName == buyerName)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sale,buyerName,sellerName);
}

@override
String toString() {
    return 'SaleDisputeModel(sale: $sale, buyerName: $buyerName, sellerName: $sellerName)';
}


}

/// @nodoc
abstract mixin class _$SaleDisputeModelCopyWith<$Res> implements $SaleDisputeModelCopyWith<$Res> {
  factory _$SaleDisputeModelCopyWith(_SaleDisputeModel value, $Res Function(_SaleDisputeModel) _then) = __$SaleDisputeModelCopyWithImpl;
@override @useResult
$Res call({
 HandledSaleModel sale, String buyerName, String sellerName
});


@override $HandledSaleModelCopyWith<$Res> get sale;

}
/// @nodoc
class __$SaleDisputeModelCopyWithImpl<$Res>
    implements _$SaleDisputeModelCopyWith<$Res> {
  __$SaleDisputeModelCopyWithImpl(this._self, this._then);

  final _SaleDisputeModel _self;
  final $Res Function(_SaleDisputeModel) _then;

/// Create a copy of SaleDisputeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sale = null,Object? buyerName = null,Object? sellerName = null,}) {
  return _then(_SaleDisputeModel(
sale: null == sale ? _self.sale : sale // ignore: cast_nullable_to_non_nullable
as HandledSaleModel,buyerName: null == buyerName ? _self.buyerName : buyerName // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SaleDisputeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HandledSaleModelCopyWith<$Res> get sale {
  
  return $HandledSaleModelCopyWith<$Res>(_self.sale, (value) {
    return _then(_self.copyWith(sale: value));
  });
}
}

// dart format on
