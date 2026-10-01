// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookDraft {

 String? get id; String get title; String get titleBn; String get authorId; String get publisherId; Section get section; String get categoryId; BookLanguage get originalLanguage; int get coverSeed; List<Edition> get editions; List<int> get classes; List<Exam> get exams; String get subjectId;
/// Create a copy of BookDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookDraftCopyWith<BookDraft> get copyWith => _$BookDraftCopyWithImpl<BookDraft>(this as BookDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BookDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookDraft&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.titleBn, _this.titleBn) || other.titleBn == _this.titleBn)&&(identical(other.authorId, _this.authorId) || other.authorId == _this.authorId)&&(identical(other.publisherId, _this.publisherId) || other.publisherId == _this.publisherId)&&(identical(other.section, _this.section) || other.section == _this.section)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.originalLanguage, _this.originalLanguage) || other.originalLanguage == _this.originalLanguage)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&const DeepCollectionEquality().equals(other.editions, _this.editions)&&const DeepCollectionEquality().equals(other.classes, _this.classes)&&const DeepCollectionEquality().equals(other.exams, _this.exams)&&(identical(other.subjectId, _this.subjectId) || other.subjectId == _this.subjectId));
}


@override
int get hashCode {
  final _this = this as BookDraft;
  return Object.hash(runtimeType,_this.id,_this.title,_this.titleBn,_this.authorId,_this.publisherId,_this.section,_this.categoryId,_this.originalLanguage,_this.coverSeed,const DeepCollectionEquality().hash(_this.editions),const DeepCollectionEquality().hash(_this.classes),const DeepCollectionEquality().hash(_this.exams),_this.subjectId);
}

@override
String toString() {
  final _this = this as BookDraft;
  return 'BookDraft(id: ${_this.id}, title: ${_this.title}, titleBn: ${_this.titleBn}, authorId: ${_this.authorId}, publisherId: ${_this.publisherId}, section: ${_this.section}, categoryId: ${_this.categoryId}, originalLanguage: ${_this.originalLanguage}, coverSeed: ${_this.coverSeed}, editions: ${_this.editions}, classes: ${_this.classes}, exams: ${_this.exams}, subjectId: ${_this.subjectId})';
}


}

/// @nodoc
abstract mixin class $BookDraftCopyWith<$Res>  {
  factory $BookDraftCopyWith(BookDraft value, $Res Function(BookDraft) _then) = _$BookDraftCopyWithImpl;
@useResult
$Res call({
 String? id, String title, String titleBn, String authorId, String publisherId, Section section, String categoryId, BookLanguage originalLanguage, int coverSeed, List<Edition> editions, List<int> classes, List<Exam> exams, String subjectId
});




}
/// @nodoc
class _$BookDraftCopyWithImpl<$Res>
    implements $BookDraftCopyWith<$Res> {
  _$BookDraftCopyWithImpl(this._self, this._then);

  final BookDraft _self;
  final $Res Function(BookDraft) _then;

/// Create a copy of BookDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? titleBn = null,Object? authorId = null,Object? publisherId = null,Object? section = null,Object? categoryId = null,Object? originalLanguage = null,Object? coverSeed = null,Object? editions = null,Object? classes = null,Object? exams = null,Object? subjectId = null,}) {
  return _then(BookDraft(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,publisherId: null == publisherId ? _self.publisherId : publisherId // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as BookLanguage,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,editions: null == editions ? _self.editions : editions // ignore: cast_nullable_to_non_nullable
as List<Edition>,classes: null == classes ? _self.classes : classes // ignore: cast_nullable_to_non_nullable
as List<int>,exams: null == exams ? _self.exams : exams // ignore: cast_nullable_to_non_nullable
as List<Exam>,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookDraft].
extension BookDraftPatterns on BookDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookDraft value)  $default,){
final _that = this;
switch (_that) {
case _BookDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookDraft value)?  $default,){
final _that = this;
switch (_that) {
case _BookDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String title,  String titleBn,  String authorId,  String publisherId,  Section section,  String categoryId,  BookLanguage originalLanguage,  int coverSeed,  List<Edition> editions,  List<int> classes,  List<Exam> exams,  String subjectId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookDraft() when $default != null:
return $default(_that.id,_that.title,_that.titleBn,_that.authorId,_that.publisherId,_that.section,_that.categoryId,_that.originalLanguage,_that.coverSeed,_that.editions,_that.classes,_that.exams,_that.subjectId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String title,  String titleBn,  String authorId,  String publisherId,  Section section,  String categoryId,  BookLanguage originalLanguage,  int coverSeed,  List<Edition> editions,  List<int> classes,  List<Exam> exams,  String subjectId)  $default,) {final _that = this;
switch (_that) {
case _BookDraft():
return $default(_that.id,_that.title,_that.titleBn,_that.authorId,_that.publisherId,_that.section,_that.categoryId,_that.originalLanguage,_that.coverSeed,_that.editions,_that.classes,_that.exams,_that.subjectId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String title,  String titleBn,  String authorId,  String publisherId,  Section section,  String categoryId,  BookLanguage originalLanguage,  int coverSeed,  List<Edition> editions,  List<int> classes,  List<Exam> exams,  String subjectId)?  $default,) {final _that = this;
switch (_that) {
case _BookDraft() when $default != null:
return $default(_that.id,_that.title,_that.titleBn,_that.authorId,_that.publisherId,_that.section,_that.categoryId,_that.originalLanguage,_that.coverSeed,_that.editions,_that.classes,_that.exams,_that.subjectId);case _:
  return null;

}
}

}

/// @nodoc


class _BookDraft implements BookDraft {
  const _BookDraft({this.id, this.title = '', this.titleBn = '', this.authorId = '', this.publisherId = '', this.section = Section.academic, this.categoryId = '', this.originalLanguage = BookLanguage.bangla, this.coverSeed = 0,  List<Edition> editions = const <Edition>[],  List<int> classes = const <int>[],  List<Exam> exams = const <Exam>[], this.subjectId = ''}): _editions = editions,_classes = classes,_exams = exams;
  

@override final  String? id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String titleBn;
@override@JsonKey() final  String authorId;
@override@JsonKey() final  String publisherId;
@override@JsonKey() final  Section section;
@override@JsonKey() final  String categoryId;
@override@JsonKey() final  BookLanguage originalLanguage;
@override@JsonKey() final  int coverSeed;
 final  List<Edition> _editions;
@override@JsonKey() List<Edition> get editions {
  if (_editions is EqualUnmodifiableListView) return _editions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_editions);
}

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

@override@JsonKey() final  String subjectId;

/// Create a copy of BookDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookDraftCopyWith<_BookDraft> get copyWith => __$BookDraftCopyWithImpl<_BookDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleBn, titleBn) || other.titleBn == titleBn)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.publisherId, publisherId) || other.publisherId == publisherId)&&(identical(other.section, section) || other.section == section)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&const DeepCollectionEquality().equals(other.editions, _editions)&&const DeepCollectionEquality().equals(other.classes, _classes)&&const DeepCollectionEquality().equals(other.exams, _exams)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,titleBn,authorId,publisherId,section,categoryId,originalLanguage,coverSeed,const DeepCollectionEquality().hash(_editions),const DeepCollectionEquality().hash(_classes),const DeepCollectionEquality().hash(_exams),subjectId);
}

@override
String toString() {
    return 'BookDraft(id: $id, title: $title, titleBn: $titleBn, authorId: $authorId, publisherId: $publisherId, section: $section, categoryId: $categoryId, originalLanguage: $originalLanguage, coverSeed: $coverSeed, editions: $editions, classes: $classes, exams: $exams, subjectId: $subjectId)';
}


}

/// @nodoc
abstract mixin class _$BookDraftCopyWith<$Res> implements $BookDraftCopyWith<$Res> {
  factory _$BookDraftCopyWith(_BookDraft value, $Res Function(_BookDraft) _then) = __$BookDraftCopyWithImpl;
@override @useResult
$Res call({
 String? id, String title, String titleBn, String authorId, String publisherId, Section section, String categoryId, BookLanguage originalLanguage, int coverSeed, List<Edition> editions, List<int> classes, List<Exam> exams, String subjectId
});




}
/// @nodoc
class __$BookDraftCopyWithImpl<$Res>
    implements _$BookDraftCopyWith<$Res> {
  __$BookDraftCopyWithImpl(this._self, this._then);

  final _BookDraft _self;
  final $Res Function(_BookDraft) _then;

/// Create a copy of BookDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? titleBn = null,Object? authorId = null,Object? publisherId = null,Object? section = null,Object? categoryId = null,Object? originalLanguage = null,Object? coverSeed = null,Object? editions = null,Object? classes = null,Object? exams = null,Object? subjectId = null,}) {
  return _then(_BookDraft(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,publisherId: null == publisherId ? _self.publisherId : publisherId // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as BookLanguage,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,editions: null == editions ? _self._editions : editions // ignore: cast_nullable_to_non_nullable
as List<Edition>,classes: null == classes ? _self._classes : classes // ignore: cast_nullable_to_non_nullable
as List<int>,exams: null == exams ? _self._exams : exams // ignore: cast_nullable_to_non_nullable
as List<Exam>,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
