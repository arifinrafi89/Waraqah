// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deals_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DealItemModel {

 String get bookId; String get editionId; String get title; int get regularPriceBdt; int get priceBdt; int get coverSeed;
/// Create a copy of DealItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DealItemModelCopyWith<DealItemModel> get copyWith => _$DealItemModelCopyWithImpl<DealItemModel>(this as DealItemModel, _$identity);

  /// Serializes this DealItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DealItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealItemModel&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.editionId, _this.editionId) || other.editionId == _this.editionId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.regularPriceBdt, _this.regularPriceBdt) || other.regularPriceBdt == _this.regularPriceBdt)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DealItemModel;
  return Object.hash(runtimeType,_this.bookId,_this.editionId,_this.title,_this.regularPriceBdt,_this.priceBdt,_this.coverSeed);
}

@override
String toString() {
  final _this = this as DealItemModel;
  return 'DealItemModel(bookId: ${_this.bookId}, editionId: ${_this.editionId}, title: ${_this.title}, regularPriceBdt: ${_this.regularPriceBdt}, priceBdt: ${_this.priceBdt}, coverSeed: ${_this.coverSeed})';
}


}

/// @nodoc
abstract mixin class $DealItemModelCopyWith<$Res>  {
  factory $DealItemModelCopyWith(DealItemModel value, $Res Function(DealItemModel) _then) = _$DealItemModelCopyWithImpl;
@useResult
$Res call({
 String bookId, String editionId, String title, int regularPriceBdt, int priceBdt, int coverSeed
});




}
/// @nodoc
class _$DealItemModelCopyWithImpl<$Res>
    implements $DealItemModelCopyWith<$Res> {
  _$DealItemModelCopyWithImpl(this._self, this._then);

  final DealItemModel _self;
  final $Res Function(DealItemModel) _then;

/// Create a copy of DealItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? editionId = null,Object? title = null,Object? regularPriceBdt = null,Object? priceBdt = null,Object? coverSeed = null,}) {
  return _then(DealItemModel(
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


/// Adds pattern-matching-related methods to [DealItemModel].
extension DealItemModelPatterns on DealItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DealItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DealItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DealItemModel value)  $default,){
final _that = this;
switch (_that) {
case _DealItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DealItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _DealItemModel() when $default != null:
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
case _DealItemModel() when $default != null:
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
case _DealItemModel():
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
case _DealItemModel() when $default != null:
return $default(_that.bookId,_that.editionId,_that.title,_that.regularPriceBdt,_that.priceBdt,_that.coverSeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DealItemModel implements DealItemModel {
  const _DealItemModel({required this.bookId, required this.editionId, required this.title, required this.regularPriceBdt, required this.priceBdt, this.coverSeed = 0});
  factory _DealItemModel.fromJson(Map<String, dynamic> json) => _$DealItemModelFromJson(json);

@override final  String bookId;
@override final  String editionId;
@override final  String title;
@override final  int regularPriceBdt;
@override final  int priceBdt;
@override@JsonKey() final  int coverSeed;

/// Create a copy of DealItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DealItemModelCopyWith<_DealItemModel> get copyWith => __$DealItemModelCopyWithImpl<_DealItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DealItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DealItemModel&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.editionId, editionId) || other.editionId == editionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.regularPriceBdt, regularPriceBdt) || other.regularPriceBdt == regularPriceBdt)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,bookId,editionId,title,regularPriceBdt,priceBdt,coverSeed);
}

@override
String toString() {
    return 'DealItemModel(bookId: $bookId, editionId: $editionId, title: $title, regularPriceBdt: $regularPriceBdt, priceBdt: $priceBdt, coverSeed: $coverSeed)';
}


}

/// @nodoc
abstract mixin class _$DealItemModelCopyWith<$Res> implements $DealItemModelCopyWith<$Res> {
  factory _$DealItemModelCopyWith(_DealItemModel value, $Res Function(_DealItemModel) _then) = __$DealItemModelCopyWithImpl;
@override @useResult
$Res call({
 String bookId, String editionId, String title, int regularPriceBdt, int priceBdt, int coverSeed
});




}
/// @nodoc
class __$DealItemModelCopyWithImpl<$Res>
    implements _$DealItemModelCopyWith<$Res> {
  __$DealItemModelCopyWithImpl(this._self, this._then);

  final _DealItemModel _self;
  final $Res Function(_DealItemModel) _then;

/// Create a copy of DealItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? editionId = null,Object? title = null,Object? regularPriceBdt = null,Object? priceBdt = null,Object? coverSeed = null,}) {
  return _then(_DealItemModel(
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
mixin _$FlashSaleModel {

 String get title; DateTime get endsAt; List<DealItemModel> get items;
/// Create a copy of FlashSaleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashSaleModelCopyWith<FlashSaleModel> get copyWith => _$FlashSaleModelCopyWithImpl<FlashSaleModel>(this as FlashSaleModel, _$identity);

  /// Serializes this FlashSaleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FlashSaleModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashSaleModel&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FlashSaleModel;
  return Object.hash(runtimeType,_this.title,_this.endsAt,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as FlashSaleModel;
  return 'FlashSaleModel(title: ${_this.title}, endsAt: ${_this.endsAt}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $FlashSaleModelCopyWith<$Res>  {
  factory $FlashSaleModelCopyWith(FlashSaleModel value, $Res Function(FlashSaleModel) _then) = _$FlashSaleModelCopyWithImpl;
@useResult
$Res call({
 String title, DateTime endsAt, List<DealItemModel> items
});




}
/// @nodoc
class _$FlashSaleModelCopyWithImpl<$Res>
    implements $FlashSaleModelCopyWith<$Res> {
  _$FlashSaleModelCopyWithImpl(this._self, this._then);

  final FlashSaleModel _self;
  final $Res Function(FlashSaleModel) _then;

/// Create a copy of FlashSaleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? endsAt = null,Object? items = null,}) {
  return _then(FlashSaleModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<DealItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashSaleModel].
extension FlashSaleModelPatterns on FlashSaleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashSaleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashSaleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashSaleModel value)  $default,){
final _that = this;
switch (_that) {
case _FlashSaleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashSaleModel value)?  $default,){
final _that = this;
switch (_that) {
case _FlashSaleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  DateTime endsAt,  List<DealItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashSaleModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  DateTime endsAt,  List<DealItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _FlashSaleModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  DateTime endsAt,  List<DealItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _FlashSaleModel() when $default != null:
return $default(_that.title,_that.endsAt,_that.items);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _FlashSaleModel implements FlashSaleModel {
  const _FlashSaleModel({required this.title, required this.endsAt, required  List<DealItemModel> items}): _items = items;
  factory _FlashSaleModel.fromJson(Map<String, dynamic> json) => _$FlashSaleModelFromJson(json);

@override final  String title;
@override final  DateTime endsAt;
 final  List<DealItemModel> _items;
@override List<DealItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of FlashSaleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashSaleModelCopyWith<_FlashSaleModel> get copyWith => __$FlashSaleModelCopyWithImpl<_FlashSaleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashSaleModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashSaleModel&&(identical(other.title, title) || other.title == title)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,endsAt,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'FlashSaleModel(title: $title, endsAt: $endsAt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$FlashSaleModelCopyWith<$Res> implements $FlashSaleModelCopyWith<$Res> {
  factory _$FlashSaleModelCopyWith(_FlashSaleModel value, $Res Function(_FlashSaleModel) _then) = __$FlashSaleModelCopyWithImpl;
@override @useResult
$Res call({
 String title, DateTime endsAt, List<DealItemModel> items
});




}
/// @nodoc
class __$FlashSaleModelCopyWithImpl<$Res>
    implements _$FlashSaleModelCopyWith<$Res> {
  __$FlashSaleModelCopyWithImpl(this._self, this._then);

  final _FlashSaleModel _self;
  final $Res Function(_FlashSaleModel) _then;

/// Create a copy of FlashSaleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? endsAt = null,Object? items = null,}) {
  return _then(_FlashSaleModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<DealItemModel>,
  ));
}


}


/// @nodoc
mixin _$BundleModel {

 String get id; String get title; List<DealItemModel> get items; int get priceBdt;
/// Create a copy of BundleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BundleModelCopyWith<BundleModel> get copyWith => _$BundleModelCopyWithImpl<BundleModel>(this as BundleModel, _$identity);

  /// Serializes this BundleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BundleModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BundleModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BundleModel;
  return Object.hash(runtimeType,_this.id,_this.title,const DeepCollectionEquality().hash(_this.items),_this.priceBdt);
}

@override
String toString() {
  final _this = this as BundleModel;
  return 'BundleModel(id: ${_this.id}, title: ${_this.title}, items: ${_this.items}, priceBdt: ${_this.priceBdt})';
}


}

/// @nodoc
abstract mixin class $BundleModelCopyWith<$Res>  {
  factory $BundleModelCopyWith(BundleModel value, $Res Function(BundleModel) _then) = _$BundleModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, List<DealItemModel> items, int priceBdt
});




}
/// @nodoc
class _$BundleModelCopyWithImpl<$Res>
    implements $BundleModelCopyWith<$Res> {
  _$BundleModelCopyWithImpl(this._self, this._then);

  final BundleModel _self;
  final $Res Function(BundleModel) _then;

/// Create a copy of BundleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? items = null,Object? priceBdt = null,}) {
  return _then(BundleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<DealItemModel>,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BundleModel].
extension BundleModelPatterns on BundleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BundleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BundleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BundleModel value)  $default,){
final _that = this;
switch (_that) {
case _BundleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BundleModel value)?  $default,){
final _that = this;
switch (_that) {
case _BundleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  List<DealItemModel> items,  int priceBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BundleModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  List<DealItemModel> items,  int priceBdt)  $default,) {final _that = this;
switch (_that) {
case _BundleModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  List<DealItemModel> items,  int priceBdt)?  $default,) {final _that = this;
switch (_that) {
case _BundleModel() when $default != null:
return $default(_that.id,_that.title,_that.items,_that.priceBdt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BundleModel implements BundleModel {
  const _BundleModel({required this.id, required this.title, required  List<DealItemModel> items, required this.priceBdt}): _items = items;
  factory _BundleModel.fromJson(Map<String, dynamic> json) => _$BundleModelFromJson(json);

@override final  String id;
@override final  String title;
 final  List<DealItemModel> _items;
@override List<DealItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int priceBdt;

/// Create a copy of BundleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BundleModelCopyWith<_BundleModel> get copyWith => __$BundleModelCopyWithImpl<_BundleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BundleModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BundleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_items),priceBdt);
}

@override
String toString() {
    return 'BundleModel(id: $id, title: $title, items: $items, priceBdt: $priceBdt)';
}


}

/// @nodoc
abstract mixin class _$BundleModelCopyWith<$Res> implements $BundleModelCopyWith<$Res> {
  factory _$BundleModelCopyWith(_BundleModel value, $Res Function(_BundleModel) _then) = __$BundleModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, List<DealItemModel> items, int priceBdt
});




}
/// @nodoc
class __$BundleModelCopyWithImpl<$Res>
    implements _$BundleModelCopyWith<$Res> {
  __$BundleModelCopyWithImpl(this._self, this._then);

  final _BundleModel _self;
  final $Res Function(_BundleModel) _then;

/// Create a copy of BundleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? items = null,Object? priceBdt = null,}) {
  return _then(_BundleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<DealItemModel>,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PreorderModel {

 DealItemModel get item; DateTime get releaseDate;
/// Create a copy of PreorderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreorderModelCopyWith<PreorderModel> get copyWith => _$PreorderModelCopyWithImpl<PreorderModel>(this as PreorderModel, _$identity);

  /// Serializes this PreorderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PreorderModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreorderModel&&(identical(other.item, _this.item) || other.item == _this.item)&&(identical(other.releaseDate, _this.releaseDate) || other.releaseDate == _this.releaseDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PreorderModel;
  return Object.hash(runtimeType,_this.item,_this.releaseDate);
}

@override
String toString() {
  final _this = this as PreorderModel;
  return 'PreorderModel(item: ${_this.item}, releaseDate: ${_this.releaseDate})';
}


}

/// @nodoc
abstract mixin class $PreorderModelCopyWith<$Res>  {
  factory $PreorderModelCopyWith(PreorderModel value, $Res Function(PreorderModel) _then) = _$PreorderModelCopyWithImpl;
@useResult
$Res call({
 DealItemModel item, DateTime releaseDate
});


$DealItemModelCopyWith<$Res> get item;

}
/// @nodoc
class _$PreorderModelCopyWithImpl<$Res>
    implements $PreorderModelCopyWith<$Res> {
  _$PreorderModelCopyWithImpl(this._self, this._then);

  final PreorderModel _self;
  final $Res Function(PreorderModel) _then;

/// Create a copy of PreorderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? releaseDate = null,}) {
  return _then(PreorderModel(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as DealItemModel,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of PreorderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DealItemModelCopyWith<$Res> get item {
  
  return $DealItemModelCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [PreorderModel].
extension PreorderModelPatterns on PreorderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreorderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreorderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreorderModel value)  $default,){
final _that = this;
switch (_that) {
case _PreorderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreorderModel value)?  $default,){
final _that = this;
switch (_that) {
case _PreorderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DealItemModel item,  DateTime releaseDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreorderModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DealItemModel item,  DateTime releaseDate)  $default,) {final _that = this;
switch (_that) {
case _PreorderModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DealItemModel item,  DateTime releaseDate)?  $default,) {final _that = this;
switch (_that) {
case _PreorderModel() when $default != null:
return $default(_that.item,_that.releaseDate);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PreorderModel implements PreorderModel {
  const _PreorderModel({required this.item, required this.releaseDate});
  factory _PreorderModel.fromJson(Map<String, dynamic> json) => _$PreorderModelFromJson(json);

@override final  DealItemModel item;
@override final  DateTime releaseDate;

/// Create a copy of PreorderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreorderModelCopyWith<_PreorderModel> get copyWith => __$PreorderModelCopyWithImpl<_PreorderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreorderModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreorderModel&&(identical(other.item, item) || other.item == item)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,item,releaseDate);
}

@override
String toString() {
    return 'PreorderModel(item: $item, releaseDate: $releaseDate)';
}


}

/// @nodoc
abstract mixin class _$PreorderModelCopyWith<$Res> implements $PreorderModelCopyWith<$Res> {
  factory _$PreorderModelCopyWith(_PreorderModel value, $Res Function(_PreorderModel) _then) = __$PreorderModelCopyWithImpl;
@override @useResult
$Res call({
 DealItemModel item, DateTime releaseDate
});


@override $DealItemModelCopyWith<$Res> get item;

}
/// @nodoc
class __$PreorderModelCopyWithImpl<$Res>
    implements _$PreorderModelCopyWith<$Res> {
  __$PreorderModelCopyWithImpl(this._self, this._then);

  final _PreorderModel _self;
  final $Res Function(_PreorderModel) _then;

/// Create a copy of PreorderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? releaseDate = null,}) {
  return _then(_PreorderModel(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as DealItemModel,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of PreorderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DealItemModelCopyWith<$Res> get item {
  
  return $DealItemModelCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// @nodoc
mixin _$DealsModel {

 FlashSaleModel? get flashSale; List<BundleModel> get bundles; List<PreorderModel> get preorders;
/// Create a copy of DealsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DealsModelCopyWith<DealsModel> get copyWith => _$DealsModelCopyWithImpl<DealsModel>(this as DealsModel, _$identity);

  /// Serializes this DealsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DealsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealsModel&&(identical(other.flashSale, _this.flashSale) || other.flashSale == _this.flashSale)&&const DeepCollectionEquality().equals(other.bundles, _this.bundles)&&const DeepCollectionEquality().equals(other.preorders, _this.preorders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DealsModel;
  return Object.hash(runtimeType,_this.flashSale,const DeepCollectionEquality().hash(_this.bundles),const DeepCollectionEquality().hash(_this.preorders));
}

@override
String toString() {
  final _this = this as DealsModel;
  return 'DealsModel(flashSale: ${_this.flashSale}, bundles: ${_this.bundles}, preorders: ${_this.preorders})';
}


}

/// @nodoc
abstract mixin class $DealsModelCopyWith<$Res>  {
  factory $DealsModelCopyWith(DealsModel value, $Res Function(DealsModel) _then) = _$DealsModelCopyWithImpl;
@useResult
$Res call({
 FlashSaleModel? flashSale, List<BundleModel> bundles, List<PreorderModel> preorders
});


$FlashSaleModelCopyWith<$Res>? get flashSale;

}
/// @nodoc
class _$DealsModelCopyWithImpl<$Res>
    implements $DealsModelCopyWith<$Res> {
  _$DealsModelCopyWithImpl(this._self, this._then);

  final DealsModel _self;
  final $Res Function(DealsModel) _then;

/// Create a copy of DealsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flashSale = freezed,Object? bundles = null,Object? preorders = null,}) {
  return _then(DealsModel(
flashSale: freezed == flashSale ? _self.flashSale : flashSale // ignore: cast_nullable_to_non_nullable
as FlashSaleModel?,bundles: null == bundles ? _self.bundles : bundles // ignore: cast_nullable_to_non_nullable
as List<BundleModel>,preorders: null == preorders ? _self.preorders : preorders // ignore: cast_nullable_to_non_nullable
as List<PreorderModel>,
  ));
}
/// Create a copy of DealsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlashSaleModelCopyWith<$Res>? get flashSale {
    if (_self.flashSale == null) {
    return null;
  }

  return $FlashSaleModelCopyWith<$Res>(_self.flashSale!, (value) {
    return _then(_self.copyWith(flashSale: value));
  });
}
}


/// Adds pattern-matching-related methods to [DealsModel].
extension DealsModelPatterns on DealsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DealsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DealsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DealsModel value)  $default,){
final _that = this;
switch (_that) {
case _DealsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DealsModel value)?  $default,){
final _that = this;
switch (_that) {
case _DealsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FlashSaleModel? flashSale,  List<BundleModel> bundles,  List<PreorderModel> preorders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DealsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FlashSaleModel? flashSale,  List<BundleModel> bundles,  List<PreorderModel> preorders)  $default,) {final _that = this;
switch (_that) {
case _DealsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FlashSaleModel? flashSale,  List<BundleModel> bundles,  List<PreorderModel> preorders)?  $default,) {final _that = this;
switch (_that) {
case _DealsModel() when $default != null:
return $default(_that.flashSale,_that.bundles,_that.preorders);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DealsModel implements DealsModel {
  const _DealsModel({this.flashSale,  List<BundleModel> bundles = const <BundleModel>[],  List<PreorderModel> preorders = const <PreorderModel>[]}): _bundles = bundles,_preorders = preorders;
  factory _DealsModel.fromJson(Map<String, dynamic> json) => _$DealsModelFromJson(json);

@override final  FlashSaleModel? flashSale;
 final  List<BundleModel> _bundles;
@override@JsonKey() List<BundleModel> get bundles {
  if (_bundles is EqualUnmodifiableListView) return _bundles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bundles);
}

 final  List<PreorderModel> _preorders;
@override@JsonKey() List<PreorderModel> get preorders {
  if (_preorders is EqualUnmodifiableListView) return _preorders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preorders);
}


/// Create a copy of DealsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DealsModelCopyWith<_DealsModel> get copyWith => __$DealsModelCopyWithImpl<_DealsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DealsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DealsModel&&(identical(other.flashSale, flashSale) || other.flashSale == flashSale)&&const DeepCollectionEquality().equals(other.bundles, _bundles)&&const DeepCollectionEquality().equals(other.preorders, _preorders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,flashSale,const DeepCollectionEquality().hash(_bundles),const DeepCollectionEquality().hash(_preorders));
}

@override
String toString() {
    return 'DealsModel(flashSale: $flashSale, bundles: $bundles, preorders: $preorders)';
}


}

/// @nodoc
abstract mixin class _$DealsModelCopyWith<$Res> implements $DealsModelCopyWith<$Res> {
  factory _$DealsModelCopyWith(_DealsModel value, $Res Function(_DealsModel) _then) = __$DealsModelCopyWithImpl;
@override @useResult
$Res call({
 FlashSaleModel? flashSale, List<BundleModel> bundles, List<PreorderModel> preorders
});


@override $FlashSaleModelCopyWith<$Res>? get flashSale;

}
/// @nodoc
class __$DealsModelCopyWithImpl<$Res>
    implements _$DealsModelCopyWith<$Res> {
  __$DealsModelCopyWithImpl(this._self, this._then);

  final _DealsModel _self;
  final $Res Function(_DealsModel) _then;

/// Create a copy of DealsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flashSale = freezed,Object? bundles = null,Object? preorders = null,}) {
  return _then(_DealsModel(
flashSale: freezed == flashSale ? _self.flashSale : flashSale // ignore: cast_nullable_to_non_nullable
as FlashSaleModel?,bundles: null == bundles ? _self._bundles : bundles // ignore: cast_nullable_to_non_nullable
as List<BundleModel>,preorders: null == preorders ? _self._preorders : preorders // ignore: cast_nullable_to_non_nullable
as List<PreorderModel>,
  ));
}

/// Create a copy of DealsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlashSaleModelCopyWith<$Res>? get flashSale {
    if (_self.flashSale == null) {
    return null;
  }

  return $FlashSaleModelCopyWith<$Res>(_self.flashSale!, (value) {
    return _then(_self.copyWith(flashSale: value));
  });
}
}

// dart format on
