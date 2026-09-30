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

 String get id; String get title; String get author; String get category; Section get section; BookLanguage get originalLanguage; List<Edition> get editions; double get rating; List<String> get tags; bool get isBeneficial; int get coverSeed; String? get shortTitle;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Book&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.section, _this.section) || other.section == _this.section)&&(identical(other.originalLanguage, _this.originalLanguage) || other.originalLanguage == _this.originalLanguage)&&const DeepCollectionEquality().equals(other.editions, _this.editions)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&(identical(other.isBeneficial, _this.isBeneficial) || other.isBeneficial == _this.isBeneficial)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.shortTitle, _this.shortTitle) || other.shortTitle == _this.shortTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Book;
  return Object.hash(runtimeType,_this.id,_this.title,_this.author,_this.category,_this.section,_this.originalLanguage,const DeepCollectionEquality().hash(_this.editions),_this.rating,const DeepCollectionEquality().hash(_this.tags),_this.isBeneficial,_this.coverSeed,_this.shortTitle);
}

@override
String toString() {
  final _this = this as Book;
  return 'Book(id: ${_this.id}, title: ${_this.title}, author: ${_this.author}, category: ${_this.category}, section: ${_this.section}, originalLanguage: ${_this.originalLanguage}, editions: ${_this.editions}, rating: ${_this.rating}, tags: ${_this.tags}, isBeneficial: ${_this.isBeneficial}, coverSeed: ${_this.coverSeed}, shortTitle: ${_this.shortTitle})';
}


}

/// @nodoc
abstract mixin class $BookCopyWith<$Res>  {
  factory $BookCopyWith(Book value, $Res Function(Book) _then) = _$BookCopyWithImpl;
@useResult
$Res call({
 String id, String title, String author, String category, Section section, BookLanguage originalLanguage, List<Edition> editions, double rating, List<String> tags, bool isBeneficial, int coverSeed, String? shortTitle
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? author = null,Object? category = null,Object? section = null,Object? originalLanguage = null,Object? editions = null,Object? rating = null,Object? tags = null,Object? isBeneficial = null,Object? coverSeed = null,Object? shortTitle = freezed,}) {
  return _then(Book(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as BookLanguage,editions: null == editions ? _self.editions : editions // ignore: cast_nullable_to_non_nullable
as List<Edition>,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,isBeneficial: null == isBeneficial ? _self.isBeneficial : isBeneficial // ignore: cast_nullable_to_non_nullable
as bool,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,shortTitle: freezed == shortTitle ? _self.shortTitle : shortTitle // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String author,  String category,  Section section,  BookLanguage originalLanguage,  List<Edition> editions,  double rating,  List<String> tags,  bool isBeneficial,  int coverSeed,  String? shortTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.category,_that.section,_that.originalLanguage,_that.editions,_that.rating,_that.tags,_that.isBeneficial,_that.coverSeed,_that.shortTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String author,  String category,  Section section,  BookLanguage originalLanguage,  List<Edition> editions,  double rating,  List<String> tags,  bool isBeneficial,  int coverSeed,  String? shortTitle)  $default,) {final _that = this;
switch (_that) {
case _Book():
return $default(_that.id,_that.title,_that.author,_that.category,_that.section,_that.originalLanguage,_that.editions,_that.rating,_that.tags,_that.isBeneficial,_that.coverSeed,_that.shortTitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String author,  String category,  Section section,  BookLanguage originalLanguage,  List<Edition> editions,  double rating,  List<String> tags,  bool isBeneficial,  int coverSeed,  String? shortTitle)?  $default,) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.category,_that.section,_that.originalLanguage,_that.editions,_that.rating,_that.tags,_that.isBeneficial,_that.coverSeed,_that.shortTitle);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Book implements Book {
   _Book({required this.id, required this.title, required this.author, required this.category, required this.section, required this.originalLanguage, required  List<Edition> editions, this.rating = 0,  List<String> tags = const <String>[], this.isBeneficial = false, this.coverSeed = 0, this.shortTitle}): assert(editions.isNotEmpty, 'A Book needs at least one Edition'),_editions = editions,_tags = tags;
  factory _Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

@override final  String id;
@override final  String title;
@override final  String author;
@override final  String category;
@override final  Section section;
@override final  BookLanguage originalLanguage;
 final  List<Edition> _editions;
@override List<Edition> get editions {
  if (_editions is EqualUnmodifiableListView) return _editions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_editions);
}

@override@JsonKey() final  double rating;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  bool isBeneficial;
@override@JsonKey() final  int coverSeed;
@override final  String? shortTitle;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Book&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.category, category) || other.category == category)&&(identical(other.section, section) || other.section == section)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&const DeepCollectionEquality().equals(other.editions, _editions)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.tags, _tags)&&(identical(other.isBeneficial, isBeneficial) || other.isBeneficial == isBeneficial)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.shortTitle, shortTitle) || other.shortTitle == shortTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,author,category,section,originalLanguage,const DeepCollectionEquality().hash(_editions),rating,const DeepCollectionEquality().hash(_tags),isBeneficial,coverSeed,shortTitle);
}

@override
String toString() {
    return 'Book(id: $id, title: $title, author: $author, category: $category, section: $section, originalLanguage: $originalLanguage, editions: $editions, rating: $rating, tags: $tags, isBeneficial: $isBeneficial, coverSeed: $coverSeed, shortTitle: $shortTitle)';
}


}

/// @nodoc
abstract mixin class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) _then) = __$BookCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String author, String category, Section section, BookLanguage originalLanguage, List<Edition> editions, double rating, List<String> tags, bool isBeneficial, int coverSeed, String? shortTitle
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? author = null,Object? category = null,Object? section = null,Object? originalLanguage = null,Object? editions = null,Object? rating = null,Object? tags = null,Object? isBeneficial = null,Object? coverSeed = null,Object? shortTitle = freezed,}) {
  return _then(_Book(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as BookLanguage,editions: null == editions ? _self._editions : editions // ignore: cast_nullable_to_non_nullable
as List<Edition>,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,isBeneficial: null == isBeneficial ? _self.isBeneficial : isBeneficial // ignore: cast_nullable_to_non_nullable
as bool,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,shortTitle: freezed == shortTitle ? _self.shortTitle : shortTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
