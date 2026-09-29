// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookDetails {

 String get bookId; List<BookReview> get reviews; String? get description; int? get pages; String? get publisher;
/// Create a copy of BookDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookDetailsCopyWith<BookDetails> get copyWith => _$BookDetailsCopyWithImpl<BookDetails>(this as BookDetails, _$identity);

  /// Serializes this BookDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookDetails;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookDetails&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&const DeepCollectionEquality().equals(other.reviews, _this.reviews)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.pages, _this.pages) || other.pages == _this.pages)&&(identical(other.publisher, _this.publisher) || other.publisher == _this.publisher));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookDetails;
  return Object.hash(runtimeType,_this.bookId,const DeepCollectionEquality().hash(_this.reviews),_this.description,_this.pages,_this.publisher);
}

@override
String toString() {
  final _this = this as BookDetails;
  return 'BookDetails(bookId: ${_this.bookId}, reviews: ${_this.reviews}, description: ${_this.description}, pages: ${_this.pages}, publisher: ${_this.publisher})';
}


}

/// @nodoc
abstract mixin class $BookDetailsCopyWith<$Res>  {
  factory $BookDetailsCopyWith(BookDetails value, $Res Function(BookDetails) _then) = _$BookDetailsCopyWithImpl;
@useResult
$Res call({
 String bookId, List<BookReview> reviews, String? description, int? pages, String? publisher
});




}
/// @nodoc
class _$BookDetailsCopyWithImpl<$Res>
    implements $BookDetailsCopyWith<$Res> {
  _$BookDetailsCopyWithImpl(this._self, this._then);

  final BookDetails _self;
  final $Res Function(BookDetails) _then;

/// Create a copy of BookDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? reviews = null,Object? description = freezed,Object? pages = freezed,Object? publisher = freezed,}) {
  return _then(BookDetails(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<BookReview>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,pages: freezed == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookDetails].
extension BookDetailsPatterns on BookDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookDetails value)  $default,){
final _that = this;
switch (_that) {
case _BookDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookDetails value)?  $default,){
final _that = this;
switch (_that) {
case _BookDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookId,  List<BookReview> reviews,  String? description,  int? pages,  String? publisher)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookDetails() when $default != null:
return $default(_that.bookId,_that.reviews,_that.description,_that.pages,_that.publisher);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookId,  List<BookReview> reviews,  String? description,  int? pages,  String? publisher)  $default,) {final _that = this;
switch (_that) {
case _BookDetails():
return $default(_that.bookId,_that.reviews,_that.description,_that.pages,_that.publisher);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookId,  List<BookReview> reviews,  String? description,  int? pages,  String? publisher)?  $default,) {final _that = this;
switch (_that) {
case _BookDetails() when $default != null:
return $default(_that.bookId,_that.reviews,_that.description,_that.pages,_that.publisher);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookDetails implements BookDetails {
  const _BookDetails({required this.bookId,  List<BookReview> reviews = const <BookReview>[], this.description, this.pages, this.publisher}): _reviews = reviews;
  factory _BookDetails.fromJson(Map<String, dynamic> json) => _$BookDetailsFromJson(json);

@override final  String bookId;
 final  List<BookReview> _reviews;
@override@JsonKey() List<BookReview> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override final  String? description;
@override final  int? pages;
@override final  String? publisher;

/// Create a copy of BookDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookDetailsCopyWith<_BookDetails> get copyWith => __$BookDetailsCopyWithImpl<_BookDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookDetails&&(identical(other.bookId, bookId) || other.bookId == bookId)&&const DeepCollectionEquality().equals(other.reviews, _reviews)&&(identical(other.description, description) || other.description == description)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.publisher, publisher) || other.publisher == publisher));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,bookId,const DeepCollectionEquality().hash(_reviews),description,pages,publisher);
}

@override
String toString() {
    return 'BookDetails(bookId: $bookId, reviews: $reviews, description: $description, pages: $pages, publisher: $publisher)';
}


}

/// @nodoc
abstract mixin class _$BookDetailsCopyWith<$Res> implements $BookDetailsCopyWith<$Res> {
  factory _$BookDetailsCopyWith(_BookDetails value, $Res Function(_BookDetails) _then) = __$BookDetailsCopyWithImpl;
@override @useResult
$Res call({
 String bookId, List<BookReview> reviews, String? description, int? pages, String? publisher
});




}
/// @nodoc
class __$BookDetailsCopyWithImpl<$Res>
    implements _$BookDetailsCopyWith<$Res> {
  __$BookDetailsCopyWithImpl(this._self, this._then);

  final _BookDetails _self;
  final $Res Function(_BookDetails) _then;

/// Create a copy of BookDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? reviews = null,Object? description = freezed,Object? pages = freezed,Object? publisher = freezed,}) {
  return _then(_BookDetails(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<BookReview>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,pages: freezed == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
