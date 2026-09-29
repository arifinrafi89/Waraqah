// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Edition {

 String get id; BookFormat get format; BookLanguage get language; int get priceBdt; int get stock; int? get listPriceBdt; bool get isPreorder; String? get isbn;
/// Create a copy of Edition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditionCopyWith<Edition> get copyWith => _$EditionCopyWithImpl<Edition>(this as Edition, _$identity);

  /// Serializes this Edition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Edition;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Edition&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.format, _this.format) || other.format == _this.format)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.stock, _this.stock) || other.stock == _this.stock)&&(identical(other.listPriceBdt, _this.listPriceBdt) || other.listPriceBdt == _this.listPriceBdt)&&(identical(other.isPreorder, _this.isPreorder) || other.isPreorder == _this.isPreorder)&&(identical(other.isbn, _this.isbn) || other.isbn == _this.isbn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Edition;
  return Object.hash(runtimeType,_this.id,_this.format,_this.language,_this.priceBdt,_this.stock,_this.listPriceBdt,_this.isPreorder,_this.isbn);
}

@override
String toString() {
  final _this = this as Edition;
  return 'Edition(id: ${_this.id}, format: ${_this.format}, language: ${_this.language}, priceBdt: ${_this.priceBdt}, stock: ${_this.stock}, listPriceBdt: ${_this.listPriceBdt}, isPreorder: ${_this.isPreorder}, isbn: ${_this.isbn})';
}


}

/// @nodoc
abstract mixin class $EditionCopyWith<$Res>  {
  factory $EditionCopyWith(Edition value, $Res Function(Edition) _then) = _$EditionCopyWithImpl;
@useResult
$Res call({
 String id, BookFormat format, BookLanguage language, int priceBdt, int stock, int? listPriceBdt, bool isPreorder, String? isbn
});




}
/// @nodoc
class _$EditionCopyWithImpl<$Res>
    implements $EditionCopyWith<$Res> {
  _$EditionCopyWithImpl(this._self, this._then);

  final Edition _self;
  final $Res Function(Edition) _then;

/// Create a copy of Edition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? format = null,Object? language = null,Object? priceBdt = null,Object? stock = null,Object? listPriceBdt = freezed,Object? isPreorder = null,Object? isbn = freezed,}) {
  return _then(Edition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookFormat,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as BookLanguage,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,listPriceBdt: freezed == listPriceBdt ? _self.listPriceBdt : listPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,isPreorder: null == isPreorder ? _self.isPreorder : isPreorder // ignore: cast_nullable_to_non_nullable
as bool,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Edition].
extension EditionPatterns on Edition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Edition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Edition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Edition value)  $default,){
final _that = this;
switch (_that) {
case _Edition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Edition value)?  $default,){
final _that = this;
switch (_that) {
case _Edition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BookFormat format,  BookLanguage language,  int priceBdt,  int stock,  int? listPriceBdt,  bool isPreorder,  String? isbn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Edition() when $default != null:
return $default(_that.id,_that.format,_that.language,_that.priceBdt,_that.stock,_that.listPriceBdt,_that.isPreorder,_that.isbn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BookFormat format,  BookLanguage language,  int priceBdt,  int stock,  int? listPriceBdt,  bool isPreorder,  String? isbn)  $default,) {final _that = this;
switch (_that) {
case _Edition():
return $default(_that.id,_that.format,_that.language,_that.priceBdt,_that.stock,_that.listPriceBdt,_that.isPreorder,_that.isbn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BookFormat format,  BookLanguage language,  int priceBdt,  int stock,  int? listPriceBdt,  bool isPreorder,  String? isbn)?  $default,) {final _that = this;
switch (_that) {
case _Edition() when $default != null:
return $default(_that.id,_that.format,_that.language,_that.priceBdt,_that.stock,_that.listPriceBdt,_that.isPreorder,_that.isbn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Edition implements Edition {
  const _Edition({required this.id, required this.format, required this.language, required this.priceBdt, required this.stock, this.listPriceBdt, this.isPreorder = false, this.isbn});
  factory _Edition.fromJson(Map<String, dynamic> json) => _$EditionFromJson(json);

@override final  String id;
@override final  BookFormat format;
@override final  BookLanguage language;
@override final  int priceBdt;
@override final  int stock;
@override final  int? listPriceBdt;
@override@JsonKey() final  bool isPreorder;
@override final  String? isbn;

/// Create a copy of Edition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditionCopyWith<_Edition> get copyWith => __$EditionCopyWithImpl<_Edition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Edition&&(identical(other.id, id) || other.id == id)&&(identical(other.format, format) || other.format == format)&&(identical(other.language, language) || other.language == language)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.listPriceBdt, listPriceBdt) || other.listPriceBdt == listPriceBdt)&&(identical(other.isPreorder, isPreorder) || other.isPreorder == isPreorder)&&(identical(other.isbn, isbn) || other.isbn == isbn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,format,language,priceBdt,stock,listPriceBdt,isPreorder,isbn);
}

@override
String toString() {
    return 'Edition(id: $id, format: $format, language: $language, priceBdt: $priceBdt, stock: $stock, listPriceBdt: $listPriceBdt, isPreorder: $isPreorder, isbn: $isbn)';
}


}

/// @nodoc
abstract mixin class _$EditionCopyWith<$Res> implements $EditionCopyWith<$Res> {
  factory _$EditionCopyWith(_Edition value, $Res Function(_Edition) _then) = __$EditionCopyWithImpl;
@override @useResult
$Res call({
 String id, BookFormat format, BookLanguage language, int priceBdt, int stock, int? listPriceBdt, bool isPreorder, String? isbn
});




}
/// @nodoc
class __$EditionCopyWithImpl<$Res>
    implements _$EditionCopyWith<$Res> {
  __$EditionCopyWithImpl(this._self, this._then);

  final _Edition _self;
  final $Res Function(_Edition) _then;

/// Create a copy of Edition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? format = null,Object? language = null,Object? priceBdt = null,Object? stock = null,Object? listPriceBdt = freezed,Object? isPreorder = null,Object? isbn = freezed,}) {
  return _then(_Edition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookFormat,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as BookLanguage,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,listPriceBdt: freezed == listPriceBdt ? _self.listPriceBdt : listPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,isPreorder: null == isPreorder ? _self.isPreorder : isPreorder // ignore: cast_nullable_to_non_nullable
as bool,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
