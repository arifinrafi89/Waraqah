// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OfferItem {

 String get bookId; String get editionId; String get title;/// The Edition's usual price.
 int get regularPriceBdt;/// The flash-sale price; the same as regular outside a flash sale.
 int get priceBdt; int get coverSeed;
/// Create a copy of OfferItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferItemCopyWith<OfferItem> get copyWith => _$OfferItemCopyWithImpl<OfferItem>(this as OfferItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OfferItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferItem&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.editionId, _this.editionId) || other.editionId == _this.editionId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.regularPriceBdt, _this.regularPriceBdt) || other.regularPriceBdt == _this.regularPriceBdt)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed));
}


@override
int get hashCode {
  final _this = this as OfferItem;
  return Object.hash(runtimeType,_this.bookId,_this.editionId,_this.title,_this.regularPriceBdt,_this.priceBdt,_this.coverSeed);
}

@override
String toString() {
  final _this = this as OfferItem;
  return 'OfferItem(bookId: ${_this.bookId}, editionId: ${_this.editionId}, title: ${_this.title}, regularPriceBdt: ${_this.regularPriceBdt}, priceBdt: ${_this.priceBdt}, coverSeed: ${_this.coverSeed})';
}


}

/// @nodoc
abstract mixin class $OfferItemCopyWith<$Res>  {
  factory $OfferItemCopyWith(OfferItem value, $Res Function(OfferItem) _then) = _$OfferItemCopyWithImpl;
@useResult
$Res call({
 String bookId, String editionId, String title, int regularPriceBdt, int priceBdt, int coverSeed
});




}
/// @nodoc
class _$OfferItemCopyWithImpl<$Res>
    implements $OfferItemCopyWith<$Res> {
  _$OfferItemCopyWithImpl(this._self, this._then);

  final OfferItem _self;
  final $Res Function(OfferItem) _then;

/// Create a copy of OfferItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? editionId = null,Object? title = null,Object? regularPriceBdt = null,Object? priceBdt = null,Object? coverSeed = null,}) {
  return _then(OfferItem(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,editionId: null == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,regularPriceBdt: null == regularPriceBdt ? _self.regularPriceBdt : regularPriceBdt // ignore: cast_nullable_to_non_nullable
as int,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferItem].
extension OfferItemPatterns on OfferItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferItem value)  $default,){
final _that = this;
switch (_that) {
case _OfferItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferItem value)?  $default,){
final _that = this;
switch (_that) {
case _OfferItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookId,  String editionId,  String title,  int regularPriceBdt,  int priceBdt,  int coverSeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferItem() when $default != null:
return $default(_that.bookId,_that.editionId,_that.title,_that.regularPriceBdt,_that.priceBdt,_that.coverSeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookId,  String editionId,  String title,  int regularPriceBdt,  int priceBdt,  int coverSeed)  $default,) {final _that = this;
switch (_that) {
case _OfferItem():
return $default(_that.bookId,_that.editionId,_that.title,_that.regularPriceBdt,_that.priceBdt,_that.coverSeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookId,  String editionId,  String title,  int regularPriceBdt,  int priceBdt,  int coverSeed)?  $default,) {final _that = this;
switch (_that) {
case _OfferItem() when $default != null:
return $default(_that.bookId,_that.editionId,_that.title,_that.regularPriceBdt,_that.priceBdt,_that.coverSeed);case _:
  return null;

}
}

}

/// @nodoc


class _OfferItem implements OfferItem {
  const _OfferItem({required this.bookId, required this.editionId, required this.title, required this.regularPriceBdt, required this.priceBdt, this.coverSeed = 0});
  

@override final  String bookId;
@override final  String editionId;
@override final  String title;
/// The Edition's usual price.
@override final  int regularPriceBdt;
/// The flash-sale price; the same as regular outside a flash sale.
@override final  int priceBdt;
@override@JsonKey() final  int coverSeed;

/// Create a copy of OfferItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferItemCopyWith<_OfferItem> get copyWith => __$OfferItemCopyWithImpl<_OfferItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferItem&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.editionId, editionId) || other.editionId == editionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.regularPriceBdt, regularPriceBdt) || other.regularPriceBdt == regularPriceBdt)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,bookId,editionId,title,regularPriceBdt,priceBdt,coverSeed);
}

@override
String toString() {
    return 'OfferItem(bookId: $bookId, editionId: $editionId, title: $title, regularPriceBdt: $regularPriceBdt, priceBdt: $priceBdt, coverSeed: $coverSeed)';
}


}

/// @nodoc
abstract mixin class _$OfferItemCopyWith<$Res> implements $OfferItemCopyWith<$Res> {
  factory _$OfferItemCopyWith(_OfferItem value, $Res Function(_OfferItem) _then) = __$OfferItemCopyWithImpl;
@override @useResult
$Res call({
 String bookId, String editionId, String title, int regularPriceBdt, int priceBdt, int coverSeed
});




}
/// @nodoc
class __$OfferItemCopyWithImpl<$Res>
    implements _$OfferItemCopyWith<$Res> {
  __$OfferItemCopyWithImpl(this._self, this._then);

  final _OfferItem _self;
  final $Res Function(_OfferItem) _then;

/// Create a copy of OfferItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? editionId = null,Object? title = null,Object? regularPriceBdt = null,Object? priceBdt = null,Object? coverSeed = null,}) {
  return _then(_OfferItem(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,editionId: null == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,regularPriceBdt: null == regularPriceBdt ? _self.regularPriceBdt : regularPriceBdt // ignore: cast_nullable_to_non_nullable
as int,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FlashSale {

 String get title; DateTime get endsAt; List<OfferItem> get items;
/// Create a copy of FlashSale
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashSaleCopyWith<FlashSale> get copyWith => _$FlashSaleCopyWithImpl<FlashSale>(this as FlashSale, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FlashSale;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashSale&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&const DeepCollectionEquality().equals(other.items, _this.items));
}


@override
int get hashCode {
  final _this = this as FlashSale;
  return Object.hash(runtimeType,_this.title,_this.endsAt,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as FlashSale;
  return 'FlashSale(title: ${_this.title}, endsAt: ${_this.endsAt}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $FlashSaleCopyWith<$Res>  {
  factory $FlashSaleCopyWith(FlashSale value, $Res Function(FlashSale) _then) = _$FlashSaleCopyWithImpl;
@useResult
$Res call({
 String title, DateTime endsAt, List<OfferItem> items
});




}
/// @nodoc
class _$FlashSaleCopyWithImpl<$Res>
    implements $FlashSaleCopyWith<$Res> {
  _$FlashSaleCopyWithImpl(this._self, this._then);

  final FlashSale _self;
  final $Res Function(FlashSale) _then;

/// Create a copy of FlashSale
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? endsAt = null,Object? items = null,}) {
  return _then(FlashSale(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OfferItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashSale].
extension FlashSalePatterns on FlashSale {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashSale value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashSale() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashSale value)  $default,){
final _that = this;
switch (_that) {
case _FlashSale():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashSale value)?  $default,){
final _that = this;
switch (_that) {
case _FlashSale() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  DateTime endsAt,  List<OfferItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashSale() when $default != null:
return $default(_that.title,_that.endsAt,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  DateTime endsAt,  List<OfferItem> items)  $default,) {final _that = this;
switch (_that) {
case _FlashSale():
return $default(_that.title,_that.endsAt,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  DateTime endsAt,  List<OfferItem> items)?  $default,) {final _that = this;
switch (_that) {
case _FlashSale() when $default != null:
return $default(_that.title,_that.endsAt,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _FlashSale implements FlashSale {
  const _FlashSale({required this.title, required this.endsAt, required  List<OfferItem> items}): _items = items;
  

@override final  String title;
@override final  DateTime endsAt;
 final  List<OfferItem> _items;
@override List<OfferItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of FlashSale
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashSaleCopyWith<_FlashSale> get copyWith => __$FlashSaleCopyWithImpl<_FlashSale>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashSale&&(identical(other.title, title) || other.title == title)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&const DeepCollectionEquality().equals(other.items, _items));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,endsAt,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'FlashSale(title: $title, endsAt: $endsAt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$FlashSaleCopyWith<$Res> implements $FlashSaleCopyWith<$Res> {
  factory _$FlashSaleCopyWith(_FlashSale value, $Res Function(_FlashSale) _then) = __$FlashSaleCopyWithImpl;
@override @useResult
$Res call({
 String title, DateTime endsAt, List<OfferItem> items
});




}
/// @nodoc
class __$FlashSaleCopyWithImpl<$Res>
    implements _$FlashSaleCopyWith<$Res> {
  __$FlashSaleCopyWithImpl(this._self, this._then);

  final _FlashSale _self;
  final $Res Function(_FlashSale) _then;

/// Create a copy of FlashSale
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? endsAt = null,Object? items = null,}) {
  return _then(_FlashSale(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OfferItem>,
  ));
}


}

/// @nodoc
mixin _$Bundle {

 String get id; String get title; List<OfferItem> get items; int get priceBdt;
/// Create a copy of Bundle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BundleCopyWith<Bundle> get copyWith => _$BundleCopyWithImpl<Bundle>(this as Bundle, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Bundle;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bundle&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt));
}


@override
int get hashCode {
  final _this = this as Bundle;
  return Object.hash(runtimeType,_this.id,_this.title,const DeepCollectionEquality().hash(_this.items),_this.priceBdt);
}

@override
String toString() {
  final _this = this as Bundle;
  return 'Bundle(id: ${_this.id}, title: ${_this.title}, items: ${_this.items}, priceBdt: ${_this.priceBdt})';
}


}

/// @nodoc
abstract mixin class $BundleCopyWith<$Res>  {
  factory $BundleCopyWith(Bundle value, $Res Function(Bundle) _then) = _$BundleCopyWithImpl;
@useResult
$Res call({
 String id, String title, List<OfferItem> items, int priceBdt
});




}
/// @nodoc
class _$BundleCopyWithImpl<$Res>
    implements $BundleCopyWith<$Res> {
  _$BundleCopyWithImpl(this._self, this._then);

  final Bundle _self;
  final $Res Function(Bundle) _then;

/// Create a copy of Bundle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? items = null,Object? priceBdt = null,}) {
  return _then(Bundle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OfferItem>,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Bundle].
extension BundlePatterns on Bundle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bundle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bundle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bundle value)  $default,){
final _that = this;
switch (_that) {
case _Bundle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bundle value)?  $default,){
final _that = this;
switch (_that) {
case _Bundle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  List<OfferItem> items,  int priceBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bundle() when $default != null:
return $default(_that.id,_that.title,_that.items,_that.priceBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  List<OfferItem> items,  int priceBdt)  $default,) {final _that = this;
switch (_that) {
case _Bundle():
return $default(_that.id,_that.title,_that.items,_that.priceBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  List<OfferItem> items,  int priceBdt)?  $default,) {final _that = this;
switch (_that) {
case _Bundle() when $default != null:
return $default(_that.id,_that.title,_that.items,_that.priceBdt);case _:
  return null;

}
}

}

/// @nodoc


class _Bundle implements Bundle {
  const _Bundle({required this.id, required this.title, required  List<OfferItem> items, required this.priceBdt}): _items = items;
  

@override final  String id;
@override final  String title;
 final  List<OfferItem> _items;
@override List<OfferItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int priceBdt;

/// Create a copy of Bundle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BundleCopyWith<_Bundle> get copyWith => __$BundleCopyWithImpl<_Bundle>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bundle&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_items),priceBdt);
}

@override
String toString() {
    return 'Bundle(id: $id, title: $title, items: $items, priceBdt: $priceBdt)';
}


}

/// @nodoc
abstract mixin class _$BundleCopyWith<$Res> implements $BundleCopyWith<$Res> {
  factory _$BundleCopyWith(_Bundle value, $Res Function(_Bundle) _then) = __$BundleCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, List<OfferItem> items, int priceBdt
});




}
/// @nodoc
class __$BundleCopyWithImpl<$Res>
    implements _$BundleCopyWith<$Res> {
  __$BundleCopyWithImpl(this._self, this._then);

  final _Bundle _self;
  final $Res Function(_Bundle) _then;

/// Create a copy of Bundle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? items = null,Object? priceBdt = null,}) {
  return _then(_Bundle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OfferItem>,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Preorder {

 OfferItem get item; DateTime get releaseDate;
/// Create a copy of Preorder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreorderCopyWith<Preorder> get copyWith => _$PreorderCopyWithImpl<Preorder>(this as Preorder, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Preorder;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Preorder&&(identical(other.item, _this.item) || other.item == _this.item)&&(identical(other.releaseDate, _this.releaseDate) || other.releaseDate == _this.releaseDate));
}


@override
int get hashCode {
  final _this = this as Preorder;
  return Object.hash(runtimeType,_this.item,_this.releaseDate);
}

@override
String toString() {
  final _this = this as Preorder;
  return 'Preorder(item: ${_this.item}, releaseDate: ${_this.releaseDate})';
}


}

/// @nodoc
abstract mixin class $PreorderCopyWith<$Res>  {
  factory $PreorderCopyWith(Preorder value, $Res Function(Preorder) _then) = _$PreorderCopyWithImpl;
@useResult
$Res call({
 OfferItem item, DateTime releaseDate
});


$OfferItemCopyWith<$Res> get item;

}
/// @nodoc
class _$PreorderCopyWithImpl<$Res>
    implements $PreorderCopyWith<$Res> {
  _$PreorderCopyWithImpl(this._self, this._then);

  final Preorder _self;
  final $Res Function(Preorder) _then;

/// Create a copy of Preorder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? releaseDate = null,}) {
  return _then(Preorder(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OfferItem,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Preorder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferItemCopyWith<$Res> get item {
  
  return $OfferItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [Preorder].
extension PreorderPatterns on Preorder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Preorder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Preorder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Preorder value)  $default,){
final _that = this;
switch (_that) {
case _Preorder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Preorder value)?  $default,){
final _that = this;
switch (_that) {
case _Preorder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OfferItem item,  DateTime releaseDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Preorder() when $default != null:
return $default(_that.item,_that.releaseDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OfferItem item,  DateTime releaseDate)  $default,) {final _that = this;
switch (_that) {
case _Preorder():
return $default(_that.item,_that.releaseDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OfferItem item,  DateTime releaseDate)?  $default,) {final _that = this;
switch (_that) {
case _Preorder() when $default != null:
return $default(_that.item,_that.releaseDate);case _:
  return null;

}
}

}

/// @nodoc


class _Preorder implements Preorder {
  const _Preorder({required this.item, required this.releaseDate});
  

@override final  OfferItem item;
@override final  DateTime releaseDate;

/// Create a copy of Preorder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreorderCopyWith<_Preorder> get copyWith => __$PreorderCopyWithImpl<_Preorder>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Preorder&&(identical(other.item, item) || other.item == item)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,item,releaseDate);
}

@override
String toString() {
    return 'Preorder(item: $item, releaseDate: $releaseDate)';
}


}

/// @nodoc
abstract mixin class _$PreorderCopyWith<$Res> implements $PreorderCopyWith<$Res> {
  factory _$PreorderCopyWith(_Preorder value, $Res Function(_Preorder) _then) = __$PreorderCopyWithImpl;
@override @useResult
$Res call({
 OfferItem item, DateTime releaseDate
});


@override $OfferItemCopyWith<$Res> get item;

}
/// @nodoc
class __$PreorderCopyWithImpl<$Res>
    implements _$PreorderCopyWith<$Res> {
  __$PreorderCopyWithImpl(this._self, this._then);

  final _Preorder _self;
  final $Res Function(_Preorder) _then;

/// Create a copy of Preorder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? releaseDate = null,}) {
  return _then(_Preorder(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OfferItem,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Preorder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferItemCopyWith<$Res> get item {
  
  return $OfferItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc
mixin _$Offers {

 FlashSale? get flashSale; List<Bundle> get bundles; List<Preorder> get preorders;
/// Create a copy of Offers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OffersCopyWith<Offers> get copyWith => _$OffersCopyWithImpl<Offers>(this as Offers, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Offers;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Offers&&(identical(other.flashSale, _this.flashSale) || other.flashSale == _this.flashSale)&&const DeepCollectionEquality().equals(other.bundles, _this.bundles)&&const DeepCollectionEquality().equals(other.preorders, _this.preorders));
}


@override
int get hashCode {
  final _this = this as Offers;
  return Object.hash(runtimeType,_this.flashSale,const DeepCollectionEquality().hash(_this.bundles),const DeepCollectionEquality().hash(_this.preorders));
}

@override
String toString() {
  final _this = this as Offers;
  return 'Offers(flashSale: ${_this.flashSale}, bundles: ${_this.bundles}, preorders: ${_this.preorders})';
}


}

/// @nodoc
abstract mixin class $OffersCopyWith<$Res>  {
  factory $OffersCopyWith(Offers value, $Res Function(Offers) _then) = _$OffersCopyWithImpl;
@useResult
$Res call({
 FlashSale? flashSale, List<Bundle> bundles, List<Preorder> preorders
});


$FlashSaleCopyWith<$Res>? get flashSale;

}
/// @nodoc
class _$OffersCopyWithImpl<$Res>
    implements $OffersCopyWith<$Res> {
  _$OffersCopyWithImpl(this._self, this._then);

  final Offers _self;
  final $Res Function(Offers) _then;

/// Create a copy of Offers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flashSale = freezed,Object? bundles = null,Object? preorders = null,}) {
  return _then(Offers(
flashSale: freezed == flashSale ? _self.flashSale : flashSale // ignore: cast_nullable_to_non_nullable
as FlashSale?,bundles: null == bundles ? _self.bundles : bundles // ignore: cast_nullable_to_non_nullable
as List<Bundle>,preorders: null == preorders ? _self.preorders : preorders // ignore: cast_nullable_to_non_nullable
as List<Preorder>,
  ));
}
/// Create a copy of Offers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlashSaleCopyWith<$Res>? get flashSale {
    if (_self.flashSale == null) {
    return null;
  }

  return $FlashSaleCopyWith<$Res>(_self.flashSale!, (value) {
    return _then(_self.copyWith(flashSale: value));
  });
}
}


/// Adds pattern-matching-related methods to [Offers].
extension OffersPatterns on Offers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Offers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Offers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Offers value)  $default,){
final _that = this;
switch (_that) {
case _Offers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Offers value)?  $default,){
final _that = this;
switch (_that) {
case _Offers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FlashSale? flashSale,  List<Bundle> bundles,  List<Preorder> preorders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Offers() when $default != null:
return $default(_that.flashSale,_that.bundles,_that.preorders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FlashSale? flashSale,  List<Bundle> bundles,  List<Preorder> preorders)  $default,) {final _that = this;
switch (_that) {
case _Offers():
return $default(_that.flashSale,_that.bundles,_that.preorders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FlashSale? flashSale,  List<Bundle> bundles,  List<Preorder> preorders)?  $default,) {final _that = this;
switch (_that) {
case _Offers() when $default != null:
return $default(_that.flashSale,_that.bundles,_that.preorders);case _:
  return null;

}
}

}

/// @nodoc


class _Offers implements Offers {
  const _Offers({this.flashSale,  List<Bundle> bundles = const <Bundle>[],  List<Preorder> preorders = const <Preorder>[]}): _bundles = bundles,_preorders = preorders;
  

@override final  FlashSale? flashSale;
 final  List<Bundle> _bundles;
@override@JsonKey() List<Bundle> get bundles {
  if (_bundles is EqualUnmodifiableListView) return _bundles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bundles);
}

 final  List<Preorder> _preorders;
@override@JsonKey() List<Preorder> get preorders {
  if (_preorders is EqualUnmodifiableListView) return _preorders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preorders);
}


/// Create a copy of Offers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OffersCopyWith<_Offers> get copyWith => __$OffersCopyWithImpl<_Offers>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Offers&&(identical(other.flashSale, flashSale) || other.flashSale == flashSale)&&const DeepCollectionEquality().equals(other.bundles, _bundles)&&const DeepCollectionEquality().equals(other.preorders, _preorders));
}


@override
int get hashCode {
    return Object.hash(runtimeType,flashSale,const DeepCollectionEquality().hash(_bundles),const DeepCollectionEquality().hash(_preorders));
}

@override
String toString() {
    return 'Offers(flashSale: $flashSale, bundles: $bundles, preorders: $preorders)';
}


}

/// @nodoc
abstract mixin class _$OffersCopyWith<$Res> implements $OffersCopyWith<$Res> {
  factory _$OffersCopyWith(_Offers value, $Res Function(_Offers) _then) = __$OffersCopyWithImpl;
@override @useResult
$Res call({
 FlashSale? flashSale, List<Bundle> bundles, List<Preorder> preorders
});


@override $FlashSaleCopyWith<$Res>? get flashSale;

}
/// @nodoc
class __$OffersCopyWithImpl<$Res>
    implements _$OffersCopyWith<$Res> {
  __$OffersCopyWithImpl(this._self, this._then);

  final _Offers _self;
  final $Res Function(_Offers) _then;

/// Create a copy of Offers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flashSale = freezed,Object? bundles = null,Object? preorders = null,}) {
  return _then(_Offers(
flashSale: freezed == flashSale ? _self.flashSale : flashSale // ignore: cast_nullable_to_non_nullable
as FlashSale?,bundles: null == bundles ? _self._bundles : bundles // ignore: cast_nullable_to_non_nullable
as List<Bundle>,preorders: null == preorders ? _self._preorders : preorders // ignore: cast_nullable_to_non_nullable
as List<Preorder>,
  ));
}

/// Create a copy of Offers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlashSaleCopyWith<$Res>? get flashSale {
    if (_self.flashSale == null) {
    return null;
  }

  return $FlashSaleCopyWith<$Res>(_self.flashSale!, (value) {
    return _then(_self.copyWith(flashSale: value));
  });
}
}

// dart format on
