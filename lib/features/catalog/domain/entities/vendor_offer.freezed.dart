// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VendorOffer {

 String get vendor; int get priceBdt; BookFormat get format; int get deliveryDays; bool get inStock;
/// Create a copy of VendorOffer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VendorOfferCopyWith<VendorOffer> get copyWith => _$VendorOfferCopyWithImpl<VendorOffer>(this as VendorOffer, _$identity);

  /// Serializes this VendorOffer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VendorOffer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VendorOffer&&(identical(other.vendor, _this.vendor) || other.vendor == _this.vendor)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.format, _this.format) || other.format == _this.format)&&(identical(other.deliveryDays, _this.deliveryDays) || other.deliveryDays == _this.deliveryDays)&&(identical(other.inStock, _this.inStock) || other.inStock == _this.inStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VendorOffer;
  return Object.hash(runtimeType,_this.vendor,_this.priceBdt,_this.format,_this.deliveryDays,_this.inStock);
}

@override
String toString() {
  final _this = this as VendorOffer;
  return 'VendorOffer(vendor: ${_this.vendor}, priceBdt: ${_this.priceBdt}, format: ${_this.format}, deliveryDays: ${_this.deliveryDays}, inStock: ${_this.inStock})';
}


}

/// @nodoc
abstract mixin class $VendorOfferCopyWith<$Res>  {
  factory $VendorOfferCopyWith(VendorOffer value, $Res Function(VendorOffer) _then) = _$VendorOfferCopyWithImpl;
@useResult
$Res call({
 String vendor, int priceBdt, BookFormat format, int deliveryDays, bool inStock
});




}
/// @nodoc
class _$VendorOfferCopyWithImpl<$Res>
    implements $VendorOfferCopyWith<$Res> {
  _$VendorOfferCopyWithImpl(this._self, this._then);

  final VendorOffer _self;
  final $Res Function(VendorOffer) _then;

/// Create a copy of VendorOffer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vendor = null,Object? priceBdt = null,Object? format = null,Object? deliveryDays = null,Object? inStock = null,}) {
  return _then(VendorOffer(
vendor: null == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookFormat,deliveryDays: null == deliveryDays ? _self.deliveryDays : deliveryDays // ignore: cast_nullable_to_non_nullable
as int,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VendorOffer].
extension VendorOfferPatterns on VendorOffer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VendorOffer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VendorOffer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VendorOffer value)  $default,){
final _that = this;
switch (_that) {
case _VendorOffer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VendorOffer value)?  $default,){
final _that = this;
switch (_that) {
case _VendorOffer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String vendor,  int priceBdt,  BookFormat format,  int deliveryDays,  bool inStock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VendorOffer() when $default != null:
return $default(_that.vendor,_that.priceBdt,_that.format,_that.deliveryDays,_that.inStock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String vendor,  int priceBdt,  BookFormat format,  int deliveryDays,  bool inStock)  $default,) {final _that = this;
switch (_that) {
case _VendorOffer():
return $default(_that.vendor,_that.priceBdt,_that.format,_that.deliveryDays,_that.inStock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String vendor,  int priceBdt,  BookFormat format,  int deliveryDays,  bool inStock)?  $default,) {final _that = this;
switch (_that) {
case _VendorOffer() when $default != null:
return $default(_that.vendor,_that.priceBdt,_that.format,_that.deliveryDays,_that.inStock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VendorOffer implements VendorOffer {
  const _VendorOffer({required this.vendor, required this.priceBdt, this.format = BookFormat.paperback, this.deliveryDays = 3, this.inStock = true});
  factory _VendorOffer.fromJson(Map<String, dynamic> json) => _$VendorOfferFromJson(json);

@override final  String vendor;
@override final  int priceBdt;
@override@JsonKey() final  BookFormat format;
@override@JsonKey() final  int deliveryDays;
@override@JsonKey() final  bool inStock;

/// Create a copy of VendorOffer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VendorOfferCopyWith<_VendorOffer> get copyWith => __$VendorOfferCopyWithImpl<_VendorOffer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VendorOfferToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VendorOffer&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.format, format) || other.format == format)&&(identical(other.deliveryDays, deliveryDays) || other.deliveryDays == deliveryDays)&&(identical(other.inStock, inStock) || other.inStock == inStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,vendor,priceBdt,format,deliveryDays,inStock);
}

@override
String toString() {
    return 'VendorOffer(vendor: $vendor, priceBdt: $priceBdt, format: $format, deliveryDays: $deliveryDays, inStock: $inStock)';
}


}

/// @nodoc
abstract mixin class _$VendorOfferCopyWith<$Res> implements $VendorOfferCopyWith<$Res> {
  factory _$VendorOfferCopyWith(_VendorOffer value, $Res Function(_VendorOffer) _then) = __$VendorOfferCopyWithImpl;
@override @useResult
$Res call({
 String vendor, int priceBdt, BookFormat format, int deliveryDays, bool inStock
});




}
/// @nodoc
class __$VendorOfferCopyWithImpl<$Res>
    implements _$VendorOfferCopyWith<$Res> {
  __$VendorOfferCopyWithImpl(this._self, this._then);

  final _VendorOffer _self;
  final $Res Function(_VendorOffer) _then;

/// Create a copy of VendorOffer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vendor = null,Object? priceBdt = null,Object? format = null,Object? deliveryDays = null,Object? inStock = null,}) {
  return _then(_VendorOffer(
vendor: null == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookFormat,deliveryDays: null == deliveryDays ? _self.deliveryDays : deliveryDays // ignore: cast_nullable_to_non_nullable
as int,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
