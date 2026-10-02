// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewModel {

 String get id; String get bookId; String get authorId; String get authorName; int get stars; DateTime get createdAt; String get text; DateTime? get editedAt; bool get verified; bool get isMine;
/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewModelCopyWith<ReviewModel> get copyWith => _$ReviewModelCopyWithImpl<ReviewModel>(this as ReviewModel, _$identity);

  /// Serializes this ReviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReviewModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.authorId, _this.authorId) || other.authorId == _this.authorId)&&(identical(other.authorName, _this.authorName) || other.authorName == _this.authorName)&&(identical(other.stars, _this.stars) || other.stars == _this.stars)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.editedAt, _this.editedAt) || other.editedAt == _this.editedAt)&&(identical(other.verified, _this.verified) || other.verified == _this.verified)&&(identical(other.isMine, _this.isMine) || other.isMine == _this.isMine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReviewModel;
  return Object.hash(runtimeType,_this.id,_this.bookId,_this.authorId,_this.authorName,_this.stars,_this.createdAt,_this.text,_this.editedAt,_this.verified,_this.isMine);
}

@override
String toString() {
  final _this = this as ReviewModel;
  return 'ReviewModel(id: ${_this.id}, bookId: ${_this.bookId}, authorId: ${_this.authorId}, authorName: ${_this.authorName}, stars: ${_this.stars}, createdAt: ${_this.createdAt}, text: ${_this.text}, editedAt: ${_this.editedAt}, verified: ${_this.verified}, isMine: ${_this.isMine})';
}


}

/// @nodoc
abstract mixin class $ReviewModelCopyWith<$Res>  {
  factory $ReviewModelCopyWith(ReviewModel value, $Res Function(ReviewModel) _then) = _$ReviewModelCopyWithImpl;
@useResult
$Res call({
 String id, String bookId, String authorId, String authorName, int stars, DateTime createdAt, String text, DateTime? editedAt, bool verified, bool isMine
});




}
/// @nodoc
class _$ReviewModelCopyWithImpl<$Res>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._self, this._then);

  final ReviewModel _self;
  final $Res Function(ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookId = null,Object? authorId = null,Object? authorName = null,Object? stars = null,Object? createdAt = null,Object? text = null,Object? editedAt = freezed,Object? verified = null,Object? isMine = null,}) {
  return _then(ReviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewModel].
extension ReviewModelPatterns on ReviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewModel value)  $default,){
final _that = this;
switch (_that) {
case _ReviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String bookId,  String authorId,  String authorName,  int stars,  DateTime createdAt,  String text,  DateTime? editedAt,  bool verified,  bool isMine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that.id,_that.bookId,_that.authorId,_that.authorName,_that.stars,_that.createdAt,_that.text,_that.editedAt,_that.verified,_that.isMine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String bookId,  String authorId,  String authorName,  int stars,  DateTime createdAt,  String text,  DateTime? editedAt,  bool verified,  bool isMine)  $default,) {final _that = this;
switch (_that) {
case _ReviewModel():
return $default(_that.id,_that.bookId,_that.authorId,_that.authorName,_that.stars,_that.createdAt,_that.text,_that.editedAt,_that.verified,_that.isMine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String bookId,  String authorId,  String authorName,  int stars,  DateTime createdAt,  String text,  DateTime? editedAt,  bool verified,  bool isMine)?  $default,) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that.id,_that.bookId,_that.authorId,_that.authorName,_that.stars,_that.createdAt,_that.text,_that.editedAt,_that.verified,_that.isMine);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewModel implements ReviewModel {
  const _ReviewModel({required this.id, required this.bookId, required this.authorId, required this.authorName, required this.stars, required this.createdAt, this.text = '', this.editedAt, this.verified = false, this.isMine = false});
  factory _ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);

@override final  String id;
@override final  String bookId;
@override final  String authorId;
@override final  String authorName;
@override final  int stars;
@override final  DateTime createdAt;
@override@JsonKey() final  String text;
@override final  DateTime? editedAt;
@override@JsonKey() final  bool verified;
@override@JsonKey() final  bool isMine;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewModelCopyWith<_ReviewModel> get copyWith => __$ReviewModelCopyWithImpl<_ReviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.text, text) || other.text == text)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.isMine, isMine) || other.isMine == isMine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,bookId,authorId,authorName,stars,createdAt,text,editedAt,verified,isMine);
}

@override
String toString() {
    return 'ReviewModel(id: $id, bookId: $bookId, authorId: $authorId, authorName: $authorName, stars: $stars, createdAt: $createdAt, text: $text, editedAt: $editedAt, verified: $verified, isMine: $isMine)';
}


}

/// @nodoc
abstract mixin class _$ReviewModelCopyWith<$Res> implements $ReviewModelCopyWith<$Res> {
  factory _$ReviewModelCopyWith(_ReviewModel value, $Res Function(_ReviewModel) _then) = __$ReviewModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String bookId, String authorId, String authorName, int stars, DateTime createdAt, String text, DateTime? editedAt, bool verified, bool isMine
});




}
/// @nodoc
class __$ReviewModelCopyWithImpl<$Res>
    implements _$ReviewModelCopyWith<$Res> {
  __$ReviewModelCopyWithImpl(this._self, this._then);

  final _ReviewModel _self;
  final $Res Function(_ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookId = null,Object? authorId = null,Object? authorName = null,Object? stars = null,Object? createdAt = null,Object? text = null,Object? editedAt = freezed,Object? verified = null,Object? isMine = null,}) {
  return _then(_ReviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BookReviewsModel {

 double get average; int get count; ReviewModel? get mine; List<ReviewModel> get reviews;
/// Create a copy of BookReviewsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookReviewsModelCopyWith<BookReviewsModel> get copyWith => _$BookReviewsModelCopyWithImpl<BookReviewsModel>(this as BookReviewsModel, _$identity);

  /// Serializes this BookReviewsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookReviewsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookReviewsModel&&(identical(other.average, _this.average) || other.average == _this.average)&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.mine, _this.mine) || other.mine == _this.mine)&&const DeepCollectionEquality().equals(other.reviews, _this.reviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookReviewsModel;
  return Object.hash(runtimeType,_this.average,_this.count,_this.mine,const DeepCollectionEquality().hash(_this.reviews));
}

@override
String toString() {
  final _this = this as BookReviewsModel;
  return 'BookReviewsModel(average: ${_this.average}, count: ${_this.count}, mine: ${_this.mine}, reviews: ${_this.reviews})';
}


}

/// @nodoc
abstract mixin class $BookReviewsModelCopyWith<$Res>  {
  factory $BookReviewsModelCopyWith(BookReviewsModel value, $Res Function(BookReviewsModel) _then) = _$BookReviewsModelCopyWithImpl;
@useResult
$Res call({
 double average, int count, ReviewModel? mine, List<ReviewModel> reviews
});


$ReviewModelCopyWith<$Res>? get mine;

}
/// @nodoc
class _$BookReviewsModelCopyWithImpl<$Res>
    implements $BookReviewsModelCopyWith<$Res> {
  _$BookReviewsModelCopyWithImpl(this._self, this._then);

  final BookReviewsModel _self;
  final $Res Function(BookReviewsModel) _then;

/// Create a copy of BookReviewsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? average = null,Object? count = null,Object? mine = freezed,Object? reviews = null,}) {
  return _then(BookReviewsModel(
average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,mine: freezed == mine ? _self.mine : mine // ignore: cast_nullable_to_non_nullable
as ReviewModel?,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewModel>,
  ));
}
/// Create a copy of BookReviewsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewModelCopyWith<$Res>? get mine {
    if (_self.mine == null) {
    return null;
  }

  return $ReviewModelCopyWith<$Res>(_self.mine!, (value) {
    return _then(_self.copyWith(mine: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookReviewsModel].
extension BookReviewsModelPatterns on BookReviewsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookReviewsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookReviewsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookReviewsModel value)  $default,){
final _that = this;
switch (_that) {
case _BookReviewsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookReviewsModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookReviewsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double average,  int count,  ReviewModel? mine,  List<ReviewModel> reviews)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookReviewsModel() when $default != null:
return $default(_that.average,_that.count,_that.mine,_that.reviews);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double average,  int count,  ReviewModel? mine,  List<ReviewModel> reviews)  $default,) {final _that = this;
switch (_that) {
case _BookReviewsModel():
return $default(_that.average,_that.count,_that.mine,_that.reviews);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double average,  int count,  ReviewModel? mine,  List<ReviewModel> reviews)?  $default,) {final _that = this;
switch (_that) {
case _BookReviewsModel() when $default != null:
return $default(_that.average,_that.count,_that.mine,_that.reviews);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BookReviewsModel implements BookReviewsModel {
  const _BookReviewsModel({this.average = 0, this.count = 0, this.mine,  List<ReviewModel> reviews = const <ReviewModel>[]}): _reviews = reviews;
  factory _BookReviewsModel.fromJson(Map<String, dynamic> json) => _$BookReviewsModelFromJson(json);

@override@JsonKey() final  double average;
@override@JsonKey() final  int count;
@override final  ReviewModel? mine;
 final  List<ReviewModel> _reviews;
@override@JsonKey() List<ReviewModel> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}


/// Create a copy of BookReviewsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookReviewsModelCopyWith<_BookReviewsModel> get copyWith => __$BookReviewsModelCopyWithImpl<_BookReviewsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookReviewsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookReviewsModel&&(identical(other.average, average) || other.average == average)&&(identical(other.count, count) || other.count == count)&&(identical(other.mine, mine) || other.mine == mine)&&const DeepCollectionEquality().equals(other.reviews, _reviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,average,count,mine,const DeepCollectionEquality().hash(_reviews));
}

@override
String toString() {
    return 'BookReviewsModel(average: $average, count: $count, mine: $mine, reviews: $reviews)';
}


}

/// @nodoc
abstract mixin class _$BookReviewsModelCopyWith<$Res> implements $BookReviewsModelCopyWith<$Res> {
  factory _$BookReviewsModelCopyWith(_BookReviewsModel value, $Res Function(_BookReviewsModel) _then) = __$BookReviewsModelCopyWithImpl;
@override @useResult
$Res call({
 double average, int count, ReviewModel? mine, List<ReviewModel> reviews
});


@override $ReviewModelCopyWith<$Res>? get mine;

}
/// @nodoc
class __$BookReviewsModelCopyWithImpl<$Res>
    implements _$BookReviewsModelCopyWith<$Res> {
  __$BookReviewsModelCopyWithImpl(this._self, this._then);

  final _BookReviewsModel _self;
  final $Res Function(_BookReviewsModel) _then;

/// Create a copy of BookReviewsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? average = null,Object? count = null,Object? mine = freezed,Object? reviews = null,}) {
  return _then(_BookReviewsModel(
average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,mine: freezed == mine ? _self.mine : mine // ignore: cast_nullable_to_non_nullable
as ReviewModel?,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewModel>,
  ));
}

/// Create a copy of BookReviewsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewModelCopyWith<$Res>? get mine {
    if (_self.mine == null) {
    return null;
  }

  return $ReviewModelCopyWith<$Res>(_self.mine!, (value) {
    return _then(_self.copyWith(mine: value));
  });
}
}

// dart format on
