// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanned_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScannedBook {

 String get bookId; String get title; String get author; String get isbn; int get coverSeed;/// The Book's From-price, `null` when no Edition can be ordered.
 int? get newPriceBdt;
/// Create a copy of ScannedBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannedBookCopyWith<ScannedBook> get copyWith => _$ScannedBookCopyWithImpl<ScannedBook>(this as ScannedBook, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ScannedBook;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannedBook&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.isbn, _this.isbn) || other.isbn == _this.isbn)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.newPriceBdt, _this.newPriceBdt) || other.newPriceBdt == _this.newPriceBdt));
}


@override
int get hashCode {
  final _this = this as ScannedBook;
  return Object.hash(runtimeType,_this.bookId,_this.title,_this.author,_this.isbn,_this.coverSeed,_this.newPriceBdt);
}

@override
String toString() {
  final _this = this as ScannedBook;
  return 'ScannedBook(bookId: ${_this.bookId}, title: ${_this.title}, author: ${_this.author}, isbn: ${_this.isbn}, coverSeed: ${_this.coverSeed}, newPriceBdt: ${_this.newPriceBdt})';
}


}

/// @nodoc
abstract mixin class $ScannedBookCopyWith<$Res>  {
  factory $ScannedBookCopyWith(ScannedBook value, $Res Function(ScannedBook) _then) = _$ScannedBookCopyWithImpl;
@useResult
$Res call({
 String bookId, String title, String author, String isbn, int coverSeed, int? newPriceBdt
});




}
/// @nodoc
class _$ScannedBookCopyWithImpl<$Res>
    implements $ScannedBookCopyWith<$Res> {
  _$ScannedBookCopyWithImpl(this._self, this._then);

  final ScannedBook _self;
  final $Res Function(ScannedBook) _then;

/// Create a copy of ScannedBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? isbn = null,Object? coverSeed = null,Object? newPriceBdt = freezed,}) {
  return _then(ScannedBook(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,newPriceBdt: freezed == newPriceBdt ? _self.newPriceBdt : newPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScannedBook].
extension ScannedBookPatterns on ScannedBook {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScannedBook value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScannedBook() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScannedBook value)  $default,){
final _that = this;
switch (_that) {
case _ScannedBook():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScannedBook value)?  $default,){
final _that = this;
switch (_that) {
case _ScannedBook() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookId,  String title,  String author,  String isbn,  int coverSeed,  int? newPriceBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScannedBook() when $default != null:
return $default(_that.bookId,_that.title,_that.author,_that.isbn,_that.coverSeed,_that.newPriceBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookId,  String title,  String author,  String isbn,  int coverSeed,  int? newPriceBdt)  $default,) {final _that = this;
switch (_that) {
case _ScannedBook():
return $default(_that.bookId,_that.title,_that.author,_that.isbn,_that.coverSeed,_that.newPriceBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookId,  String title,  String author,  String isbn,  int coverSeed,  int? newPriceBdt)?  $default,) {final _that = this;
switch (_that) {
case _ScannedBook() when $default != null:
return $default(_that.bookId,_that.title,_that.author,_that.isbn,_that.coverSeed,_that.newPriceBdt);case _:
  return null;

}
}

}

/// @nodoc


class _ScannedBook implements ScannedBook {
  const _ScannedBook({required this.bookId, required this.title, required this.author, required this.isbn, this.coverSeed = 0, this.newPriceBdt});
  

@override final  String bookId;
@override final  String title;
@override final  String author;
@override final  String isbn;
@override@JsonKey() final  int coverSeed;
/// The Book's From-price, `null` when no Edition can be ordered.
@override final  int? newPriceBdt;

/// Create a copy of ScannedBook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScannedBookCopyWith<_ScannedBook> get copyWith => __$ScannedBookCopyWithImpl<_ScannedBook>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScannedBook&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.newPriceBdt, newPriceBdt) || other.newPriceBdt == newPriceBdt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,bookId,title,author,isbn,coverSeed,newPriceBdt);
}

@override
String toString() {
    return 'ScannedBook(bookId: $bookId, title: $title, author: $author, isbn: $isbn, coverSeed: $coverSeed, newPriceBdt: $newPriceBdt)';
}


}

/// @nodoc
abstract mixin class _$ScannedBookCopyWith<$Res> implements $ScannedBookCopyWith<$Res> {
  factory _$ScannedBookCopyWith(_ScannedBook value, $Res Function(_ScannedBook) _then) = __$ScannedBookCopyWithImpl;
@override @useResult
$Res call({
 String bookId, String title, String author, String isbn, int coverSeed, int? newPriceBdt
});




}
/// @nodoc
class __$ScannedBookCopyWithImpl<$Res>
    implements _$ScannedBookCopyWith<$Res> {
  __$ScannedBookCopyWithImpl(this._self, this._then);

  final _ScannedBook _self;
  final $Res Function(_ScannedBook) _then;

/// Create a copy of ScannedBook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? isbn = null,Object? coverSeed = null,Object? newPriceBdt = freezed,}) {
  return _then(_ScannedBook(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,newPriceBdt: freezed == newPriceBdt ? _self.newPriceBdt : newPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
