// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookReview {

 String get id; String get reviewerName; String get reviewerHandle; int get rating; String get text; int get avatarSeed;
/// Create a copy of BookReview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookReviewCopyWith<BookReview> get copyWith => _$BookReviewCopyWithImpl<BookReview>(this as BookReview, _$identity);

  /// Serializes this BookReview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookReview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookReview&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.reviewerName, _this.reviewerName) || other.reviewerName == _this.reviewerName)&&(identical(other.reviewerHandle, _this.reviewerHandle) || other.reviewerHandle == _this.reviewerHandle)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.avatarSeed, _this.avatarSeed) || other.avatarSeed == _this.avatarSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookReview;
  return Object.hash(runtimeType,_this.id,_this.reviewerName,_this.reviewerHandle,_this.rating,_this.text,_this.avatarSeed);
}

@override
String toString() {
  final _this = this as BookReview;
  return 'BookReview(id: ${_this.id}, reviewerName: ${_this.reviewerName}, reviewerHandle: ${_this.reviewerHandle}, rating: ${_this.rating}, text: ${_this.text}, avatarSeed: ${_this.avatarSeed})';
}


}

/// @nodoc
abstract mixin class $BookReviewCopyWith<$Res>  {
  factory $BookReviewCopyWith(BookReview value, $Res Function(BookReview) _then) = _$BookReviewCopyWithImpl;
@useResult
$Res call({
 String id, String reviewerName, String reviewerHandle, int rating, String text, int avatarSeed
});




}
/// @nodoc
class _$BookReviewCopyWithImpl<$Res>
    implements $BookReviewCopyWith<$Res> {
  _$BookReviewCopyWithImpl(this._self, this._then);

  final BookReview _self;
  final $Res Function(BookReview) _then;

/// Create a copy of BookReview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reviewerName = null,Object? reviewerHandle = null,Object? rating = null,Object? text = null,Object? avatarSeed = null,}) {
  return _then(BookReview(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reviewerName: null == reviewerName ? _self.reviewerName : reviewerName // ignore: cast_nullable_to_non_nullable
as String,reviewerHandle: null == reviewerHandle ? _self.reviewerHandle : reviewerHandle // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,avatarSeed: null == avatarSeed ? _self.avatarSeed : avatarSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BookReview].
extension BookReviewPatterns on BookReview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookReview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookReview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookReview value)  $default,){
final _that = this;
switch (_that) {
case _BookReview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookReview value)?  $default,){
final _that = this;
switch (_that) {
case _BookReview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reviewerName,  String reviewerHandle,  int rating,  String text,  int avatarSeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookReview() when $default != null:
return $default(_that.id,_that.reviewerName,_that.reviewerHandle,_that.rating,_that.text,_that.avatarSeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reviewerName,  String reviewerHandle,  int rating,  String text,  int avatarSeed)  $default,) {final _that = this;
switch (_that) {
case _BookReview():
return $default(_that.id,_that.reviewerName,_that.reviewerHandle,_that.rating,_that.text,_that.avatarSeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reviewerName,  String reviewerHandle,  int rating,  String text,  int avatarSeed)?  $default,) {final _that = this;
switch (_that) {
case _BookReview() when $default != null:
return $default(_that.id,_that.reviewerName,_that.reviewerHandle,_that.rating,_that.text,_that.avatarSeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookReview implements BookReview {
  const _BookReview({required this.id, required this.reviewerName, required this.reviewerHandle, required this.rating, required this.text, this.avatarSeed = 0});
  factory _BookReview.fromJson(Map<String, dynamic> json) => _$BookReviewFromJson(json);

@override final  String id;
@override final  String reviewerName;
@override final  String reviewerHandle;
@override final  int rating;
@override final  String text;
@override@JsonKey() final  int avatarSeed;

/// Create a copy of BookReview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookReviewCopyWith<_BookReview> get copyWith => __$BookReviewCopyWithImpl<_BookReview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookReviewToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookReview&&(identical(other.id, id) || other.id == id)&&(identical(other.reviewerName, reviewerName) || other.reviewerName == reviewerName)&&(identical(other.reviewerHandle, reviewerHandle) || other.reviewerHandle == reviewerHandle)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.text, text) || other.text == text)&&(identical(other.avatarSeed, avatarSeed) || other.avatarSeed == avatarSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,reviewerName,reviewerHandle,rating,text,avatarSeed);
}

@override
String toString() {
    return 'BookReview(id: $id, reviewerName: $reviewerName, reviewerHandle: $reviewerHandle, rating: $rating, text: $text, avatarSeed: $avatarSeed)';
}


}

/// @nodoc
abstract mixin class _$BookReviewCopyWith<$Res> implements $BookReviewCopyWith<$Res> {
  factory _$BookReviewCopyWith(_BookReview value, $Res Function(_BookReview) _then) = __$BookReviewCopyWithImpl;
@override @useResult
$Res call({
 String id, String reviewerName, String reviewerHandle, int rating, String text, int avatarSeed
});




}
/// @nodoc
class __$BookReviewCopyWithImpl<$Res>
    implements _$BookReviewCopyWith<$Res> {
  __$BookReviewCopyWithImpl(this._self, this._then);

  final _BookReview _self;
  final $Res Function(_BookReview) _then;

/// Create a copy of BookReview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reviewerName = null,Object? reviewerHandle = null,Object? rating = null,Object? text = null,Object? avatarSeed = null,}) {
  return _then(_BookReview(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reviewerName: null == reviewerName ? _self.reviewerName : reviewerName // ignore: cast_nullable_to_non_nullable
as String,reviewerHandle: null == reviewerHandle ? _self.reviewerHandle : reviewerHandle // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,avatarSeed: null == avatarSeed ? _self.avatarSeed : avatarSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
