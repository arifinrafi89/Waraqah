// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Book {

 String get id; String get title; String get author; int get priceBdt; String get vendor; int get vendorCount; double get rating; List<String> get tags; bool get isBeneficial; bool get isBestValue; int get coverSeed; int? get originalPriceBdt; String? get shortTitle; String? get category;
/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookCopyWith<Book> get copyWith => _$BookCopyWithImpl<Book>(this as Book, _$identity);

  /// Serializes this Book to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Book;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Book&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.vendor, _this.vendor) || other.vendor == _this.vendor)&&(identical(other.vendorCount, _this.vendorCount) || other.vendorCount == _this.vendorCount)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&(identical(other.isBeneficial, _this.isBeneficial) || other.isBeneficial == _this.isBeneficial)&&(identical(other.isBestValue, _this.isBestValue) || other.isBestValue == _this.isBestValue)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.originalPriceBdt, _this.originalPriceBdt) || other.originalPriceBdt == _this.originalPriceBdt)&&(identical(other.shortTitle, _this.shortTitle) || other.shortTitle == _this.shortTitle)&&(identical(other.category, _this.category) || other.category == _this.category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Book;
  return Object.hash(runtimeType,_this.id,_this.title,_this.author,_this.priceBdt,_this.vendor,_this.vendorCount,_this.rating,const DeepCollectionEquality().hash(_this.tags),_this.isBeneficial,_this.isBestValue,_this.coverSeed,_this.originalPriceBdt,_this.shortTitle,_this.category);
}

@override
String toString() {
  final _this = this as Book;
  return 'Book(id: ${_this.id}, title: ${_this.title}, author: ${_this.author}, priceBdt: ${_this.priceBdt}, vendor: ${_this.vendor}, vendorCount: ${_this.vendorCount}, rating: ${_this.rating}, tags: ${_this.tags}, isBeneficial: ${_this.isBeneficial}, isBestValue: ${_this.isBestValue}, coverSeed: ${_this.coverSeed}, originalPriceBdt: ${_this.originalPriceBdt}, shortTitle: ${_this.shortTitle}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $BookCopyWith<$Res>  {
  factory $BookCopyWith(Book value, $Res Function(Book) _then) = _$BookCopyWithImpl;
@useResult
$Res call({
 String id, String title, String author, int priceBdt, String vendor, int vendorCount, double rating, List<String> tags, bool isBeneficial, bool isBestValue, int coverSeed, int? originalPriceBdt, String? shortTitle, String? category
});




}
/// @nodoc
class _$BookCopyWithImpl<$Res>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._self, this._then);

  final Book _self;
  final $Res Function(Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? author = null,Object? priceBdt = null,Object? vendor = null,Object? vendorCount = null,Object? rating = null,Object? tags = null,Object? isBeneficial = null,Object? isBestValue = null,Object? coverSeed = null,Object? originalPriceBdt = freezed,Object? shortTitle = freezed,Object? category = freezed,}) {
  return _then(Book(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,vendor: null == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String,vendorCount: null == vendorCount ? _self.vendorCount : vendorCount // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,isBeneficial: null == isBeneficial ? _self.isBeneficial : isBeneficial // ignore: cast_nullable_to_non_nullable
as bool,isBestValue: null == isBestValue ? _self.isBestValue : isBestValue // ignore: cast_nullable_to_non_nullable
as bool,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,originalPriceBdt: freezed == originalPriceBdt ? _self.originalPriceBdt : originalPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,shortTitle: freezed == shortTitle ? _self.shortTitle : shortTitle // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Book].
extension BookPatterns on Book {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Book value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Book() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Book value)  $default,){
final _that = this;
switch (_that) {
case _Book():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Book value)?  $default,){
final _that = this;
switch (_that) {
case _Book() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String author,  int priceBdt,  String vendor,  int vendorCount,  double rating,  List<String> tags,  bool isBeneficial,  bool isBestValue,  int coverSeed,  int? originalPriceBdt,  String? shortTitle,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.priceBdt,_that.vendor,_that.vendorCount,_that.rating,_that.tags,_that.isBeneficial,_that.isBestValue,_that.coverSeed,_that.originalPriceBdt,_that.shortTitle,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String author,  int priceBdt,  String vendor,  int vendorCount,  double rating,  List<String> tags,  bool isBeneficial,  bool isBestValue,  int coverSeed,  int? originalPriceBdt,  String? shortTitle,  String? category)  $default,) {final _that = this;
switch (_that) {
case _Book():
return $default(_that.id,_that.title,_that.author,_that.priceBdt,_that.vendor,_that.vendorCount,_that.rating,_that.tags,_that.isBeneficial,_that.isBestValue,_that.coverSeed,_that.originalPriceBdt,_that.shortTitle,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String author,  int priceBdt,  String vendor,  int vendorCount,  double rating,  List<String> tags,  bool isBeneficial,  bool isBestValue,  int coverSeed,  int? originalPriceBdt,  String? shortTitle,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.priceBdt,_that.vendor,_that.vendorCount,_that.rating,_that.tags,_that.isBeneficial,_that.isBestValue,_that.coverSeed,_that.originalPriceBdt,_that.shortTitle,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Book implements Book {
  const _Book({required this.id, required this.title, required this.author, required this.priceBdt, required this.vendor, this.vendorCount = 1, this.rating = 0,  List<String> tags = const <String>[], this.isBeneficial = false, this.isBestValue = false, this.coverSeed = 0, this.originalPriceBdt, this.shortTitle, this.category}): _tags = tags;
  factory _Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

@override final  String id;
@override final  String title;
@override final  String author;
@override final  int priceBdt;
@override final  String vendor;
@override@JsonKey() final  int vendorCount;
@override@JsonKey() final  double rating;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  bool isBeneficial;
@override@JsonKey() final  bool isBestValue;
@override@JsonKey() final  int coverSeed;
@override final  int? originalPriceBdt;
@override final  String? shortTitle;
@override final  String? category;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookCopyWith<_Book> get copyWith => __$BookCopyWithImpl<_Book>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Book&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.vendorCount, vendorCount) || other.vendorCount == vendorCount)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.tags, _tags)&&(identical(other.isBeneficial, isBeneficial) || other.isBeneficial == isBeneficial)&&(identical(other.isBestValue, isBestValue) || other.isBestValue == isBestValue)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.originalPriceBdt, originalPriceBdt) || other.originalPriceBdt == originalPriceBdt)&&(identical(other.shortTitle, shortTitle) || other.shortTitle == shortTitle)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,author,priceBdt,vendor,vendorCount,rating,const DeepCollectionEquality().hash(_tags),isBeneficial,isBestValue,coverSeed,originalPriceBdt,shortTitle,category);
}

@override
String toString() {
    return 'Book(id: $id, title: $title, author: $author, priceBdt: $priceBdt, vendor: $vendor, vendorCount: $vendorCount, rating: $rating, tags: $tags, isBeneficial: $isBeneficial, isBestValue: $isBestValue, coverSeed: $coverSeed, originalPriceBdt: $originalPriceBdt, shortTitle: $shortTitle, category: $category)';
}


}

/// @nodoc
abstract mixin class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) _then) = __$BookCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String author, int priceBdt, String vendor, int vendorCount, double rating, List<String> tags, bool isBeneficial, bool isBestValue, int coverSeed, int? originalPriceBdt, String? shortTitle, String? category
});




}
/// @nodoc
class __$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(this._self, this._then);

  final _Book _self;
  final $Res Function(_Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? author = null,Object? priceBdt = null,Object? vendor = null,Object? vendorCount = null,Object? rating = null,Object? tags = null,Object? isBeneficial = null,Object? isBestValue = null,Object? coverSeed = null,Object? originalPriceBdt = freezed,Object? shortTitle = freezed,Object? category = freezed,}) {
  return _then(_Book(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,vendor: null == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String,vendorCount: null == vendorCount ? _self.vendorCount : vendorCount // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,isBeneficial: null == isBeneficial ? _self.isBeneficial : isBeneficial // ignore: cast_nullable_to_non_nullable
as bool,isBestValue: null == isBestValue ? _self.isBestValue : isBestValue // ignore: cast_nullable_to_non_nullable
as bool,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,originalPriceBdt: freezed == originalPriceBdt ? _self.originalPriceBdt : originalPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,shortTitle: freezed == shortTitle ? _self.shortTitle : shortTitle // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
