// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderLine {

 String get bookId; String get title; String get author; int get quantity; int get unitPriceBdt; BookFormat? get format; BookLanguage? get language; int get coverSeed;/// The Edition bought, so the order can be bought again. `null` for
/// one-of-a-kind used copies and bundles.
 String? get editionId;
/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineCopyWith<OrderLine> get copyWith => _$OrderLineCopyWithImpl<OrderLine>(this as OrderLine, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OrderLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLine&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.unitPriceBdt, _this.unitPriceBdt) || other.unitPriceBdt == _this.unitPriceBdt)&&(identical(other.format, _this.format) || other.format == _this.format)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.editionId, _this.editionId) || other.editionId == _this.editionId));
}


@override
int get hashCode {
  final _this = this as OrderLine;
  return Object.hash(runtimeType,_this.bookId,_this.title,_this.author,_this.quantity,_this.unitPriceBdt,_this.format,_this.language,_this.coverSeed,_this.editionId);
}

@override
String toString() {
  final _this = this as OrderLine;
  return 'OrderLine(bookId: ${_this.bookId}, title: ${_this.title}, author: ${_this.author}, quantity: ${_this.quantity}, unitPriceBdt: ${_this.unitPriceBdt}, format: ${_this.format}, language: ${_this.language}, coverSeed: ${_this.coverSeed}, editionId: ${_this.editionId})';
}


}

/// @nodoc
abstract mixin class $OrderLineCopyWith<$Res>  {
  factory $OrderLineCopyWith(OrderLine value, $Res Function(OrderLine) _then) = _$OrderLineCopyWithImpl;
@useResult
$Res call({
 String bookId, String title, String author, int quantity, int unitPriceBdt, BookFormat? format, BookLanguage? language, int coverSeed, String? editionId
});




}
/// @nodoc
class _$OrderLineCopyWithImpl<$Res>
    implements $OrderLineCopyWith<$Res> {
  _$OrderLineCopyWithImpl(this._self, this._then);

  final OrderLine _self;
  final $Res Function(OrderLine) _then;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? quantity = null,Object? unitPriceBdt = null,Object? format = freezed,Object? language = freezed,Object? coverSeed = null,Object? editionId = freezed,}) {
  return _then(OrderLine(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPriceBdt: null == unitPriceBdt ? _self.unitPriceBdt : unitPriceBdt // ignore: cast_nullable_to_non_nullable
as int,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookFormat?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as BookLanguage?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,editionId: freezed == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderLine].
extension OrderLinePatterns on OrderLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLine value)  $default,){
final _that = this;
switch (_that) {
case _OrderLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLine value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookId,  String title,  String author,  int quantity,  int unitPriceBdt,  BookFormat? format,  BookLanguage? language,  int coverSeed,  String? editionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that.bookId,_that.title,_that.author,_that.quantity,_that.unitPriceBdt,_that.format,_that.language,_that.coverSeed,_that.editionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookId,  String title,  String author,  int quantity,  int unitPriceBdt,  BookFormat? format,  BookLanguage? language,  int coverSeed,  String? editionId)  $default,) {final _that = this;
switch (_that) {
case _OrderLine():
return $default(_that.bookId,_that.title,_that.author,_that.quantity,_that.unitPriceBdt,_that.format,_that.language,_that.coverSeed,_that.editionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookId,  String title,  String author,  int quantity,  int unitPriceBdt,  BookFormat? format,  BookLanguage? language,  int coverSeed,  String? editionId)?  $default,) {final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that.bookId,_that.title,_that.author,_that.quantity,_that.unitPriceBdt,_that.format,_that.language,_that.coverSeed,_that.editionId);case _:
  return null;

}
}

}

/// @nodoc


class _OrderLine implements OrderLine {
  const _OrderLine({required this.bookId, required this.title, required this.author, required this.quantity, required this.unitPriceBdt, this.format, this.language, this.coverSeed = 0, this.editionId});
  

@override final  String bookId;
@override final  String title;
@override final  String author;
@override final  int quantity;
@override final  int unitPriceBdt;
@override final  BookFormat? format;
@override final  BookLanguage? language;
@override@JsonKey() final  int coverSeed;
/// The Edition bought, so the order can be bought again. `null` for
/// one-of-a-kind used copies and bundles.
@override final  String? editionId;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineCopyWith<_OrderLine> get copyWith => __$OrderLineCopyWithImpl<_OrderLine>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLine&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPriceBdt, unitPriceBdt) || other.unitPriceBdt == unitPriceBdt)&&(identical(other.format, format) || other.format == format)&&(identical(other.language, language) || other.language == language)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.editionId, editionId) || other.editionId == editionId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,bookId,title,author,quantity,unitPriceBdt,format,language,coverSeed,editionId);
}

@override
String toString() {
    return 'OrderLine(bookId: $bookId, title: $title, author: $author, quantity: $quantity, unitPriceBdt: $unitPriceBdt, format: $format, language: $language, coverSeed: $coverSeed, editionId: $editionId)';
}


}

/// @nodoc
abstract mixin class _$OrderLineCopyWith<$Res> implements $OrderLineCopyWith<$Res> {
  factory _$OrderLineCopyWith(_OrderLine value, $Res Function(_OrderLine) _then) = __$OrderLineCopyWithImpl;
@override @useResult
$Res call({
 String bookId, String title, String author, int quantity, int unitPriceBdt, BookFormat? format, BookLanguage? language, int coverSeed, String? editionId
});




}
/// @nodoc
class __$OrderLineCopyWithImpl<$Res>
    implements _$OrderLineCopyWith<$Res> {
  __$OrderLineCopyWithImpl(this._self, this._then);

  final _OrderLine _self;
  final $Res Function(_OrderLine) _then;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? quantity = null,Object? unitPriceBdt = null,Object? format = freezed,Object? language = freezed,Object? coverSeed = null,Object? editionId = freezed,}) {
  return _then(_OrderLine(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPriceBdt: null == unitPriceBdt ? _self.unitPriceBdt : unitPriceBdt // ignore: cast_nullable_to_non_nullable
as int,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookFormat?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as BookLanguage?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,editionId: freezed == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
