// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookRequest {

 String get id; String get title; DateTime get createdAt; String? get author;/// The catalog Book, when it came from Search or the scanner.
 String? get bookId; int? get maxPriceBdt; String? get note; bool get isOpen;/// Readers' copies on sale now that match.
 int get matchCount;/// Readers who have the book and were told about this request.
 int get notifiedSellers;
/// Create a copy of BookRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookRequestCopyWith<BookRequest> get copyWith => _$BookRequestCopyWithImpl<BookRequest>(this as BookRequest, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BookRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookRequest&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.maxPriceBdt, _this.maxPriceBdt) || other.maxPriceBdt == _this.maxPriceBdt)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.isOpen, _this.isOpen) || other.isOpen == _this.isOpen)&&(identical(other.matchCount, _this.matchCount) || other.matchCount == _this.matchCount)&&(identical(other.notifiedSellers, _this.notifiedSellers) || other.notifiedSellers == _this.notifiedSellers));
}


@override
int get hashCode {
  final _this = this as BookRequest;
  return Object.hash(runtimeType,_this.id,_this.title,_this.createdAt,_this.author,_this.bookId,_this.maxPriceBdt,_this.note,_this.isOpen,_this.matchCount,_this.notifiedSellers);
}

@override
String toString() {
  final _this = this as BookRequest;
  return 'BookRequest(id: ${_this.id}, title: ${_this.title}, createdAt: ${_this.createdAt}, author: ${_this.author}, bookId: ${_this.bookId}, maxPriceBdt: ${_this.maxPriceBdt}, note: ${_this.note}, isOpen: ${_this.isOpen}, matchCount: ${_this.matchCount}, notifiedSellers: ${_this.notifiedSellers})';
}


}

/// @nodoc
abstract mixin class $BookRequestCopyWith<$Res>  {
  factory $BookRequestCopyWith(BookRequest value, $Res Function(BookRequest) _then) = _$BookRequestCopyWithImpl;
@useResult
$Res call({
 String id, String title, DateTime createdAt, String? author, String? bookId, int? maxPriceBdt, String? note, bool isOpen, int matchCount, int notifiedSellers
});




}
/// @nodoc
class _$BookRequestCopyWithImpl<$Res>
    implements $BookRequestCopyWith<$Res> {
  _$BookRequestCopyWithImpl(this._self, this._then);

  final BookRequest _self;
  final $Res Function(BookRequest) _then;

/// Create a copy of BookRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? author = freezed,Object? bookId = freezed,Object? maxPriceBdt = freezed,Object? note = freezed,Object? isOpen = null,Object? matchCount = null,Object? notifiedSellers = null,}) {
  return _then(BookRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,maxPriceBdt: freezed == maxPriceBdt ? _self.maxPriceBdt : maxPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,matchCount: null == matchCount ? _self.matchCount : matchCount // ignore: cast_nullable_to_non_nullable
as int,notifiedSellers: null == notifiedSellers ? _self.notifiedSellers : notifiedSellers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BookRequest].
extension BookRequestPatterns on BookRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookRequest value)  $default,){
final _that = this;
switch (_that) {
case _BookRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BookRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  DateTime createdAt,  String? author,  String? bookId,  int? maxPriceBdt,  String? note,  bool isOpen,  int matchCount,  int notifiedSellers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookRequest() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.author,_that.bookId,_that.maxPriceBdt,_that.note,_that.isOpen,_that.matchCount,_that.notifiedSellers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  DateTime createdAt,  String? author,  String? bookId,  int? maxPriceBdt,  String? note,  bool isOpen,  int matchCount,  int notifiedSellers)  $default,) {final _that = this;
switch (_that) {
case _BookRequest():
return $default(_that.id,_that.title,_that.createdAt,_that.author,_that.bookId,_that.maxPriceBdt,_that.note,_that.isOpen,_that.matchCount,_that.notifiedSellers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  DateTime createdAt,  String? author,  String? bookId,  int? maxPriceBdt,  String? note,  bool isOpen,  int matchCount,  int notifiedSellers)?  $default,) {final _that = this;
switch (_that) {
case _BookRequest() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.author,_that.bookId,_that.maxPriceBdt,_that.note,_that.isOpen,_that.matchCount,_that.notifiedSellers);case _:
  return null;

}
}

}

/// @nodoc


class _BookRequest implements BookRequest {
  const _BookRequest({required this.id, required this.title, required this.createdAt, this.author, this.bookId, this.maxPriceBdt, this.note, this.isOpen = true, this.matchCount = 0, this.notifiedSellers = 0});
  

@override final  String id;
@override final  String title;
@override final  DateTime createdAt;
@override final  String? author;
/// The catalog Book, when it came from Search or the scanner.
@override final  String? bookId;
@override final  int? maxPriceBdt;
@override final  String? note;
@override@JsonKey() final  bool isOpen;
/// Readers' copies on sale now that match.
@override@JsonKey() final  int matchCount;
/// Readers who have the book and were told about this request.
@override@JsonKey() final  int notifiedSellers;

/// Create a copy of BookRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookRequestCopyWith<_BookRequest> get copyWith => __$BookRequestCopyWithImpl<_BookRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.maxPriceBdt, maxPriceBdt) || other.maxPriceBdt == maxPriceBdt)&&(identical(other.note, note) || other.note == note)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.matchCount, matchCount) || other.matchCount == matchCount)&&(identical(other.notifiedSellers, notifiedSellers) || other.notifiedSellers == notifiedSellers));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,createdAt,author,bookId,maxPriceBdt,note,isOpen,matchCount,notifiedSellers);
}

@override
String toString() {
    return 'BookRequest(id: $id, title: $title, createdAt: $createdAt, author: $author, bookId: $bookId, maxPriceBdt: $maxPriceBdt, note: $note, isOpen: $isOpen, matchCount: $matchCount, notifiedSellers: $notifiedSellers)';
}


}

/// @nodoc
abstract mixin class _$BookRequestCopyWith<$Res> implements $BookRequestCopyWith<$Res> {
  factory _$BookRequestCopyWith(_BookRequest value, $Res Function(_BookRequest) _then) = __$BookRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime createdAt, String? author, String? bookId, int? maxPriceBdt, String? note, bool isOpen, int matchCount, int notifiedSellers
});




}
/// @nodoc
class __$BookRequestCopyWithImpl<$Res>
    implements _$BookRequestCopyWith<$Res> {
  __$BookRequestCopyWithImpl(this._self, this._then);

  final _BookRequest _self;
  final $Res Function(_BookRequest) _then;

/// Create a copy of BookRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? author = freezed,Object? bookId = freezed,Object? maxPriceBdt = freezed,Object? note = freezed,Object? isOpen = null,Object? matchCount = null,Object? notifiedSellers = null,}) {
  return _then(_BookRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,maxPriceBdt: freezed == maxPriceBdt ? _self.maxPriceBdt : maxPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,matchCount: null == matchCount ? _self.matchCount : matchCount // ignore: cast_nullable_to_non_nullable
as int,notifiedSellers: null == notifiedSellers ? _self.notifiedSellers : notifiedSellers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BookRequestDraft {

 String get title; String? get author; String? get bookId; int? get maxPriceBdt; String? get note;
/// Create a copy of BookRequestDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookRequestDraftCopyWith<BookRequestDraft> get copyWith => _$BookRequestDraftCopyWithImpl<BookRequestDraft>(this as BookRequestDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BookRequestDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookRequestDraft&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.maxPriceBdt, _this.maxPriceBdt) || other.maxPriceBdt == _this.maxPriceBdt)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as BookRequestDraft;
  return Object.hash(runtimeType,_this.title,_this.author,_this.bookId,_this.maxPriceBdt,_this.note);
}

@override
String toString() {
  final _this = this as BookRequestDraft;
  return 'BookRequestDraft(title: ${_this.title}, author: ${_this.author}, bookId: ${_this.bookId}, maxPriceBdt: ${_this.maxPriceBdt}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $BookRequestDraftCopyWith<$Res>  {
  factory $BookRequestDraftCopyWith(BookRequestDraft value, $Res Function(BookRequestDraft) _then) = _$BookRequestDraftCopyWithImpl;
@useResult
$Res call({
 String title, String? author, String? bookId, int? maxPriceBdt, String? note
});




}
/// @nodoc
class _$BookRequestDraftCopyWithImpl<$Res>
    implements $BookRequestDraftCopyWith<$Res> {
  _$BookRequestDraftCopyWithImpl(this._self, this._then);

  final BookRequestDraft _self;
  final $Res Function(BookRequestDraft) _then;

/// Create a copy of BookRequestDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? author = freezed,Object? bookId = freezed,Object? maxPriceBdt = freezed,Object? note = freezed,}) {
  return _then(BookRequestDraft(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,maxPriceBdt: freezed == maxPriceBdt ? _self.maxPriceBdt : maxPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookRequestDraft].
extension BookRequestDraftPatterns on BookRequestDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookRequestDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookRequestDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookRequestDraft value)  $default,){
final _that = this;
switch (_that) {
case _BookRequestDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookRequestDraft value)?  $default,){
final _that = this;
switch (_that) {
case _BookRequestDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? author,  String? bookId,  int? maxPriceBdt,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookRequestDraft() when $default != null:
return $default(_that.title,_that.author,_that.bookId,_that.maxPriceBdt,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? author,  String? bookId,  int? maxPriceBdt,  String? note)  $default,) {final _that = this;
switch (_that) {
case _BookRequestDraft():
return $default(_that.title,_that.author,_that.bookId,_that.maxPriceBdt,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? author,  String? bookId,  int? maxPriceBdt,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _BookRequestDraft() when $default != null:
return $default(_that.title,_that.author,_that.bookId,_that.maxPriceBdt,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _BookRequestDraft implements BookRequestDraft {
  const _BookRequestDraft({required this.title, this.author, this.bookId, this.maxPriceBdt, this.note});
  

@override final  String title;
@override final  String? author;
@override final  String? bookId;
@override final  int? maxPriceBdt;
@override final  String? note;

/// Create a copy of BookRequestDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookRequestDraftCopyWith<_BookRequestDraft> get copyWith => __$BookRequestDraftCopyWithImpl<_BookRequestDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookRequestDraft&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.maxPriceBdt, maxPriceBdt) || other.maxPriceBdt == maxPriceBdt)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,author,bookId,maxPriceBdt,note);
}

@override
String toString() {
    return 'BookRequestDraft(title: $title, author: $author, bookId: $bookId, maxPriceBdt: $maxPriceBdt, note: $note)';
}


}

/// @nodoc
abstract mixin class _$BookRequestDraftCopyWith<$Res> implements $BookRequestDraftCopyWith<$Res> {
  factory _$BookRequestDraftCopyWith(_BookRequestDraft value, $Res Function(_BookRequestDraft) _then) = __$BookRequestDraftCopyWithImpl;
@override @useResult
$Res call({
 String title, String? author, String? bookId, int? maxPriceBdt, String? note
});




}
/// @nodoc
class __$BookRequestDraftCopyWithImpl<$Res>
    implements _$BookRequestDraftCopyWith<$Res> {
  __$BookRequestDraftCopyWithImpl(this._self, this._then);

  final _BookRequestDraft _self;
  final $Res Function(_BookRequestDraft) _then;

/// Create a copy of BookRequestDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? author = freezed,Object? bookId = freezed,Object? maxPriceBdt = freezed,Object? note = freezed,}) {
  return _then(_BookRequestDraft(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,maxPriceBdt: freezed == maxPriceBdt ? _self.maxPriceBdt : maxPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$WantedBook {

 String get requestId; String get readerName; String get title; String get listingId; DateTime get createdAt; int? get maxPriceBdt;
/// Create a copy of WantedBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WantedBookCopyWith<WantedBook> get copyWith => _$WantedBookCopyWithImpl<WantedBook>(this as WantedBook, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WantedBook;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WantedBook&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.readerName, _this.readerName) || other.readerName == _this.readerName)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.listingId, _this.listingId) || other.listingId == _this.listingId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.maxPriceBdt, _this.maxPriceBdt) || other.maxPriceBdt == _this.maxPriceBdt));
}


@override
int get hashCode {
  final _this = this as WantedBook;
  return Object.hash(runtimeType,_this.requestId,_this.readerName,_this.title,_this.listingId,_this.createdAt,_this.maxPriceBdt);
}

@override
String toString() {
  final _this = this as WantedBook;
  return 'WantedBook(requestId: ${_this.requestId}, readerName: ${_this.readerName}, title: ${_this.title}, listingId: ${_this.listingId}, createdAt: ${_this.createdAt}, maxPriceBdt: ${_this.maxPriceBdt})';
}


}

/// @nodoc
abstract mixin class $WantedBookCopyWith<$Res>  {
  factory $WantedBookCopyWith(WantedBook value, $Res Function(WantedBook) _then) = _$WantedBookCopyWithImpl;
@useResult
$Res call({
 String requestId, String readerName, String title, String listingId, DateTime createdAt, int? maxPriceBdt
});




}
/// @nodoc
class _$WantedBookCopyWithImpl<$Res>
    implements $WantedBookCopyWith<$Res> {
  _$WantedBookCopyWithImpl(this._self, this._then);

  final WantedBook _self;
  final $Res Function(WantedBook) _then;

/// Create a copy of WantedBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? readerName = null,Object? title = null,Object? listingId = null,Object? createdAt = null,Object? maxPriceBdt = freezed,}) {
  return _then(WantedBook(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,readerName: null == readerName ? _self.readerName : readerName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,maxPriceBdt: freezed == maxPriceBdt ? _self.maxPriceBdt : maxPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [WantedBook].
extension WantedBookPatterns on WantedBook {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WantedBook value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WantedBook() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WantedBook value)  $default,){
final _that = this;
switch (_that) {
case _WantedBook():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WantedBook value)?  $default,){
final _that = this;
switch (_that) {
case _WantedBook() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String readerName,  String title,  String listingId,  DateTime createdAt,  int? maxPriceBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WantedBook() when $default != null:
return $default(_that.requestId,_that.readerName,_that.title,_that.listingId,_that.createdAt,_that.maxPriceBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String readerName,  String title,  String listingId,  DateTime createdAt,  int? maxPriceBdt)  $default,) {final _that = this;
switch (_that) {
case _WantedBook():
return $default(_that.requestId,_that.readerName,_that.title,_that.listingId,_that.createdAt,_that.maxPriceBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String readerName,  String title,  String listingId,  DateTime createdAt,  int? maxPriceBdt)?  $default,) {final _that = this;
switch (_that) {
case _WantedBook() when $default != null:
return $default(_that.requestId,_that.readerName,_that.title,_that.listingId,_that.createdAt,_that.maxPriceBdt);case _:
  return null;

}
}

}

/// @nodoc


class _WantedBook implements WantedBook {
  const _WantedBook({required this.requestId, required this.readerName, required this.title, required this.listingId, required this.createdAt, this.maxPriceBdt});
  

@override final  String requestId;
@override final  String readerName;
@override final  String title;
@override final  String listingId;
@override final  DateTime createdAt;
@override final  int? maxPriceBdt;

/// Create a copy of WantedBook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WantedBookCopyWith<_WantedBook> get copyWith => __$WantedBookCopyWithImpl<_WantedBook>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WantedBook&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.readerName, readerName) || other.readerName == readerName)&&(identical(other.title, title) || other.title == title)&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.maxPriceBdt, maxPriceBdt) || other.maxPriceBdt == maxPriceBdt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,requestId,readerName,title,listingId,createdAt,maxPriceBdt);
}

@override
String toString() {
    return 'WantedBook(requestId: $requestId, readerName: $readerName, title: $title, listingId: $listingId, createdAt: $createdAt, maxPriceBdt: $maxPriceBdt)';
}


}

/// @nodoc
abstract mixin class _$WantedBookCopyWith<$Res> implements $WantedBookCopyWith<$Res> {
  factory _$WantedBookCopyWith(_WantedBook value, $Res Function(_WantedBook) _then) = __$WantedBookCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String readerName, String title, String listingId, DateTime createdAt, int? maxPriceBdt
});




}
/// @nodoc
class __$WantedBookCopyWithImpl<$Res>
    implements _$WantedBookCopyWith<$Res> {
  __$WantedBookCopyWithImpl(this._self, this._then);

  final _WantedBook _self;
  final $Res Function(_WantedBook) _then;

/// Create a copy of WantedBook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? readerName = null,Object? title = null,Object? listingId = null,Object? createdAt = null,Object? maxPriceBdt = freezed,}) {
  return _then(_WantedBook(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,readerName: null == readerName ? _self.readerName : readerName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,maxPriceBdt: freezed == maxPriceBdt ? _self.maxPriceBdt : maxPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$BookDemand {

 String get title; int get requests;
/// Create a copy of BookDemand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookDemandCopyWith<BookDemand> get copyWith => _$BookDemandCopyWithImpl<BookDemand>(this as BookDemand, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BookDemand;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookDemand&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.requests, _this.requests) || other.requests == _this.requests));
}


@override
int get hashCode {
  final _this = this as BookDemand;
  return Object.hash(runtimeType,_this.title,_this.requests);
}

@override
String toString() {
  final _this = this as BookDemand;
  return 'BookDemand(title: ${_this.title}, requests: ${_this.requests})';
}


}

/// @nodoc
abstract mixin class $BookDemandCopyWith<$Res>  {
  factory $BookDemandCopyWith(BookDemand value, $Res Function(BookDemand) _then) = _$BookDemandCopyWithImpl;
@useResult
$Res call({
 String title, int requests
});




}
/// @nodoc
class _$BookDemandCopyWithImpl<$Res>
    implements $BookDemandCopyWith<$Res> {
  _$BookDemandCopyWithImpl(this._self, this._then);

  final BookDemand _self;
  final $Res Function(BookDemand) _then;

/// Create a copy of BookDemand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? requests = null,}) {
  return _then(BookDemand(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BookDemand].
extension BookDemandPatterns on BookDemand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookDemand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookDemand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookDemand value)  $default,){
final _that = this;
switch (_that) {
case _BookDemand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookDemand value)?  $default,){
final _that = this;
switch (_that) {
case _BookDemand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  int requests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookDemand() when $default != null:
return $default(_that.title,_that.requests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  int requests)  $default,) {final _that = this;
switch (_that) {
case _BookDemand():
return $default(_that.title,_that.requests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  int requests)?  $default,) {final _that = this;
switch (_that) {
case _BookDemand() when $default != null:
return $default(_that.title,_that.requests);case _:
  return null;

}
}

}

/// @nodoc


class _BookDemand implements BookDemand {
  const _BookDemand({required this.title, required this.requests});
  

@override final  String title;
@override final  int requests;

/// Create a copy of BookDemand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookDemandCopyWith<_BookDemand> get copyWith => __$BookDemandCopyWithImpl<_BookDemand>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookDemand&&(identical(other.title, title) || other.title == title)&&(identical(other.requests, requests) || other.requests == requests));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,requests);
}

@override
String toString() {
    return 'BookDemand(title: $title, requests: $requests)';
}


}

/// @nodoc
abstract mixin class _$BookDemandCopyWith<$Res> implements $BookDemandCopyWith<$Res> {
  factory _$BookDemandCopyWith(_BookDemand value, $Res Function(_BookDemand) _then) = __$BookDemandCopyWithImpl;
@override @useResult
$Res call({
 String title, int requests
});




}
/// @nodoc
class __$BookDemandCopyWithImpl<$Res>
    implements _$BookDemandCopyWith<$Res> {
  __$BookDemandCopyWithImpl(this._self, this._then);

  final _BookDemand _self;
  final $Res Function(_BookDemand) _then;

/// Create a copy of BookDemand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? requests = null,}) {
  return _then(_BookDemand(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
