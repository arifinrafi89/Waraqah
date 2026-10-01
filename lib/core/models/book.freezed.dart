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

 String get id; String get title; String get author; String get categoryId; String get authorId; String get publisherId; Section get section; BookLanguage get originalLanguage; List<Edition> get editions; DateTime get addedAt; double get rating; List<String> get tags; int get coverSeed; String? get shortTitle; String? get titleBn; bool get hidden; List<int> get classes; List<Exam> get exams; String? get subjectId;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Book&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.authorId, _this.authorId) || other.authorId == _this.authorId)&&(identical(other.publisherId, _this.publisherId) || other.publisherId == _this.publisherId)&&(identical(other.section, _this.section) || other.section == _this.section)&&(identical(other.originalLanguage, _this.originalLanguage) || other.originalLanguage == _this.originalLanguage)&&const DeepCollectionEquality().equals(other.editions, _this.editions)&&(identical(other.addedAt, _this.addedAt) || other.addedAt == _this.addedAt)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.shortTitle, _this.shortTitle) || other.shortTitle == _this.shortTitle)&&(identical(other.titleBn, _this.titleBn) || other.titleBn == _this.titleBn)&&(identical(other.hidden, _this.hidden) || other.hidden == _this.hidden)&&const DeepCollectionEquality().equals(other.classes, _this.classes)&&const DeepCollectionEquality().equals(other.exams, _this.exams)&&(identical(other.subjectId, _this.subjectId) || other.subjectId == _this.subjectId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Book;
  return Object.hashAll([runtimeType,_this.id,_this.title,_this.author,_this.categoryId,_this.authorId,_this.publisherId,_this.section,_this.originalLanguage,const DeepCollectionEquality().hash(_this.editions),_this.addedAt,_this.rating,const DeepCollectionEquality().hash(_this.tags),_this.coverSeed,_this.shortTitle,_this.titleBn,_this.hidden,const DeepCollectionEquality().hash(_this.classes),const DeepCollectionEquality().hash(_this.exams),_this.subjectId]);
}

@override
String toString() {
  final _this = this as Book;
  return 'Book(id: ${_this.id}, title: ${_this.title}, author: ${_this.author}, categoryId: ${_this.categoryId}, authorId: ${_this.authorId}, publisherId: ${_this.publisherId}, section: ${_this.section}, originalLanguage: ${_this.originalLanguage}, editions: ${_this.editions}, addedAt: ${_this.addedAt}, rating: ${_this.rating}, tags: ${_this.tags}, coverSeed: ${_this.coverSeed}, shortTitle: ${_this.shortTitle}, titleBn: ${_this.titleBn}, hidden: ${_this.hidden}, classes: ${_this.classes}, exams: ${_this.exams}, subjectId: ${_this.subjectId})';
}


}

/// @nodoc
abstract mixin class $BookCopyWith<$Res>  {
  factory $BookCopyWith(Book value, $Res Function(Book) _then) = _$BookCopyWithImpl;
@useResult
$Res call({
 String id, String title, String author, String categoryId, String authorId, String publisherId, Section section, BookLanguage originalLanguage, List<Edition> editions, DateTime addedAt, double rating, List<String> tags, int coverSeed, String? shortTitle, String? titleBn, bool hidden, List<int> classes, List<Exam> exams, String? subjectId
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? author = null,Object? categoryId = null,Object? authorId = null,Object? publisherId = null,Object? section = null,Object? originalLanguage = null,Object? editions = null,Object? addedAt = null,Object? rating = null,Object? tags = null,Object? coverSeed = null,Object? shortTitle = freezed,Object? titleBn = freezed,Object? hidden = null,Object? classes = null,Object? exams = null,Object? subjectId = freezed,}) {
  return _then(Book(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,publisherId: null == publisherId ? _self.publisherId : publisherId // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as BookLanguage,editions: null == editions ? _self.editions : editions // ignore: cast_nullable_to_non_nullable
as List<Edition>,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,shortTitle: freezed == shortTitle ? _self.shortTitle : shortTitle // ignore: cast_nullable_to_non_nullable
as String?,titleBn: freezed == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String?,hidden: null == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool,classes: null == classes ? _self.classes : classes // ignore: cast_nullable_to_non_nullable
as List<int>,exams: null == exams ? _self.exams : exams // ignore: cast_nullable_to_non_nullable
as List<Exam>,subjectId: freezed == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String author,  String categoryId,  String authorId,  String publisherId,  Section section,  BookLanguage originalLanguage,  List<Edition> editions,  DateTime addedAt,  double rating,  List<String> tags,  int coverSeed,  String? shortTitle,  String? titleBn,  bool hidden,  List<int> classes,  List<Exam> exams,  String? subjectId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.categoryId,_that.authorId,_that.publisherId,_that.section,_that.originalLanguage,_that.editions,_that.addedAt,_that.rating,_that.tags,_that.coverSeed,_that.shortTitle,_that.titleBn,_that.hidden,_that.classes,_that.exams,_that.subjectId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String author,  String categoryId,  String authorId,  String publisherId,  Section section,  BookLanguage originalLanguage,  List<Edition> editions,  DateTime addedAt,  double rating,  List<String> tags,  int coverSeed,  String? shortTitle,  String? titleBn,  bool hidden,  List<int> classes,  List<Exam> exams,  String? subjectId)  $default,) {final _that = this;
switch (_that) {
case _Book():
return $default(_that.id,_that.title,_that.author,_that.categoryId,_that.authorId,_that.publisherId,_that.section,_that.originalLanguage,_that.editions,_that.addedAt,_that.rating,_that.tags,_that.coverSeed,_that.shortTitle,_that.titleBn,_that.hidden,_that.classes,_that.exams,_that.subjectId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String author,  String categoryId,  String authorId,  String publisherId,  Section section,  BookLanguage originalLanguage,  List<Edition> editions,  DateTime addedAt,  double rating,  List<String> tags,  int coverSeed,  String? shortTitle,  String? titleBn,  bool hidden,  List<int> classes,  List<Exam> exams,  String? subjectId)?  $default,) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.categoryId,_that.authorId,_that.publisherId,_that.section,_that.originalLanguage,_that.editions,_that.addedAt,_that.rating,_that.tags,_that.coverSeed,_that.shortTitle,_that.titleBn,_that.hidden,_that.classes,_that.exams,_that.subjectId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Book implements Book {
   _Book({required this.id, required this.title, required this.author, required this.categoryId, required this.authorId, required this.publisherId, required this.section, required this.originalLanguage, required  List<Edition> editions, required this.addedAt, this.rating = 0,  List<String> tags = const <String>[], this.coverSeed = 0, this.shortTitle, this.titleBn, this.hidden = false,  List<int> classes = const <int>[],  List<Exam> exams = const <Exam>[], this.subjectId}): assert(editions.isNotEmpty, 'A Book needs at least one Edition'),_editions = editions,_tags = tags,_classes = classes,_exams = exams;
  factory _Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

@override final  String id;
@override final  String title;
@override final  String author;
@override final  String categoryId;
@override final  String authorId;
@override final  String publisherId;
@override final  Section section;
@override final  BookLanguage originalLanguage;
 final  List<Edition> _editions;
@override List<Edition> get editions {
  if (_editions is EqualUnmodifiableListView) return _editions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_editions);
}

@override final  DateTime addedAt;
@override@JsonKey() final  double rating;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  int coverSeed;
@override final  String? shortTitle;
@override final  String? titleBn;
@override@JsonKey() final  bool hidden;
 final  List<int> _classes;
@override@JsonKey() List<int> get classes {
  if (_classes is EqualUnmodifiableListView) return _classes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_classes);
}

 final  List<Exam> _exams;
@override@JsonKey() List<Exam> get exams {
  if (_exams is EqualUnmodifiableListView) return _exams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exams);
}

@override final  String? subjectId;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Book&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.publisherId, publisherId) || other.publisherId == publisherId)&&(identical(other.section, section) || other.section == section)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&const DeepCollectionEquality().equals(other.editions, _editions)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.tags, _tags)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.shortTitle, shortTitle) || other.shortTitle == shortTitle)&&(identical(other.titleBn, titleBn) || other.titleBn == titleBn)&&(identical(other.hidden, hidden) || other.hidden == hidden)&&const DeepCollectionEquality().equals(other.classes, _classes)&&const DeepCollectionEquality().equals(other.exams, _exams)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,title,author,categoryId,authorId,publisherId,section,originalLanguage,const DeepCollectionEquality().hash(_editions),addedAt,rating,const DeepCollectionEquality().hash(_tags),coverSeed,shortTitle,titleBn,hidden,const DeepCollectionEquality().hash(_classes),const DeepCollectionEquality().hash(_exams),subjectId]);
}

@override
String toString() {
    return 'Book(id: $id, title: $title, author: $author, categoryId: $categoryId, authorId: $authorId, publisherId: $publisherId, section: $section, originalLanguage: $originalLanguage, editions: $editions, addedAt: $addedAt, rating: $rating, tags: $tags, coverSeed: $coverSeed, shortTitle: $shortTitle, titleBn: $titleBn, hidden: $hidden, classes: $classes, exams: $exams, subjectId: $subjectId)';
}


}

/// @nodoc
abstract mixin class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) _then) = __$BookCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String author, String categoryId, String authorId, String publisherId, Section section, BookLanguage originalLanguage, List<Edition> editions, DateTime addedAt, double rating, List<String> tags, int coverSeed, String? shortTitle, String? titleBn, bool hidden, List<int> classes, List<Exam> exams, String? subjectId
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? author = null,Object? categoryId = null,Object? authorId = null,Object? publisherId = null,Object? section = null,Object? originalLanguage = null,Object? editions = null,Object? addedAt = null,Object? rating = null,Object? tags = null,Object? coverSeed = null,Object? shortTitle = freezed,Object? titleBn = freezed,Object? hidden = null,Object? classes = null,Object? exams = null,Object? subjectId = freezed,}) {
  return _then(_Book(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,publisherId: null == publisherId ? _self.publisherId : publisherId // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as BookLanguage,editions: null == editions ? _self._editions : editions // ignore: cast_nullable_to_non_nullable
as List<Edition>,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,shortTitle: freezed == shortTitle ? _self.shortTitle : shortTitle // ignore: cast_nullable_to_non_nullable
as String?,titleBn: freezed == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String?,hidden: null == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool,classes: null == classes ? _self._classes : classes // ignore: cast_nullable_to_non_nullable
as List<int>,exams: null == exams ? _self._exams : exams // ignore: cast_nullable_to_non_nullable
as List<Exam>,subjectId: freezed == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
