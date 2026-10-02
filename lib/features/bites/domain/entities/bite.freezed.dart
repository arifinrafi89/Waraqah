// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Bite {

 String get id; String get authorId; String get authorName; String get authorArea; String get text; DateTime get createdAt; DateTime? get editedAt; String? get bookId; String? get bookTitle; bool get spoiler; int get likes; bool get liked; int get comments; bool get isMine;
/// Create a copy of Bite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiteCopyWith<Bite> get copyWith => _$BiteCopyWithImpl<Bite>(this as Bite, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Bite;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bite&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.authorId, _this.authorId) || other.authorId == _this.authorId)&&(identical(other.authorName, _this.authorName) || other.authorName == _this.authorName)&&(identical(other.authorArea, _this.authorArea) || other.authorArea == _this.authorArea)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.editedAt, _this.editedAt) || other.editedAt == _this.editedAt)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.bookTitle, _this.bookTitle) || other.bookTitle == _this.bookTitle)&&(identical(other.spoiler, _this.spoiler) || other.spoiler == _this.spoiler)&&(identical(other.likes, _this.likes) || other.likes == _this.likes)&&(identical(other.liked, _this.liked) || other.liked == _this.liked)&&(identical(other.comments, _this.comments) || other.comments == _this.comments)&&(identical(other.isMine, _this.isMine) || other.isMine == _this.isMine));
}


@override
int get hashCode {
  final _this = this as Bite;
  return Object.hash(runtimeType,_this.id,_this.authorId,_this.authorName,_this.authorArea,_this.text,_this.createdAt,_this.editedAt,_this.bookId,_this.bookTitle,_this.spoiler,_this.likes,_this.liked,_this.comments,_this.isMine);
}

@override
String toString() {
  final _this = this as Bite;
  return 'Bite(id: ${_this.id}, authorId: ${_this.authorId}, authorName: ${_this.authorName}, authorArea: ${_this.authorArea}, text: ${_this.text}, createdAt: ${_this.createdAt}, editedAt: ${_this.editedAt}, bookId: ${_this.bookId}, bookTitle: ${_this.bookTitle}, spoiler: ${_this.spoiler}, likes: ${_this.likes}, liked: ${_this.liked}, comments: ${_this.comments}, isMine: ${_this.isMine})';
}


}

/// @nodoc
abstract mixin class $BiteCopyWith<$Res>  {
  factory $BiteCopyWith(Bite value, $Res Function(Bite) _then) = _$BiteCopyWithImpl;
@useResult
$Res call({
 String id, String authorId, String authorName, String authorArea, String text, DateTime createdAt, DateTime? editedAt, String? bookId, String? bookTitle, bool spoiler, int likes, bool liked, int comments, bool isMine
});




}
/// @nodoc
class _$BiteCopyWithImpl<$Res>
    implements $BiteCopyWith<$Res> {
  _$BiteCopyWithImpl(this._self, this._then);

  final Bite _self;
  final $Res Function(Bite) _then;

/// Create a copy of Bite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorId = null,Object? authorName = null,Object? authorArea = null,Object? text = null,Object? createdAt = null,Object? editedAt = freezed,Object? bookId = freezed,Object? bookTitle = freezed,Object? spoiler = null,Object? likes = null,Object? liked = null,Object? comments = null,Object? isMine = null,}) {
  return _then(Bite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorArea: null == authorArea ? _self.authorArea : authorArea // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,bookTitle: freezed == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String?,spoiler: null == spoiler ? _self.spoiler : spoiler // ignore: cast_nullable_to_non_nullable
as bool,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as int,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Bite].
extension BitePatterns on Bite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bite value)  $default,){
final _that = this;
switch (_that) {
case _Bite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bite value)?  $default,){
final _that = this;
switch (_that) {
case _Bite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String authorId,  String authorName,  String authorArea,  String text,  DateTime createdAt,  DateTime? editedAt,  String? bookId,  String? bookTitle,  bool spoiler,  int likes,  bool liked,  int comments,  bool isMine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bite() when $default != null:
return $default(_that.id,_that.authorId,_that.authorName,_that.authorArea,_that.text,_that.createdAt,_that.editedAt,_that.bookId,_that.bookTitle,_that.spoiler,_that.likes,_that.liked,_that.comments,_that.isMine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String authorId,  String authorName,  String authorArea,  String text,  DateTime createdAt,  DateTime? editedAt,  String? bookId,  String? bookTitle,  bool spoiler,  int likes,  bool liked,  int comments,  bool isMine)  $default,) {final _that = this;
switch (_that) {
case _Bite():
return $default(_that.id,_that.authorId,_that.authorName,_that.authorArea,_that.text,_that.createdAt,_that.editedAt,_that.bookId,_that.bookTitle,_that.spoiler,_that.likes,_that.liked,_that.comments,_that.isMine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String authorId,  String authorName,  String authorArea,  String text,  DateTime createdAt,  DateTime? editedAt,  String? bookId,  String? bookTitle,  bool spoiler,  int likes,  bool liked,  int comments,  bool isMine)?  $default,) {final _that = this;
switch (_that) {
case _Bite() when $default != null:
return $default(_that.id,_that.authorId,_that.authorName,_that.authorArea,_that.text,_that.createdAt,_that.editedAt,_that.bookId,_that.bookTitle,_that.spoiler,_that.likes,_that.liked,_that.comments,_that.isMine);case _:
  return null;

}
}

}

/// @nodoc


class _Bite implements Bite {
  const _Bite({required this.id, required this.authorId, required this.authorName, required this.authorArea, required this.text, required this.createdAt, this.editedAt, this.bookId, this.bookTitle, this.spoiler = false, this.likes = 0, this.liked = false, this.comments = 0, this.isMine = false});
  

@override final  String id;
@override final  String authorId;
@override final  String authorName;
@override final  String authorArea;
@override final  String text;
@override final  DateTime createdAt;
@override final  DateTime? editedAt;
@override final  String? bookId;
@override final  String? bookTitle;
@override@JsonKey() final  bool spoiler;
@override@JsonKey() final  int likes;
@override@JsonKey() final  bool liked;
@override@JsonKey() final  int comments;
@override@JsonKey() final  bool isMine;

/// Create a copy of Bite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiteCopyWith<_Bite> get copyWith => __$BiteCopyWithImpl<_Bite>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bite&&(identical(other.id, id) || other.id == id)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorArea, authorArea) || other.authorArea == authorArea)&&(identical(other.text, text) || other.text == text)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.spoiler, spoiler) || other.spoiler == spoiler)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.isMine, isMine) || other.isMine == isMine));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,authorId,authorName,authorArea,text,createdAt,editedAt,bookId,bookTitle,spoiler,likes,liked,comments,isMine);
}

@override
String toString() {
    return 'Bite(id: $id, authorId: $authorId, authorName: $authorName, authorArea: $authorArea, text: $text, createdAt: $createdAt, editedAt: $editedAt, bookId: $bookId, bookTitle: $bookTitle, spoiler: $spoiler, likes: $likes, liked: $liked, comments: $comments, isMine: $isMine)';
}


}

/// @nodoc
abstract mixin class _$BiteCopyWith<$Res> implements $BiteCopyWith<$Res> {
  factory _$BiteCopyWith(_Bite value, $Res Function(_Bite) _then) = __$BiteCopyWithImpl;
@override @useResult
$Res call({
 String id, String authorId, String authorName, String authorArea, String text, DateTime createdAt, DateTime? editedAt, String? bookId, String? bookTitle, bool spoiler, int likes, bool liked, int comments, bool isMine
});




}
/// @nodoc
class __$BiteCopyWithImpl<$Res>
    implements _$BiteCopyWith<$Res> {
  __$BiteCopyWithImpl(this._self, this._then);

  final _Bite _self;
  final $Res Function(_Bite) _then;

/// Create a copy of Bite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorId = null,Object? authorName = null,Object? authorArea = null,Object? text = null,Object? createdAt = null,Object? editedAt = freezed,Object? bookId = freezed,Object? bookTitle = freezed,Object? spoiler = null,Object? likes = null,Object? liked = null,Object? comments = null,Object? isMine = null,}) {
  return _then(_Bite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorArea: null == authorArea ? _self.authorArea : authorArea // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,bookTitle: freezed == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String?,spoiler: null == spoiler ? _self.spoiler : spoiler // ignore: cast_nullable_to_non_nullable
as bool,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as int,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$BiteComment {

 String get id; String get authorId; String get authorName; String get text; DateTime get createdAt; String? get parentId; bool get isMine; List<BiteComment> get replies;
/// Create a copy of BiteComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiteCommentCopyWith<BiteComment> get copyWith => _$BiteCommentCopyWithImpl<BiteComment>(this as BiteComment, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BiteComment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiteComment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.authorId, _this.authorId) || other.authorId == _this.authorId)&&(identical(other.authorName, _this.authorName) || other.authorName == _this.authorName)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.parentId, _this.parentId) || other.parentId == _this.parentId)&&(identical(other.isMine, _this.isMine) || other.isMine == _this.isMine)&&const DeepCollectionEquality().equals(other.replies, _this.replies));
}


@override
int get hashCode {
  final _this = this as BiteComment;
  return Object.hash(runtimeType,_this.id,_this.authorId,_this.authorName,_this.text,_this.createdAt,_this.parentId,_this.isMine,const DeepCollectionEquality().hash(_this.replies));
}

@override
String toString() {
  final _this = this as BiteComment;
  return 'BiteComment(id: ${_this.id}, authorId: ${_this.authorId}, authorName: ${_this.authorName}, text: ${_this.text}, createdAt: ${_this.createdAt}, parentId: ${_this.parentId}, isMine: ${_this.isMine}, replies: ${_this.replies})';
}


}

/// @nodoc
abstract mixin class $BiteCommentCopyWith<$Res>  {
  factory $BiteCommentCopyWith(BiteComment value, $Res Function(BiteComment) _then) = _$BiteCommentCopyWithImpl;
@useResult
$Res call({
 String id, String authorId, String authorName, String text, DateTime createdAt, String? parentId, bool isMine, List<BiteComment> replies
});




}
/// @nodoc
class _$BiteCommentCopyWithImpl<$Res>
    implements $BiteCommentCopyWith<$Res> {
  _$BiteCommentCopyWithImpl(this._self, this._then);

  final BiteComment _self;
  final $Res Function(BiteComment) _then;

/// Create a copy of BiteComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorId = null,Object? authorName = null,Object? text = null,Object? createdAt = null,Object? parentId = freezed,Object? isMine = null,Object? replies = null,}) {
  return _then(BiteComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as List<BiteComment>,
  ));
}

}


/// Adds pattern-matching-related methods to [BiteComment].
extension BiteCommentPatterns on BiteComment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiteComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiteComment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiteComment value)  $default,){
final _that = this;
switch (_that) {
case _BiteComment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiteComment value)?  $default,){
final _that = this;
switch (_that) {
case _BiteComment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String authorId,  String authorName,  String text,  DateTime createdAt,  String? parentId,  bool isMine,  List<BiteComment> replies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiteComment() when $default != null:
return $default(_that.id,_that.authorId,_that.authorName,_that.text,_that.createdAt,_that.parentId,_that.isMine,_that.replies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String authorId,  String authorName,  String text,  DateTime createdAt,  String? parentId,  bool isMine,  List<BiteComment> replies)  $default,) {final _that = this;
switch (_that) {
case _BiteComment():
return $default(_that.id,_that.authorId,_that.authorName,_that.text,_that.createdAt,_that.parentId,_that.isMine,_that.replies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String authorId,  String authorName,  String text,  DateTime createdAt,  String? parentId,  bool isMine,  List<BiteComment> replies)?  $default,) {final _that = this;
switch (_that) {
case _BiteComment() when $default != null:
return $default(_that.id,_that.authorId,_that.authorName,_that.text,_that.createdAt,_that.parentId,_that.isMine,_that.replies);case _:
  return null;

}
}

}

/// @nodoc


class _BiteComment implements BiteComment {
  const _BiteComment({required this.id, required this.authorId, required this.authorName, required this.text, required this.createdAt, this.parentId, this.isMine = false,  List<BiteComment> replies = const <BiteComment>[]}): _replies = replies;
  

@override final  String id;
@override final  String authorId;
@override final  String authorName;
@override final  String text;
@override final  DateTime createdAt;
@override final  String? parentId;
@override@JsonKey() final  bool isMine;
 final  List<BiteComment> _replies;
@override@JsonKey() List<BiteComment> get replies {
  if (_replies is EqualUnmodifiableListView) return _replies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_replies);
}


/// Create a copy of BiteComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiteCommentCopyWith<_BiteComment> get copyWith => __$BiteCommentCopyWithImpl<_BiteComment>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiteComment&&(identical(other.id, id) || other.id == id)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.text, text) || other.text == text)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.isMine, isMine) || other.isMine == isMine)&&const DeepCollectionEquality().equals(other.replies, _replies));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,authorId,authorName,text,createdAt,parentId,isMine,const DeepCollectionEquality().hash(_replies));
}

@override
String toString() {
    return 'BiteComment(id: $id, authorId: $authorId, authorName: $authorName, text: $text, createdAt: $createdAt, parentId: $parentId, isMine: $isMine, replies: $replies)';
}


}

/// @nodoc
abstract mixin class _$BiteCommentCopyWith<$Res> implements $BiteCommentCopyWith<$Res> {
  factory _$BiteCommentCopyWith(_BiteComment value, $Res Function(_BiteComment) _then) = __$BiteCommentCopyWithImpl;
@override @useResult
$Res call({
 String id, String authorId, String authorName, String text, DateTime createdAt, String? parentId, bool isMine, List<BiteComment> replies
});




}
/// @nodoc
class __$BiteCommentCopyWithImpl<$Res>
    implements _$BiteCommentCopyWith<$Res> {
  __$BiteCommentCopyWithImpl(this._self, this._then);

  final _BiteComment _self;
  final $Res Function(_BiteComment) _then;

/// Create a copy of BiteComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorId = null,Object? authorName = null,Object? text = null,Object? createdAt = null,Object? parentId = freezed,Object? isMine = null,Object? replies = null,}) {
  return _then(_BiteComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,replies: null == replies ? _self._replies : replies // ignore: cast_nullable_to_non_nullable
as List<BiteComment>,
  ));
}


}

/// @nodoc
mixin _$BiteDetail {

 Bite get bite; List<BiteComment> get comments;
/// Create a copy of BiteDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiteDetailCopyWith<BiteDetail> get copyWith => _$BiteDetailCopyWithImpl<BiteDetail>(this as BiteDetail, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BiteDetail;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiteDetail&&(identical(other.bite, _this.bite) || other.bite == _this.bite)&&const DeepCollectionEquality().equals(other.comments, _this.comments));
}


@override
int get hashCode {
  final _this = this as BiteDetail;
  return Object.hash(runtimeType,_this.bite,const DeepCollectionEquality().hash(_this.comments));
}

@override
String toString() {
  final _this = this as BiteDetail;
  return 'BiteDetail(bite: ${_this.bite}, comments: ${_this.comments})';
}


}

/// @nodoc
abstract mixin class $BiteDetailCopyWith<$Res>  {
  factory $BiteDetailCopyWith(BiteDetail value, $Res Function(BiteDetail) _then) = _$BiteDetailCopyWithImpl;
@useResult
$Res call({
 Bite bite, List<BiteComment> comments
});


$BiteCopyWith<$Res> get bite;

}
/// @nodoc
class _$BiteDetailCopyWithImpl<$Res>
    implements $BiteDetailCopyWith<$Res> {
  _$BiteDetailCopyWithImpl(this._self, this._then);

  final BiteDetail _self;
  final $Res Function(BiteDetail) _then;

/// Create a copy of BiteDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bite = null,Object? comments = null,}) {
  return _then(BiteDetail(
bite: null == bite ? _self.bite : bite // ignore: cast_nullable_to_non_nullable
as Bite,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<BiteComment>,
  ));
}
/// Create a copy of BiteDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BiteCopyWith<$Res> get bite {
  
  return $BiteCopyWith<$Res>(_self.bite, (value) {
    return _then(_self.copyWith(bite: value));
  });
}
}


/// Adds pattern-matching-related methods to [BiteDetail].
extension BiteDetailPatterns on BiteDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiteDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiteDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiteDetail value)  $default,){
final _that = this;
switch (_that) {
case _BiteDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiteDetail value)?  $default,){
final _that = this;
switch (_that) {
case _BiteDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Bite bite,  List<BiteComment> comments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiteDetail() when $default != null:
return $default(_that.bite,_that.comments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Bite bite,  List<BiteComment> comments)  $default,) {final _that = this;
switch (_that) {
case _BiteDetail():
return $default(_that.bite,_that.comments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Bite bite,  List<BiteComment> comments)?  $default,) {final _that = this;
switch (_that) {
case _BiteDetail() when $default != null:
return $default(_that.bite,_that.comments);case _:
  return null;

}
}

}

/// @nodoc


class _BiteDetail implements BiteDetail {
  const _BiteDetail({required this.bite,  List<BiteComment> comments = const <BiteComment>[]}): _comments = comments;
  

@override final  Bite bite;
 final  List<BiteComment> _comments;
@override@JsonKey() List<BiteComment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of BiteDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiteDetailCopyWith<_BiteDetail> get copyWith => __$BiteDetailCopyWithImpl<_BiteDetail>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiteDetail&&(identical(other.bite, bite) || other.bite == bite)&&const DeepCollectionEquality().equals(other.comments, _comments));
}


@override
int get hashCode {
    return Object.hash(runtimeType,bite,const DeepCollectionEquality().hash(_comments));
}

@override
String toString() {
    return 'BiteDetail(bite: $bite, comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$BiteDetailCopyWith<$Res> implements $BiteDetailCopyWith<$Res> {
  factory _$BiteDetailCopyWith(_BiteDetail value, $Res Function(_BiteDetail) _then) = __$BiteDetailCopyWithImpl;
@override @useResult
$Res call({
 Bite bite, List<BiteComment> comments
});


@override $BiteCopyWith<$Res> get bite;

}
/// @nodoc
class __$BiteDetailCopyWithImpl<$Res>
    implements _$BiteDetailCopyWith<$Res> {
  __$BiteDetailCopyWithImpl(this._self, this._then);

  final _BiteDetail _self;
  final $Res Function(_BiteDetail) _then;

/// Create a copy of BiteDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bite = null,Object? comments = null,}) {
  return _then(_BiteDetail(
bite: null == bite ? _self.bite : bite // ignore: cast_nullable_to_non_nullable
as Bite,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<BiteComment>,
  ));
}

/// Create a copy of BiteDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BiteCopyWith<$Res> get bite {
  
  return $BiteCopyWith<$Res>(_self.bite, (value) {
    return _then(_self.copyWith(bite: value));
  });
}
}

// dart format on
