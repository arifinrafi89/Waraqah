// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartLine {

 String get id; CartItemKind get kind; String get itemId; String get bookId; String get title; String get author; int get unitPriceBdt; int get quantity;/// The most one order may hold: 1 for eBooks, capped by stock otherwise.
 int get maxQuantity; int? get listPriceBdt; BookFormat? get format; BookLanguage? get language; bool get isPreorder; int get coverSeed;
/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartLineCopyWith<CartLine> get copyWith => _$CartLineCopyWithImpl<CartLine>(this as CartLine, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CartLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLine&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.itemId, _this.itemId) || other.itemId == _this.itemId)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.unitPriceBdt, _this.unitPriceBdt) || other.unitPriceBdt == _this.unitPriceBdt)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.maxQuantity, _this.maxQuantity) || other.maxQuantity == _this.maxQuantity)&&(identical(other.listPriceBdt, _this.listPriceBdt) || other.listPriceBdt == _this.listPriceBdt)&&(identical(other.format, _this.format) || other.format == _this.format)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.isPreorder, _this.isPreorder) || other.isPreorder == _this.isPreorder)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed));
}


@override
int get hashCode {
  final _this = this as CartLine;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.itemId,_this.bookId,_this.title,_this.author,_this.unitPriceBdt,_this.quantity,_this.maxQuantity,_this.listPriceBdt,_this.format,_this.language,_this.isPreorder,_this.coverSeed);
}

@override
String toString() {
  final _this = this as CartLine;
  return 'CartLine(id: ${_this.id}, kind: ${_this.kind}, itemId: ${_this.itemId}, bookId: ${_this.bookId}, title: ${_this.title}, author: ${_this.author}, unitPriceBdt: ${_this.unitPriceBdt}, quantity: ${_this.quantity}, maxQuantity: ${_this.maxQuantity}, listPriceBdt: ${_this.listPriceBdt}, format: ${_this.format}, language: ${_this.language}, isPreorder: ${_this.isPreorder}, coverSeed: ${_this.coverSeed})';
}


}

/// @nodoc
abstract mixin class $CartLineCopyWith<$Res>  {
  factory $CartLineCopyWith(CartLine value, $Res Function(CartLine) _then) = _$CartLineCopyWithImpl;
@useResult
$Res call({
 String id, CartItemKind kind, String itemId, String bookId, String title, String author, int unitPriceBdt, int quantity, int maxQuantity, int? listPriceBdt, BookFormat? format, BookLanguage? language, bool isPreorder, int coverSeed
});




}
/// @nodoc
class _$CartLineCopyWithImpl<$Res>
    implements $CartLineCopyWith<$Res> {
  _$CartLineCopyWithImpl(this._self, this._then);

  final CartLine _self;
  final $Res Function(CartLine) _then;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? itemId = null,Object? bookId = null,Object? title = null,Object? author = null,Object? unitPriceBdt = null,Object? quantity = null,Object? maxQuantity = null,Object? listPriceBdt = freezed,Object? format = freezed,Object? language = freezed,Object? isPreorder = null,Object? coverSeed = null,}) {
  return _then(CartLine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CartItemKind,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,unitPriceBdt: null == unitPriceBdt ? _self.unitPriceBdt : unitPriceBdt // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,maxQuantity: null == maxQuantity ? _self.maxQuantity : maxQuantity // ignore: cast_nullable_to_non_nullable
as int,listPriceBdt: freezed == listPriceBdt ? _self.listPriceBdt : listPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookFormat?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as BookLanguage?,isPreorder: null == isPreorder ? _self.isPreorder : isPreorder // ignore: cast_nullable_to_non_nullable
as bool,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CartLine].
extension CartLinePatterns on CartLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartLine value)  $default,){
final _that = this;
switch (_that) {
case _CartLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartLine value)?  $default,){
final _that = this;
switch (_that) {
case _CartLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  CartItemKind kind,  String itemId,  String bookId,  String title,  String author,  int unitPriceBdt,  int quantity,  int maxQuantity,  int? listPriceBdt,  BookFormat? format,  BookLanguage? language,  bool isPreorder,  int coverSeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartLine() when $default != null:
return $default(_that.id,_that.kind,_that.itemId,_that.bookId,_that.title,_that.author,_that.unitPriceBdt,_that.quantity,_that.maxQuantity,_that.listPriceBdt,_that.format,_that.language,_that.isPreorder,_that.coverSeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  CartItemKind kind,  String itemId,  String bookId,  String title,  String author,  int unitPriceBdt,  int quantity,  int maxQuantity,  int? listPriceBdt,  BookFormat? format,  BookLanguage? language,  bool isPreorder,  int coverSeed)  $default,) {final _that = this;
switch (_that) {
case _CartLine():
return $default(_that.id,_that.kind,_that.itemId,_that.bookId,_that.title,_that.author,_that.unitPriceBdt,_that.quantity,_that.maxQuantity,_that.listPriceBdt,_that.format,_that.language,_that.isPreorder,_that.coverSeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  CartItemKind kind,  String itemId,  String bookId,  String title,  String author,  int unitPriceBdt,  int quantity,  int maxQuantity,  int? listPriceBdt,  BookFormat? format,  BookLanguage? language,  bool isPreorder,  int coverSeed)?  $default,) {final _that = this;
switch (_that) {
case _CartLine() when $default != null:
return $default(_that.id,_that.kind,_that.itemId,_that.bookId,_that.title,_that.author,_that.unitPriceBdt,_that.quantity,_that.maxQuantity,_that.listPriceBdt,_that.format,_that.language,_that.isPreorder,_that.coverSeed);case _:
  return null;

}
}

}

/// @nodoc


class _CartLine implements CartLine {
  const _CartLine({required this.id, required this.kind, required this.itemId, required this.bookId, required this.title, required this.author, required this.unitPriceBdt, required this.quantity, required this.maxQuantity, this.listPriceBdt, this.format, this.language, this.isPreorder = false, this.coverSeed = 0});
  

@override final  String id;
@override final  CartItemKind kind;
@override final  String itemId;
@override final  String bookId;
@override final  String title;
@override final  String author;
@override final  int unitPriceBdt;
@override final  int quantity;
/// The most one order may hold: 1 for eBooks, capped by stock otherwise.
@override final  int maxQuantity;
@override final  int? listPriceBdt;
@override final  BookFormat? format;
@override final  BookLanguage? language;
@override@JsonKey() final  bool isPreorder;
@override@JsonKey() final  int coverSeed;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartLineCopyWith<_CartLine> get copyWith => __$CartLineCopyWithImpl<_CartLine>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartLine&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.unitPriceBdt, unitPriceBdt) || other.unitPriceBdt == unitPriceBdt)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.maxQuantity, maxQuantity) || other.maxQuantity == maxQuantity)&&(identical(other.listPriceBdt, listPriceBdt) || other.listPriceBdt == listPriceBdt)&&(identical(other.format, format) || other.format == format)&&(identical(other.language, language) || other.language == language)&&(identical(other.isPreorder, isPreorder) || other.isPreorder == isPreorder)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,itemId,bookId,title,author,unitPriceBdt,quantity,maxQuantity,listPriceBdt,format,language,isPreorder,coverSeed);
}

@override
String toString() {
    return 'CartLine(id: $id, kind: $kind, itemId: $itemId, bookId: $bookId, title: $title, author: $author, unitPriceBdt: $unitPriceBdt, quantity: $quantity, maxQuantity: $maxQuantity, listPriceBdt: $listPriceBdt, format: $format, language: $language, isPreorder: $isPreorder, coverSeed: $coverSeed)';
}


}

/// @nodoc
abstract mixin class _$CartLineCopyWith<$Res> implements $CartLineCopyWith<$Res> {
  factory _$CartLineCopyWith(_CartLine value, $Res Function(_CartLine) _then) = __$CartLineCopyWithImpl;
@override @useResult
$Res call({
 String id, CartItemKind kind, String itemId, String bookId, String title, String author, int unitPriceBdt, int quantity, int maxQuantity, int? listPriceBdt, BookFormat? format, BookLanguage? language, bool isPreorder, int coverSeed
});




}
/// @nodoc
class __$CartLineCopyWithImpl<$Res>
    implements _$CartLineCopyWith<$Res> {
  __$CartLineCopyWithImpl(this._self, this._then);

  final _CartLine _self;
  final $Res Function(_CartLine) _then;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? itemId = null,Object? bookId = null,Object? title = null,Object? author = null,Object? unitPriceBdt = null,Object? quantity = null,Object? maxQuantity = null,Object? listPriceBdt = freezed,Object? format = freezed,Object? language = freezed,Object? isPreorder = null,Object? coverSeed = null,}) {
  return _then(_CartLine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CartItemKind,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,unitPriceBdt: null == unitPriceBdt ? _self.unitPriceBdt : unitPriceBdt // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,maxQuantity: null == maxQuantity ? _self.maxQuantity : maxQuantity // ignore: cast_nullable_to_non_nullable
as int,listPriceBdt: freezed == listPriceBdt ? _self.listPriceBdt : listPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookFormat?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as BookLanguage?,isPreorder: null == isPreorder ? _self.isPreorder : isPreorder // ignore: cast_nullable_to_non_nullable
as bool,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
