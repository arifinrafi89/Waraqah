// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BiteModel {

 String get id; String get authorId; String get authorName; String get authorArea; String get text; DateTime get createdAt; DateTime? get editedAt; String? get bookId; String? get bookTitle; bool get spoiler; int get likes; bool get liked; int get comments; bool get isMine;
/// Create a copy of BiteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiteModelCopyWith<BiteModel> get copyWith => _$BiteModelCopyWithImpl<BiteModel>(this as BiteModel, _$identity);

  /// Serializes this BiteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BiteModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiteModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.authorId, _this.authorId) || other.authorId == _this.authorId)&&(identical(other.authorName, _this.authorName) || other.authorName == _this.authorName)&&(identical(other.authorArea, _this.authorArea) || other.authorArea == _this.authorArea)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.editedAt, _this.editedAt) || other.editedAt == _this.editedAt)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.bookTitle, _this.bookTitle) || other.bookTitle == _this.bookTitle)&&(identical(other.spoiler, _this.spoiler) || other.spoiler == _this.spoiler)&&(identical(other.likes, _this.likes) || other.likes == _this.likes)&&(identical(other.liked, _this.liked) || other.liked == _this.liked)&&(identical(other.comments, _this.comments) || other.comments == _this.comments)&&(identical(other.isMine, _this.isMine) || other.isMine == _this.isMine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BiteModel;
  return Object.hash(runtimeType,_this.id,_this.authorId,_this.authorName,_this.authorArea,_this.text,_this.createdAt,_this.editedAt,_this.bookId,_this.bookTitle,_this.spoiler,_this.likes,_this.liked,_this.comments,_this.isMine);
}

@override
String toString() {
  final _this = this as BiteModel;
  return 'BiteModel(id: ${_this.id}, authorId: ${_this.authorId}, authorName: ${_this.authorName}, authorArea: ${_this.authorArea}, text: ${_this.text}, createdAt: ${_this.createdAt}, editedAt: ${_this.editedAt}, bookId: ${_this.bookId}, bookTitle: ${_this.bookTitle}, spoiler: ${_this.spoiler}, likes: ${_this.likes}, liked: ${_this.liked}, comments: ${_this.comments}, isMine: ${_this.isMine})';
}


}

/// @nodoc
abstract mixin class $BiteModelCopyWith<$Res>  {
  factory $BiteModelCopyWith(BiteModel value, $Res Function(BiteModel) _then) = _$BiteModelCopyWithImpl;
@useResult
$Res call({
 String id, String authorId, String authorName, String authorArea, String text, DateTime createdAt, DateTime? editedAt, String? bookId, String? bookTitle, bool spoiler, int likes, bool liked, int comments, bool isMine
});




}
/// @nodoc
class _$BiteModelCopyWithImpl<$Res>
    implements $BiteModelCopyWith<$Res> {
  _$BiteModelCopyWithImpl(this._self, this._then);

  final BiteModel _self;
  final $Res Function(BiteModel) _then;

/// Create a copy of BiteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorId = null,Object? authorName = null,Object? authorArea = null,Object? text = null,Object? createdAt = null,Object? editedAt = freezed,Object? bookId = freezed,Object? bookTitle = freezed,Object? spoiler = null,Object? likes = null,Object? liked = null,Object? comments = null,Object? isMine = null,}) {
  return _then(BiteModel(
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


/// Adds pattern-matching-related methods to [BiteModel].
extension BiteModelPatterns on BiteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiteModel value)  $default,){
final _that = this;
switch (_that) {
case _BiteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiteModel value)?  $default,){
final _that = this;
switch (_that) {
case _BiteModel() when $default != null:
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
case _BiteModel() when $default != null:
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
case _BiteModel():
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
case _BiteModel() when $default != null:
return $default(_that.id,_that.authorId,_that.authorName,_that.authorArea,_that.text,_that.createdAt,_that.editedAt,_that.bookId,_that.bookTitle,_that.spoiler,_that.likes,_that.liked,_that.comments,_that.isMine);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BiteModel implements BiteModel {
  const _BiteModel({required this.id, required this.authorId, required this.authorName, required this.authorArea, required this.text, required this.createdAt, this.editedAt, this.bookId, this.bookTitle, this.spoiler = false, this.likes = 0, this.liked = false, this.comments = 0, this.isMine = false});
  factory _BiteModel.fromJson(Map<String, dynamic> json) => _$BiteModelFromJson(json);

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

/// Create a copy of BiteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiteModelCopyWith<_BiteModel> get copyWith => __$BiteModelCopyWithImpl<_BiteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BiteModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorArea, authorArea) || other.authorArea == authorArea)&&(identical(other.text, text) || other.text == text)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.spoiler, spoiler) || other.spoiler == spoiler)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.isMine, isMine) || other.isMine == isMine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,authorId,authorName,authorArea,text,createdAt,editedAt,bookId,bookTitle,spoiler,likes,liked,comments,isMine);
}

@override
String toString() {
    return 'BiteModel(id: $id, authorId: $authorId, authorName: $authorName, authorArea: $authorArea, text: $text, createdAt: $createdAt, editedAt: $editedAt, bookId: $bookId, bookTitle: $bookTitle, spoiler: $spoiler, likes: $likes, liked: $liked, comments: $comments, isMine: $isMine)';
}


}

/// @nodoc
abstract mixin class _$BiteModelCopyWith<$Res> implements $BiteModelCopyWith<$Res> {
  factory _$BiteModelCopyWith(_BiteModel value, $Res Function(_BiteModel) _then) = __$BiteModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String authorId, String authorName, String authorArea, String text, DateTime createdAt, DateTime? editedAt, String? bookId, String? bookTitle, bool spoiler, int likes, bool liked, int comments, bool isMine
});




}
/// @nodoc
class __$BiteModelCopyWithImpl<$Res>
    implements _$BiteModelCopyWith<$Res> {
  __$BiteModelCopyWithImpl(this._self, this._then);

  final _BiteModel _self;
  final $Res Function(_BiteModel) _then;

/// Create a copy of BiteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorId = null,Object? authorName = null,Object? authorArea = null,Object? text = null,Object? createdAt = null,Object? editedAt = freezed,Object? bookId = freezed,Object? bookTitle = freezed,Object? spoiler = null,Object? likes = null,Object? liked = null,Object? comments = null,Object? isMine = null,}) {
  return _then(_BiteModel(
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
mixin _$BiteCommentModel {

 String get id; String get authorId; String get authorName; String get text; DateTime get createdAt; String? get parentId; bool get isMine; List<BiteCommentModel> get replies;
/// Create a copy of BiteCommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiteCommentModelCopyWith<BiteCommentModel> get copyWith => _$BiteCommentModelCopyWithImpl<BiteCommentModel>(this as BiteCommentModel, _$identity);

  /// Serializes this BiteCommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BiteCommentModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiteCommentModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.authorId, _this.authorId) || other.authorId == _this.authorId)&&(identical(other.authorName, _this.authorName) || other.authorName == _this.authorName)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.parentId, _this.parentId) || other.parentId == _this.parentId)&&(identical(other.isMine, _this.isMine) || other.isMine == _this.isMine)&&const DeepCollectionEquality().equals(other.replies, _this.replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BiteCommentModel;
  return Object.hash(runtimeType,_this.id,_this.authorId,_this.authorName,_this.text,_this.createdAt,_this.parentId,_this.isMine,const DeepCollectionEquality().hash(_this.replies));
}

@override
String toString() {
  final _this = this as BiteCommentModel;
  return 'BiteCommentModel(id: ${_this.id}, authorId: ${_this.authorId}, authorName: ${_this.authorName}, text: ${_this.text}, createdAt: ${_this.createdAt}, parentId: ${_this.parentId}, isMine: ${_this.isMine}, replies: ${_this.replies})';
}


}

/// @nodoc
abstract mixin class $BiteCommentModelCopyWith<$Res>  {
  factory $BiteCommentModelCopyWith(BiteCommentModel value, $Res Function(BiteCommentModel) _then) = _$BiteCommentModelCopyWithImpl;
@useResult
$Res call({
 String id, String authorId, String authorName, String text, DateTime createdAt, String? parentId, bool isMine, List<BiteCommentModel> replies
});




}
/// @nodoc
class _$BiteCommentModelCopyWithImpl<$Res>
    implements $BiteCommentModelCopyWith<$Res> {
  _$BiteCommentModelCopyWithImpl(this._self, this._then);

  final BiteCommentModel _self;
  final $Res Function(BiteCommentModel) _then;

/// Create a copy of BiteCommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorId = null,Object? authorName = null,Object? text = null,Object? createdAt = null,Object? parentId = freezed,Object? isMine = null,Object? replies = null,}) {
  return _then(BiteCommentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as List<BiteCommentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BiteCommentModel].
extension BiteCommentModelPatterns on BiteCommentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiteCommentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiteCommentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiteCommentModel value)  $default,){
final _that = this;
switch (_that) {
case _BiteCommentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiteCommentModel value)?  $default,){
final _that = this;
switch (_that) {
case _BiteCommentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String authorId,  String authorName,  String text,  DateTime createdAt,  String? parentId,  bool isMine,  List<BiteCommentModel> replies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiteCommentModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String authorId,  String authorName,  String text,  DateTime createdAt,  String? parentId,  bool isMine,  List<BiteCommentModel> replies)  $default,) {final _that = this;
switch (_that) {
case _BiteCommentModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String authorId,  String authorName,  String text,  DateTime createdAt,  String? parentId,  bool isMine,  List<BiteCommentModel> replies)?  $default,) {final _that = this;
switch (_that) {
case _BiteCommentModel() when $default != null:
return $default(_that.id,_that.authorId,_that.authorName,_that.text,_that.createdAt,_that.parentId,_that.isMine,_that.replies);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BiteCommentModel implements BiteCommentModel {
  const _BiteCommentModel({required this.id, required this.authorId, required this.authorName, required this.text, required this.createdAt, this.parentId, this.isMine = false,  List<BiteCommentModel> replies = const <BiteCommentModel>[]}): _replies = replies;
  factory _BiteCommentModel.fromJson(Map<String, dynamic> json) => _$BiteCommentModelFromJson(json);

@override final  String id;
@override final  String authorId;
@override final  String authorName;
@override final  String text;
@override final  DateTime createdAt;
@override final  String? parentId;
@override@JsonKey() final  bool isMine;
 final  List<BiteCommentModel> _replies;
@override@JsonKey() List<BiteCommentModel> get replies {
  if (_replies is EqualUnmodifiableListView) return _replies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_replies);
}


/// Create a copy of BiteCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiteCommentModelCopyWith<_BiteCommentModel> get copyWith => __$BiteCommentModelCopyWithImpl<_BiteCommentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BiteCommentModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiteCommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.text, text) || other.text == text)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.isMine, isMine) || other.isMine == isMine)&&const DeepCollectionEquality().equals(other.replies, _replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,authorId,authorName,text,createdAt,parentId,isMine,const DeepCollectionEquality().hash(_replies));
}

@override
String toString() {
    return 'BiteCommentModel(id: $id, authorId: $authorId, authorName: $authorName, text: $text, createdAt: $createdAt, parentId: $parentId, isMine: $isMine, replies: $replies)';
}


}

/// @nodoc
abstract mixin class _$BiteCommentModelCopyWith<$Res> implements $BiteCommentModelCopyWith<$Res> {
  factory _$BiteCommentModelCopyWith(_BiteCommentModel value, $Res Function(_BiteCommentModel) _then) = __$BiteCommentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String authorId, String authorName, String text, DateTime createdAt, String? parentId, bool isMine, List<BiteCommentModel> replies
});




}
/// @nodoc
class __$BiteCommentModelCopyWithImpl<$Res>
    implements _$BiteCommentModelCopyWith<$Res> {
  __$BiteCommentModelCopyWithImpl(this._self, this._then);

  final _BiteCommentModel _self;
  final $Res Function(_BiteCommentModel) _then;

/// Create a copy of BiteCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorId = null,Object? authorName = null,Object? text = null,Object? createdAt = null,Object? parentId = freezed,Object? isMine = null,Object? replies = null,}) {
  return _then(_BiteCommentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,replies: null == replies ? _self._replies : replies // ignore: cast_nullable_to_non_nullable
as List<BiteCommentModel>,
  ));
}


}


/// @nodoc
mixin _$BiteDetailModel {

 BiteModel get bite; List<BiteCommentModel> get comments;
/// Create a copy of BiteDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiteDetailModelCopyWith<BiteDetailModel> get copyWith => _$BiteDetailModelCopyWithImpl<BiteDetailModel>(this as BiteDetailModel, _$identity);

  /// Serializes this BiteDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BiteDetailModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiteDetailModel&&(identical(other.bite, _this.bite) || other.bite == _this.bite)&&const DeepCollectionEquality().equals(other.comments, _this.comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BiteDetailModel;
  return Object.hash(runtimeType,_this.bite,const DeepCollectionEquality().hash(_this.comments));
}

@override
String toString() {
  final _this = this as BiteDetailModel;
  return 'BiteDetailModel(bite: ${_this.bite}, comments: ${_this.comments})';
}


}

/// @nodoc
abstract mixin class $BiteDetailModelCopyWith<$Res>  {
  factory $BiteDetailModelCopyWith(BiteDetailModel value, $Res Function(BiteDetailModel) _then) = _$BiteDetailModelCopyWithImpl;
@useResult
$Res call({
 BiteModel bite, List<BiteCommentModel> comments
});


$BiteModelCopyWith<$Res> get bite;

}
/// @nodoc
class _$BiteDetailModelCopyWithImpl<$Res>
    implements $BiteDetailModelCopyWith<$Res> {
  _$BiteDetailModelCopyWithImpl(this._self, this._then);

  final BiteDetailModel _self;
  final $Res Function(BiteDetailModel) _then;

/// Create a copy of BiteDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bite = null,Object? comments = null,}) {
  return _then(BiteDetailModel(
bite: null == bite ? _self.bite : bite // ignore: cast_nullable_to_non_nullable
as BiteModel,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<BiteCommentModel>,
  ));
}
/// Create a copy of BiteDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BiteModelCopyWith<$Res> get bite {
  
  return $BiteModelCopyWith<$Res>(_self.bite, (value) {
    return _then(_self.copyWith(bite: value));
  });
}
}


/// Adds pattern-matching-related methods to [BiteDetailModel].
extension BiteDetailModelPatterns on BiteDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiteDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiteDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiteDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _BiteDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiteDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _BiteDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BiteModel bite,  List<BiteCommentModel> comments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiteDetailModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BiteModel bite,  List<BiteCommentModel> comments)  $default,) {final _that = this;
switch (_that) {
case _BiteDetailModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BiteModel bite,  List<BiteCommentModel> comments)?  $default,) {final _that = this;
switch (_that) {
case _BiteDetailModel() when $default != null:
return $default(_that.bite,_that.comments);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BiteDetailModel implements BiteDetailModel {
  const _BiteDetailModel({required this.bite,  List<BiteCommentModel> comments = const <BiteCommentModel>[]}): _comments = comments;
  factory _BiteDetailModel.fromJson(Map<String, dynamic> json) => _$BiteDetailModelFromJson(json);

@override final  BiteModel bite;
 final  List<BiteCommentModel> _comments;
@override@JsonKey() List<BiteCommentModel> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of BiteDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiteDetailModelCopyWith<_BiteDetailModel> get copyWith => __$BiteDetailModelCopyWithImpl<_BiteDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BiteDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiteDetailModel&&(identical(other.bite, bite) || other.bite == bite)&&const DeepCollectionEquality().equals(other.comments, _comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,bite,const DeepCollectionEquality().hash(_comments));
}

@override
String toString() {
    return 'BiteDetailModel(bite: $bite, comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$BiteDetailModelCopyWith<$Res> implements $BiteDetailModelCopyWith<$Res> {
  factory _$BiteDetailModelCopyWith(_BiteDetailModel value, $Res Function(_BiteDetailModel) _then) = __$BiteDetailModelCopyWithImpl;
@override @useResult
$Res call({
 BiteModel bite, List<BiteCommentModel> comments
});


@override $BiteModelCopyWith<$Res> get bite;

}
/// @nodoc
class __$BiteDetailModelCopyWithImpl<$Res>
    implements _$BiteDetailModelCopyWith<$Res> {
  __$BiteDetailModelCopyWithImpl(this._self, this._then);

  final _BiteDetailModel _self;
  final $Res Function(_BiteDetailModel) _then;

/// Create a copy of BiteDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bite = null,Object? comments = null,}) {
  return _then(_BiteDetailModel(
bite: null == bite ? _self.bite : bite // ignore: cast_nullable_to_non_nullable
as BiteModel,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<BiteCommentModel>,
  ));
}

/// Create a copy of BiteDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BiteModelCopyWith<$Res> get bite {
  
  return $BiteModelCopyWith<$Res>(_self.bite, (value) {
    return _then(_self.copyWith(bite: value));
  });
}
}

// dart format on
