// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartLineModel {

 String get id; CartItemKind get kind; String get itemId; String get bookId; String get title; String get author; int get unitPriceBdt; int get quantity; int get maxQuantity; int? get listPriceBdt; BookFormat? get format; BookLanguage? get language; bool get isPreorder; BookCondition? get condition; int get coverSeed;
/// Create a copy of CartLineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartLineModelCopyWith<CartLineModel> get copyWith => _$CartLineModelCopyWithImpl<CartLineModel>(this as CartLineModel, _$identity);

  /// Serializes this CartLineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CartLineModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLineModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.itemId, _this.itemId) || other.itemId == _this.itemId)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.unitPriceBdt, _this.unitPriceBdt) || other.unitPriceBdt == _this.unitPriceBdt)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.maxQuantity, _this.maxQuantity) || other.maxQuantity == _this.maxQuantity)&&(identical(other.listPriceBdt, _this.listPriceBdt) || other.listPriceBdt == _this.listPriceBdt)&&(identical(other.format, _this.format) || other.format == _this.format)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.isPreorder, _this.isPreorder) || other.isPreorder == _this.isPreorder)&&(identical(other.condition, _this.condition) || other.condition == _this.condition)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CartLineModel;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.itemId,_this.bookId,_this.title,_this.author,_this.unitPriceBdt,_this.quantity,_this.maxQuantity,_this.listPriceBdt,_this.format,_this.language,_this.isPreorder,_this.condition,_this.coverSeed);
}

@override
String toString() {
  final _this = this as CartLineModel;
  return 'CartLineModel(id: ${_this.id}, kind: ${_this.kind}, itemId: ${_this.itemId}, bookId: ${_this.bookId}, title: ${_this.title}, author: ${_this.author}, unitPriceBdt: ${_this.unitPriceBdt}, quantity: ${_this.quantity}, maxQuantity: ${_this.maxQuantity}, listPriceBdt: ${_this.listPriceBdt}, format: ${_this.format}, language: ${_this.language}, isPreorder: ${_this.isPreorder}, condition: ${_this.condition}, coverSeed: ${_this.coverSeed})';
}


}

/// @nodoc
abstract mixin class $CartLineModelCopyWith<$Res>  {
  factory $CartLineModelCopyWith(CartLineModel value, $Res Function(CartLineModel) _then) = _$CartLineModelCopyWithImpl;
@useResult
$Res call({
 String id, CartItemKind kind, String itemId, String bookId, String title, String author, int unitPriceBdt, int quantity, int maxQuantity, int? listPriceBdt, BookFormat? format, BookLanguage? language, bool isPreorder, BookCondition? condition, int coverSeed
});




}
/// @nodoc
class _$CartLineModelCopyWithImpl<$Res>
    implements $CartLineModelCopyWith<$Res> {
  _$CartLineModelCopyWithImpl(this._self, this._then);

  final CartLineModel _self;
  final $Res Function(CartLineModel) _then;

/// Create a copy of CartLineModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? itemId = null,Object? bookId = null,Object? title = null,Object? author = null,Object? unitPriceBdt = null,Object? quantity = null,Object? maxQuantity = null,Object? listPriceBdt = freezed,Object? format = freezed,Object? language = freezed,Object? isPreorder = null,Object? condition = freezed,Object? coverSeed = null,}) {
  return _then(CartLineModel(
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
as bool,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CartLineModel].
extension CartLineModelPatterns on CartLineModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartLineModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartLineModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartLineModel value)  $default,){
final _that = this;
switch (_that) {
case _CartLineModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartLineModel value)?  $default,){
final _that = this;
switch (_that) {
case _CartLineModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  CartItemKind kind,  String itemId,  String bookId,  String title,  String author,  int unitPriceBdt,  int quantity,  int maxQuantity,  int? listPriceBdt,  BookFormat? format,  BookLanguage? language,  bool isPreorder,  BookCondition? condition,  int coverSeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartLineModel() when $default != null:
return $default(_that.id,_that.kind,_that.itemId,_that.bookId,_that.title,_that.author,_that.unitPriceBdt,_that.quantity,_that.maxQuantity,_that.listPriceBdt,_that.format,_that.language,_that.isPreorder,_that.condition,_that.coverSeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  CartItemKind kind,  String itemId,  String bookId,  String title,  String author,  int unitPriceBdt,  int quantity,  int maxQuantity,  int? listPriceBdt,  BookFormat? format,  BookLanguage? language,  bool isPreorder,  BookCondition? condition,  int coverSeed)  $default,) {final _that = this;
switch (_that) {
case _CartLineModel():
return $default(_that.id,_that.kind,_that.itemId,_that.bookId,_that.title,_that.author,_that.unitPriceBdt,_that.quantity,_that.maxQuantity,_that.listPriceBdt,_that.format,_that.language,_that.isPreorder,_that.condition,_that.coverSeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  CartItemKind kind,  String itemId,  String bookId,  String title,  String author,  int unitPriceBdt,  int quantity,  int maxQuantity,  int? listPriceBdt,  BookFormat? format,  BookLanguage? language,  bool isPreorder,  BookCondition? condition,  int coverSeed)?  $default,) {final _that = this;
switch (_that) {
case _CartLineModel() when $default != null:
return $default(_that.id,_that.kind,_that.itemId,_that.bookId,_that.title,_that.author,_that.unitPriceBdt,_that.quantity,_that.maxQuantity,_that.listPriceBdt,_that.format,_that.language,_that.isPreorder,_that.condition,_that.coverSeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartLineModel implements CartLineModel {
  const _CartLineModel({required this.id, required this.kind, required this.itemId, required this.bookId, required this.title, required this.author, required this.unitPriceBdt, required this.quantity, required this.maxQuantity, this.listPriceBdt, this.format, this.language, this.isPreorder = false, this.condition, this.coverSeed = 0});
  factory _CartLineModel.fromJson(Map<String, dynamic> json) => _$CartLineModelFromJson(json);

@override final  String id;
@override final  CartItemKind kind;
@override final  String itemId;
@override final  String bookId;
@override final  String title;
@override final  String author;
@override final  int unitPriceBdt;
@override final  int quantity;
@override final  int maxQuantity;
@override final  int? listPriceBdt;
@override final  BookFormat? format;
@override final  BookLanguage? language;
@override@JsonKey() final  bool isPreorder;
@override final  BookCondition? condition;
@override@JsonKey() final  int coverSeed;

/// Create a copy of CartLineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartLineModelCopyWith<_CartLineModel> get copyWith => __$CartLineModelCopyWithImpl<_CartLineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartLineModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartLineModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.unitPriceBdt, unitPriceBdt) || other.unitPriceBdt == unitPriceBdt)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.maxQuantity, maxQuantity) || other.maxQuantity == maxQuantity)&&(identical(other.listPriceBdt, listPriceBdt) || other.listPriceBdt == listPriceBdt)&&(identical(other.format, format) || other.format == format)&&(identical(other.language, language) || other.language == language)&&(identical(other.isPreorder, isPreorder) || other.isPreorder == isPreorder)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,itemId,bookId,title,author,unitPriceBdt,quantity,maxQuantity,listPriceBdt,format,language,isPreorder,condition,coverSeed);
}

@override
String toString() {
    return 'CartLineModel(id: $id, kind: $kind, itemId: $itemId, bookId: $bookId, title: $title, author: $author, unitPriceBdt: $unitPriceBdt, quantity: $quantity, maxQuantity: $maxQuantity, listPriceBdt: $listPriceBdt, format: $format, language: $language, isPreorder: $isPreorder, condition: $condition, coverSeed: $coverSeed)';
}


}

/// @nodoc
abstract mixin class _$CartLineModelCopyWith<$Res> implements $CartLineModelCopyWith<$Res> {
  factory _$CartLineModelCopyWith(_CartLineModel value, $Res Function(_CartLineModel) _then) = __$CartLineModelCopyWithImpl;
@override @useResult
$Res call({
 String id, CartItemKind kind, String itemId, String bookId, String title, String author, int unitPriceBdt, int quantity, int maxQuantity, int? listPriceBdt, BookFormat? format, BookLanguage? language, bool isPreorder, BookCondition? condition, int coverSeed
});




}
/// @nodoc
class __$CartLineModelCopyWithImpl<$Res>
    implements _$CartLineModelCopyWith<$Res> {
  __$CartLineModelCopyWithImpl(this._self, this._then);

  final _CartLineModel _self;
  final $Res Function(_CartLineModel) _then;

/// Create a copy of CartLineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? itemId = null,Object? bookId = null,Object? title = null,Object? author = null,Object? unitPriceBdt = null,Object? quantity = null,Object? maxQuantity = null,Object? listPriceBdt = freezed,Object? format = freezed,Object? language = freezed,Object? isPreorder = null,Object? condition = freezed,Object? coverSeed = null,}) {
  return _then(_CartLineModel(
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
as bool,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CartModel {

 List<CartLineModel> get lines;
/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartModelCopyWith<CartModel> get copyWith => _$CartModelCopyWithImpl<CartModel>(this as CartModel, _$identity);

  /// Serializes this CartModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CartModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartModel&&const DeepCollectionEquality().equals(other.lines, _this.lines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CartModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.lines));
}

@override
String toString() {
  final _this = this as CartModel;
  return 'CartModel(lines: ${_this.lines})';
}


}

/// @nodoc
abstract mixin class $CartModelCopyWith<$Res>  {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) _then) = _$CartModelCopyWithImpl;
@useResult
$Res call({
 List<CartLineModel> lines
});




}
/// @nodoc
class _$CartModelCopyWithImpl<$Res>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._self, this._then);

  final CartModel _self;
  final $Res Function(CartModel) _then;

/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lines = null,}) {
  return _then(CartModel(
lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<CartLineModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CartModel].
extension CartModelPatterns on CartModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartModel value)  $default,){
final _that = this;
switch (_that) {
case _CartModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartModel value)?  $default,){
final _that = this;
switch (_that) {
case _CartModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CartLineModel> lines)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartModel() when $default != null:
return $default(_that.lines);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CartLineModel> lines)  $default,) {final _that = this;
switch (_that) {
case _CartModel():
return $default(_that.lines);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CartLineModel> lines)?  $default,) {final _that = this;
switch (_that) {
case _CartModel() when $default != null:
return $default(_that.lines);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _CartModel implements CartModel {
  const _CartModel({ List<CartLineModel> lines = const <CartLineModel>[]}): _lines = lines;
  factory _CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

 final  List<CartLineModel> _lines;
@override@JsonKey() List<CartLineModel> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}


/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartModelCopyWith<_CartModel> get copyWith => __$CartModelCopyWithImpl<_CartModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartModel&&const DeepCollectionEquality().equals(other.lines, _lines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_lines));
}

@override
String toString() {
    return 'CartModel(lines: $lines)';
}


}

/// @nodoc
abstract mixin class _$CartModelCopyWith<$Res> implements $CartModelCopyWith<$Res> {
  factory _$CartModelCopyWith(_CartModel value, $Res Function(_CartModel) _then) = __$CartModelCopyWithImpl;
@override @useResult
$Res call({
 List<CartLineModel> lines
});




}
/// @nodoc
class __$CartModelCopyWithImpl<$Res>
    implements _$CartModelCopyWith<$Res> {
  __$CartModelCopyWithImpl(this._self, this._then);

  final _CartModel _self;
  final $Res Function(_CartModel) _then;

/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lines = null,}) {
  return _then(_CartModel(
lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<CartLineModel>,
  ));
}


}

// dart format on
