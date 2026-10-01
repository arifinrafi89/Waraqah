// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanned_book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScannedBookModel {

 String get bookId; String get title; String get author; String get isbn; int get coverSeed; int? get newPriceBdt;
/// Create a copy of ScannedBookModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannedBookModelCopyWith<ScannedBookModel> get copyWith => _$ScannedBookModelCopyWithImpl<ScannedBookModel>(this as ScannedBookModel, _$identity);

  /// Serializes this ScannedBookModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ScannedBookModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannedBookModel&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.isbn, _this.isbn) || other.isbn == _this.isbn)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.newPriceBdt, _this.newPriceBdt) || other.newPriceBdt == _this.newPriceBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ScannedBookModel;
  return Object.hash(runtimeType,_this.bookId,_this.title,_this.author,_this.isbn,_this.coverSeed,_this.newPriceBdt);
}

@override
String toString() {
  final _this = this as ScannedBookModel;
  return 'ScannedBookModel(bookId: ${_this.bookId}, title: ${_this.title}, author: ${_this.author}, isbn: ${_this.isbn}, coverSeed: ${_this.coverSeed}, newPriceBdt: ${_this.newPriceBdt})';
}


}

/// @nodoc
abstract mixin class $ScannedBookModelCopyWith<$Res>  {
  factory $ScannedBookModelCopyWith(ScannedBookModel value, $Res Function(ScannedBookModel) _then) = _$ScannedBookModelCopyWithImpl;
@useResult
$Res call({
 String bookId, String title, String author, String isbn, int coverSeed, int? newPriceBdt
});




}
/// @nodoc
class _$ScannedBookModelCopyWithImpl<$Res>
    implements $ScannedBookModelCopyWith<$Res> {
  _$ScannedBookModelCopyWithImpl(this._self, this._then);

  final ScannedBookModel _self;
  final $Res Function(ScannedBookModel) _then;

/// Create a copy of ScannedBookModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? isbn = null,Object? coverSeed = null,Object? newPriceBdt = freezed,}) {
  return _then(ScannedBookModel(
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


/// Adds pattern-matching-related methods to [ScannedBookModel].
extension ScannedBookModelPatterns on ScannedBookModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScannedBookModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScannedBookModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScannedBookModel value)  $default,){
final _that = this;
switch (_that) {
case _ScannedBookModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScannedBookModel value)?  $default,){
final _that = this;
switch (_that) {
case _ScannedBookModel() when $default != null:
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
case _ScannedBookModel() when $default != null:
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
case _ScannedBookModel():
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
case _ScannedBookModel() when $default != null:
return $default(_that.bookId,_that.title,_that.author,_that.isbn,_that.coverSeed,_that.newPriceBdt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScannedBookModel implements ScannedBookModel {
  const _ScannedBookModel({required this.bookId, required this.title, required this.author, required this.isbn, this.coverSeed = 0, this.newPriceBdt});
  factory _ScannedBookModel.fromJson(Map<String, dynamic> json) => _$ScannedBookModelFromJson(json);

@override final  String bookId;
@override final  String title;
@override final  String author;
@override final  String isbn;
@override@JsonKey() final  int coverSeed;
@override final  int? newPriceBdt;

/// Create a copy of ScannedBookModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScannedBookModelCopyWith<_ScannedBookModel> get copyWith => __$ScannedBookModelCopyWithImpl<_ScannedBookModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScannedBookModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScannedBookModel&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.newPriceBdt, newPriceBdt) || other.newPriceBdt == newPriceBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,bookId,title,author,isbn,coverSeed,newPriceBdt);
}

@override
String toString() {
    return 'ScannedBookModel(bookId: $bookId, title: $title, author: $author, isbn: $isbn, coverSeed: $coverSeed, newPriceBdt: $newPriceBdt)';
}


}

/// @nodoc
abstract mixin class _$ScannedBookModelCopyWith<$Res> implements $ScannedBookModelCopyWith<$Res> {
  factory _$ScannedBookModelCopyWith(_ScannedBookModel value, $Res Function(_ScannedBookModel) _then) = __$ScannedBookModelCopyWithImpl;
@override @useResult
$Res call({
 String bookId, String title, String author, String isbn, int coverSeed, int? newPriceBdt
});




}
/// @nodoc
class __$ScannedBookModelCopyWithImpl<$Res>
    implements _$ScannedBookModelCopyWith<$Res> {
  __$ScannedBookModelCopyWithImpl(this._self, this._then);

  final _ScannedBookModel _self;
  final $Res Function(_ScannedBookModel) _then;

/// Create a copy of ScannedBookModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? isbn = null,Object? coverSeed = null,Object? newPriceBdt = freezed,}) {
  return _then(_ScannedBookModel(
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
