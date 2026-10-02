// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Review {

 String get id; String get bookId; String get authorId; String get authorName; int get stars; DateTime get createdAt; String get text; DateTime? get editedAt;/// The Reader got this Book delivered from Waraqah.
 bool get verified; bool get isMine;
/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCopyWith<Review> get copyWith => _$ReviewCopyWithImpl<Review>(this as Review, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Review;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Review&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.authorId, _this.authorId) || other.authorId == _this.authorId)&&(identical(other.authorName, _this.authorName) || other.authorName == _this.authorName)&&(identical(other.stars, _this.stars) || other.stars == _this.stars)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.editedAt, _this.editedAt) || other.editedAt == _this.editedAt)&&(identical(other.verified, _this.verified) || other.verified == _this.verified)&&(identical(other.isMine, _this.isMine) || other.isMine == _this.isMine));
}


@override
int get hashCode {
  final _this = this as Review;
  return Object.hash(runtimeType,_this.id,_this.bookId,_this.authorId,_this.authorName,_this.stars,_this.createdAt,_this.text,_this.editedAt,_this.verified,_this.isMine);
}

@override
String toString() {
  final _this = this as Review;
  return 'Review(id: ${_this.id}, bookId: ${_this.bookId}, authorId: ${_this.authorId}, authorName: ${_this.authorName}, stars: ${_this.stars}, createdAt: ${_this.createdAt}, text: ${_this.text}, editedAt: ${_this.editedAt}, verified: ${_this.verified}, isMine: ${_this.isMine})';
}


}

/// @nodoc
abstract mixin class $ReviewCopyWith<$Res>  {
  factory $ReviewCopyWith(Review value, $Res Function(Review) _then) = _$ReviewCopyWithImpl;
@useResult
$Res call({
 String id, String bookId, String authorId, String authorName, int stars, DateTime createdAt, String text, DateTime? editedAt, bool verified, bool isMine
});




}
/// @nodoc
class _$ReviewCopyWithImpl<$Res>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._self, this._then);

  final Review _self;
  final $Res Function(Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookId = null,Object? authorId = null,Object? authorName = null,Object? stars = null,Object? createdAt = null,Object? text = null,Object? editedAt = freezed,Object? verified = null,Object? isMine = null,}) {
  return _then(Review(
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


/// Adds pattern-matching-related methods to [Review].
extension ReviewPatterns on Review {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Review value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Review() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Review value)  $default,){
final _that = this;
switch (_that) {
case _Review():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Review value)?  $default,){
final _that = this;
switch (_that) {
case _Review() when $default != null:
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
case _Review() when $default != null:
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
case _Review():
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
case _Review() when $default != null:
return $default(_that.id,_that.bookId,_that.authorId,_that.authorName,_that.stars,_that.createdAt,_that.text,_that.editedAt,_that.verified,_that.isMine);case _:
  return null;

}
}

}

/// @nodoc


class _Review implements Review {
  const _Review({required this.id, required this.bookId, required this.authorId, required this.authorName, required this.stars, required this.createdAt, this.text = '', this.editedAt, this.verified = false, this.isMine = false});
  

@override final  String id;
@override final  String bookId;
@override final  String authorId;
@override final  String authorName;
@override final  int stars;
@override final  DateTime createdAt;
@override@JsonKey() final  String text;
@override final  DateTime? editedAt;
/// The Reader got this Book delivered from Waraqah.
@override@JsonKey() final  bool verified;
@override@JsonKey() final  bool isMine;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewCopyWith<_Review> get copyWith => __$ReviewCopyWithImpl<_Review>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Review&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.text, text) || other.text == text)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.isMine, isMine) || other.isMine == isMine));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,bookId,authorId,authorName,stars,createdAt,text,editedAt,verified,isMine);
}

@override
String toString() {
    return 'Review(id: $id, bookId: $bookId, authorId: $authorId, authorName: $authorName, stars: $stars, createdAt: $createdAt, text: $text, editedAt: $editedAt, verified: $verified, isMine: $isMine)';
}


}

/// @nodoc
abstract mixin class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) _then) = __$ReviewCopyWithImpl;
@override @useResult
$Res call({
 String id, String bookId, String authorId, String authorName, int stars, DateTime createdAt, String text, DateTime? editedAt, bool verified, bool isMine
});




}
/// @nodoc
class __$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(this._self, this._then);

  final _Review _self;
  final $Res Function(_Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookId = null,Object? authorId = null,Object? authorName = null,Object? stars = null,Object? createdAt = null,Object? text = null,Object? editedAt = freezed,Object? verified = null,Object? isMine = null,}) {
  return _then(_Review(
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
mixin _$BookReviews {

 double get average; int get count; Review? get mine; List<Review> get reviews;
/// Create a copy of BookReviews
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookReviewsCopyWith<BookReviews> get copyWith => _$BookReviewsCopyWithImpl<BookReviews>(this as BookReviews, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BookReviews;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookReviews&&(identical(other.average, _this.average) || other.average == _this.average)&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.mine, _this.mine) || other.mine == _this.mine)&&const DeepCollectionEquality().equals(other.reviews, _this.reviews));
}


@override
int get hashCode {
  final _this = this as BookReviews;
  return Object.hash(runtimeType,_this.average,_this.count,_this.mine,const DeepCollectionEquality().hash(_this.reviews));
}

@override
String toString() {
  final _this = this as BookReviews;
  return 'BookReviews(average: ${_this.average}, count: ${_this.count}, mine: ${_this.mine}, reviews: ${_this.reviews})';
}


}

/// @nodoc
abstract mixin class $BookReviewsCopyWith<$Res>  {
  factory $BookReviewsCopyWith(BookReviews value, $Res Function(BookReviews) _then) = _$BookReviewsCopyWithImpl;
@useResult
$Res call({
 double average, int count, Review? mine, List<Review> reviews
});


$ReviewCopyWith<$Res>? get mine;

}
/// @nodoc
class _$BookReviewsCopyWithImpl<$Res>
    implements $BookReviewsCopyWith<$Res> {
  _$BookReviewsCopyWithImpl(this._self, this._then);

  final BookReviews _self;
  final $Res Function(BookReviews) _then;

/// Create a copy of BookReviews
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? average = null,Object? count = null,Object? mine = freezed,Object? reviews = null,}) {
  return _then(BookReviews(
average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,mine: freezed == mine ? _self.mine : mine // ignore: cast_nullable_to_non_nullable
as Review?,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,
  ));
}
/// Create a copy of BookReviews
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewCopyWith<$Res>? get mine {
    if (_self.mine == null) {
    return null;
  }

  return $ReviewCopyWith<$Res>(_self.mine!, (value) {
    return _then(_self.copyWith(mine: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookReviews].
extension BookReviewsPatterns on BookReviews {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookReviews value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookReviews() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookReviews value)  $default,){
final _that = this;
switch (_that) {
case _BookReviews():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookReviews value)?  $default,){
final _that = this;
switch (_that) {
case _BookReviews() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double average,  int count,  Review? mine,  List<Review> reviews)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookReviews() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double average,  int count,  Review? mine,  List<Review> reviews)  $default,) {final _that = this;
switch (_that) {
case _BookReviews():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double average,  int count,  Review? mine,  List<Review> reviews)?  $default,) {final _that = this;
switch (_that) {
case _BookReviews() when $default != null:
return $default(_that.average,_that.count,_that.mine,_that.reviews);case _:
  return null;

}
}

}

/// @nodoc


class _BookReviews implements BookReviews {
  const _BookReviews({this.average = 0, this.count = 0, this.mine,  List<Review> reviews = const <Review>[]}): _reviews = reviews;
  

@override@JsonKey() final  double average;
@override@JsonKey() final  int count;
@override final  Review? mine;
 final  List<Review> _reviews;
@override@JsonKey() List<Review> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}


/// Create a copy of BookReviews
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookReviewsCopyWith<_BookReviews> get copyWith => __$BookReviewsCopyWithImpl<_BookReviews>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookReviews&&(identical(other.average, average) || other.average == average)&&(identical(other.count, count) || other.count == count)&&(identical(other.mine, mine) || other.mine == mine)&&const DeepCollectionEquality().equals(other.reviews, _reviews));
}


@override
int get hashCode {
    return Object.hash(runtimeType,average,count,mine,const DeepCollectionEquality().hash(_reviews));
}

@override
String toString() {
    return 'BookReviews(average: $average, count: $count, mine: $mine, reviews: $reviews)';
}


}

/// @nodoc
abstract mixin class _$BookReviewsCopyWith<$Res> implements $BookReviewsCopyWith<$Res> {
  factory _$BookReviewsCopyWith(_BookReviews value, $Res Function(_BookReviews) _then) = __$BookReviewsCopyWithImpl;
@override @useResult
$Res call({
 double average, int count, Review? mine, List<Review> reviews
});


@override $ReviewCopyWith<$Res>? get mine;

}
/// @nodoc
class __$BookReviewsCopyWithImpl<$Res>
    implements _$BookReviewsCopyWith<$Res> {
  __$BookReviewsCopyWithImpl(this._self, this._then);

  final _BookReviews _self;
  final $Res Function(_BookReviews) _then;

/// Create a copy of BookReviews
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? average = null,Object? count = null,Object? mine = freezed,Object? reviews = null,}) {
  return _then(_BookReviews(
average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,mine: freezed == mine ? _self.mine : mine // ignore: cast_nullable_to_non_nullable
as Review?,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,
  ));
}

/// Create a copy of BookReviews
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewCopyWith<$Res>? get mine {
    if (_self.mine == null) {
    return null;
  }

  return $ReviewCopyWith<$Res>(_self.mine!, (value) {
    return _then(_self.copyWith(mine: value));
  });
}
}

// dart format on
