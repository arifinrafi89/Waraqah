// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_dispute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SaleDispute {

 HandledSale get sale; String get buyerName; String get sellerName;
/// Create a copy of SaleDispute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleDisputeCopyWith<SaleDispute> get copyWith => _$SaleDisputeCopyWithImpl<SaleDispute>(this as SaleDispute, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SaleDispute;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleDispute&&(identical(other.sale, _this.sale) || other.sale == _this.sale)&&(identical(other.buyerName, _this.buyerName) || other.buyerName == _this.buyerName)&&(identical(other.sellerName, _this.sellerName) || other.sellerName == _this.sellerName));
}


@override
int get hashCode {
  final _this = this as SaleDispute;
  return Object.hash(runtimeType,_this.sale,_this.buyerName,_this.sellerName);
}

@override
String toString() {
  final _this = this as SaleDispute;
  return 'SaleDispute(sale: ${_this.sale}, buyerName: ${_this.buyerName}, sellerName: ${_this.sellerName})';
}


}

/// @nodoc
abstract mixin class $SaleDisputeCopyWith<$Res>  {
  factory $SaleDisputeCopyWith(SaleDispute value, $Res Function(SaleDispute) _then) = _$SaleDisputeCopyWithImpl;
@useResult
$Res call({
 HandledSale sale, String buyerName, String sellerName
});


$HandledSaleCopyWith<$Res> get sale;

}
/// @nodoc
class _$SaleDisputeCopyWithImpl<$Res>
    implements $SaleDisputeCopyWith<$Res> {
  _$SaleDisputeCopyWithImpl(this._self, this._then);

  final SaleDispute _self;
  final $Res Function(SaleDispute) _then;

/// Create a copy of SaleDispute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sale = null,Object? buyerName = null,Object? sellerName = null,}) {
  return _then(SaleDispute(
sale: null == sale ? _self.sale : sale // ignore: cast_nullable_to_non_nullable
as HandledSale,buyerName: null == buyerName ? _self.buyerName : buyerName // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SaleDispute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HandledSaleCopyWith<$Res> get sale {
  
  return $HandledSaleCopyWith<$Res>(_self.sale, (value) {
    return _then(_self.copyWith(sale: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleDispute].
extension SaleDisputePatterns on SaleDispute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleDispute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleDispute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleDispute value)  $default,){
final _that = this;
switch (_that) {
case _SaleDispute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleDispute value)?  $default,){
final _that = this;
switch (_that) {
case _SaleDispute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HandledSale sale,  String buyerName,  String sellerName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleDispute() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HandledSale sale,  String buyerName,  String sellerName)  $default,) {final _that = this;
switch (_that) {
case _SaleDispute():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HandledSale sale,  String buyerName,  String sellerName)?  $default,) {final _that = this;
switch (_that) {
case _SaleDispute() when $default != null:
return $default(_that.sale,_that.buyerName,_that.sellerName);case _:
  return null;

}
}

}

/// @nodoc


class _SaleDispute implements SaleDispute {
  const _SaleDispute({required this.sale, required this.buyerName, required this.sellerName});
  

@override final  HandledSale sale;
@override final  String buyerName;
@override final  String sellerName;

/// Create a copy of SaleDispute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleDisputeCopyWith<_SaleDispute> get copyWith => __$SaleDisputeCopyWithImpl<_SaleDispute>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleDispute&&(identical(other.sale, sale) || other.sale == sale)&&(identical(other.buyerName, buyerName) || other.buyerName == buyerName)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sale,buyerName,sellerName);
}

@override
String toString() {
    return 'SaleDispute(sale: $sale, buyerName: $buyerName, sellerName: $sellerName)';
}


}

/// @nodoc
abstract mixin class _$SaleDisputeCopyWith<$Res> implements $SaleDisputeCopyWith<$Res> {
  factory _$SaleDisputeCopyWith(_SaleDispute value, $Res Function(_SaleDispute) _then) = __$SaleDisputeCopyWithImpl;
@override @useResult
$Res call({
 HandledSale sale, String buyerName, String sellerName
});


@override $HandledSaleCopyWith<$Res> get sale;

}
/// @nodoc
class __$SaleDisputeCopyWithImpl<$Res>
    implements _$SaleDisputeCopyWith<$Res> {
  __$SaleDisputeCopyWithImpl(this._self, this._then);

  final _SaleDispute _self;
  final $Res Function(_SaleDispute) _then;

/// Create a copy of SaleDispute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sale = null,Object? buyerName = null,Object? sellerName = null,}) {
  return _then(_SaleDispute(
sale: null == sale ? _self.sale : sale // ignore: cast_nullable_to_non_nullable
as HandledSale,buyerName: null == buyerName ? _self.buyerName : buyerName // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SaleDispute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HandledSaleCopyWith<$Res> get sale {
  
  return $HandledSaleCopyWith<$Res>(_self.sale, (value) {
    return _then(_self.copyWith(sale: value));
  });
}
}

// dart format on
