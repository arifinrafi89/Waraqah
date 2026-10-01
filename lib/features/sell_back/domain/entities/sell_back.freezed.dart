// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sell_back.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellBackBook {

 String get bookId; String get title; String get author; int get newPriceBdt; int get coverSeed;
/// Create a copy of SellBackBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellBackBookCopyWith<SellBackBook> get copyWith => _$SellBackBookCopyWithImpl<SellBackBook>(this as SellBackBook, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SellBackBook;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellBackBook&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.newPriceBdt, _this.newPriceBdt) || other.newPriceBdt == _this.newPriceBdt)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed));
}


@override
int get hashCode {
  final _this = this as SellBackBook;
  return Object.hash(runtimeType,_this.bookId,_this.title,_this.author,_this.newPriceBdt,_this.coverSeed);
}

@override
String toString() {
  final _this = this as SellBackBook;
  return 'SellBackBook(bookId: ${_this.bookId}, title: ${_this.title}, author: ${_this.author}, newPriceBdt: ${_this.newPriceBdt}, coverSeed: ${_this.coverSeed})';
}


}

/// @nodoc
abstract mixin class $SellBackBookCopyWith<$Res>  {
  factory $SellBackBookCopyWith(SellBackBook value, $Res Function(SellBackBook) _then) = _$SellBackBookCopyWithImpl;
@useResult
$Res call({
 String bookId, String title, String author, int newPriceBdt, int coverSeed
});




}
/// @nodoc
class _$SellBackBookCopyWithImpl<$Res>
    implements $SellBackBookCopyWith<$Res> {
  _$SellBackBookCopyWithImpl(this._self, this._then);

  final SellBackBook _self;
  final $Res Function(SellBackBook) _then;

/// Create a copy of SellBackBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? newPriceBdt = null,Object? coverSeed = null,}) {
  return _then(SellBackBook(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,newPriceBdt: null == newPriceBdt ? _self.newPriceBdt : newPriceBdt // ignore: cast_nullable_to_non_nullable
as int,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SellBackBook].
extension SellBackBookPatterns on SellBackBook {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellBackBook value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellBackBook() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellBackBook value)  $default,){
final _that = this;
switch (_that) {
case _SellBackBook():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellBackBook value)?  $default,){
final _that = this;
switch (_that) {
case _SellBackBook() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookId,  String title,  String author,  int newPriceBdt,  int coverSeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellBackBook() when $default != null:
return $default(_that.bookId,_that.title,_that.author,_that.newPriceBdt,_that.coverSeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookId,  String title,  String author,  int newPriceBdt,  int coverSeed)  $default,) {final _that = this;
switch (_that) {
case _SellBackBook():
return $default(_that.bookId,_that.title,_that.author,_that.newPriceBdt,_that.coverSeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookId,  String title,  String author,  int newPriceBdt,  int coverSeed)?  $default,) {final _that = this;
switch (_that) {
case _SellBackBook() when $default != null:
return $default(_that.bookId,_that.title,_that.author,_that.newPriceBdt,_that.coverSeed);case _:
  return null;

}
}

}

/// @nodoc


class _SellBackBook implements SellBackBook {
  const _SellBackBook({required this.bookId, required this.title, required this.author, required this.newPriceBdt, this.coverSeed = 0});
  

@override final  String bookId;
@override final  String title;
@override final  String author;
@override final  int newPriceBdt;
@override@JsonKey() final  int coverSeed;

/// Create a copy of SellBackBook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellBackBookCopyWith<_SellBackBook> get copyWith => __$SellBackBookCopyWithImpl<_SellBackBook>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellBackBook&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.newPriceBdt, newPriceBdt) || other.newPriceBdt == newPriceBdt)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,bookId,title,author,newPriceBdt,coverSeed);
}

@override
String toString() {
    return 'SellBackBook(bookId: $bookId, title: $title, author: $author, newPriceBdt: $newPriceBdt, coverSeed: $coverSeed)';
}


}

/// @nodoc
abstract mixin class _$SellBackBookCopyWith<$Res> implements $SellBackBookCopyWith<$Res> {
  factory _$SellBackBookCopyWith(_SellBackBook value, $Res Function(_SellBackBook) _then) = __$SellBackBookCopyWithImpl;
@override @useResult
$Res call({
 String bookId, String title, String author, int newPriceBdt, int coverSeed
});




}
/// @nodoc
class __$SellBackBookCopyWithImpl<$Res>
    implements _$SellBackBookCopyWith<$Res> {
  __$SellBackBookCopyWithImpl(this._self, this._then);

  final _SellBackBook _self;
  final $Res Function(_SellBackBook) _then;

/// Create a copy of SellBackBook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? newPriceBdt = null,Object? coverSeed = null,}) {
  return _then(_SellBackBook(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,newPriceBdt: null == newPriceBdt ? _self.newPriceBdt : newPriceBdt // ignore: cast_nullable_to_non_nullable
as int,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$SellBack {

 String get id; SellBackBook get book; BookCondition get condition; int get quoteBdt; SellBackStatus get status; String get pickupAddress; DateTime get createdAt; int get flags;/// Staff's grade, and what Waraqah paid for it.
 BookCondition? get gradedCondition; int? get paidBdt;/// Who's selling, for staff.
 String? get readerName;
/// Create a copy of SellBack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellBackCopyWith<SellBack> get copyWith => _$SellBackCopyWithImpl<SellBack>(this as SellBack, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SellBack;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellBack&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.book, _this.book) || other.book == _this.book)&&(identical(other.condition, _this.condition) || other.condition == _this.condition)&&(identical(other.quoteBdt, _this.quoteBdt) || other.quoteBdt == _this.quoteBdt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.pickupAddress, _this.pickupAddress) || other.pickupAddress == _this.pickupAddress)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.flags, _this.flags) || other.flags == _this.flags)&&(identical(other.gradedCondition, _this.gradedCondition) || other.gradedCondition == _this.gradedCondition)&&(identical(other.paidBdt, _this.paidBdt) || other.paidBdt == _this.paidBdt)&&(identical(other.readerName, _this.readerName) || other.readerName == _this.readerName));
}


@override
int get hashCode {
  final _this = this as SellBack;
  return Object.hash(runtimeType,_this.id,_this.book,_this.condition,_this.quoteBdt,_this.status,_this.pickupAddress,_this.createdAt,_this.flags,_this.gradedCondition,_this.paidBdt,_this.readerName);
}

@override
String toString() {
  final _this = this as SellBack;
  return 'SellBack(id: ${_this.id}, book: ${_this.book}, condition: ${_this.condition}, quoteBdt: ${_this.quoteBdt}, status: ${_this.status}, pickupAddress: ${_this.pickupAddress}, createdAt: ${_this.createdAt}, flags: ${_this.flags}, gradedCondition: ${_this.gradedCondition}, paidBdt: ${_this.paidBdt}, readerName: ${_this.readerName})';
}


}

/// @nodoc
abstract mixin class $SellBackCopyWith<$Res>  {
  factory $SellBackCopyWith(SellBack value, $Res Function(SellBack) _then) = _$SellBackCopyWithImpl;
@useResult
$Res call({
 String id, SellBackBook book, BookCondition condition, int quoteBdt, SellBackStatus status, String pickupAddress, DateTime createdAt, int flags, BookCondition? gradedCondition, int? paidBdt, String? readerName
});


$SellBackBookCopyWith<$Res> get book;

}
/// @nodoc
class _$SellBackCopyWithImpl<$Res>
    implements $SellBackCopyWith<$Res> {
  _$SellBackCopyWithImpl(this._self, this._then);

  final SellBack _self;
  final $Res Function(SellBack) _then;

/// Create a copy of SellBack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? book = null,Object? condition = null,Object? quoteBdt = null,Object? status = null,Object? pickupAddress = null,Object? createdAt = null,Object? flags = null,Object? gradedCondition = freezed,Object? paidBdt = freezed,Object? readerName = freezed,}) {
  return _then(SellBack(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as SellBackBook,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,quoteBdt: null == quoteBdt ? _self.quoteBdt : quoteBdt // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SellBackStatus,pickupAddress: null == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as int,gradedCondition: freezed == gradedCondition ? _self.gradedCondition : gradedCondition // ignore: cast_nullable_to_non_nullable
as BookCondition?,paidBdt: freezed == paidBdt ? _self.paidBdt : paidBdt // ignore: cast_nullable_to_non_nullable
as int?,readerName: freezed == readerName ? _self.readerName : readerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SellBack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellBackBookCopyWith<$Res> get book {
  
  return $SellBackBookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [SellBack].
extension SellBackPatterns on SellBack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellBack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellBack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellBack value)  $default,){
final _that = this;
switch (_that) {
case _SellBack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellBack value)?  $default,){
final _that = this;
switch (_that) {
case _SellBack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  SellBackBook book,  BookCondition condition,  int quoteBdt,  SellBackStatus status,  String pickupAddress,  DateTime createdAt,  int flags,  BookCondition? gradedCondition,  int? paidBdt,  String? readerName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellBack() when $default != null:
return $default(_that.id,_that.book,_that.condition,_that.quoteBdt,_that.status,_that.pickupAddress,_that.createdAt,_that.flags,_that.gradedCondition,_that.paidBdt,_that.readerName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  SellBackBook book,  BookCondition condition,  int quoteBdt,  SellBackStatus status,  String pickupAddress,  DateTime createdAt,  int flags,  BookCondition? gradedCondition,  int? paidBdt,  String? readerName)  $default,) {final _that = this;
switch (_that) {
case _SellBack():
return $default(_that.id,_that.book,_that.condition,_that.quoteBdt,_that.status,_that.pickupAddress,_that.createdAt,_that.flags,_that.gradedCondition,_that.paidBdt,_that.readerName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  SellBackBook book,  BookCondition condition,  int quoteBdt,  SellBackStatus status,  String pickupAddress,  DateTime createdAt,  int flags,  BookCondition? gradedCondition,  int? paidBdt,  String? readerName)?  $default,) {final _that = this;
switch (_that) {
case _SellBack() when $default != null:
return $default(_that.id,_that.book,_that.condition,_that.quoteBdt,_that.status,_that.pickupAddress,_that.createdAt,_that.flags,_that.gradedCondition,_that.paidBdt,_that.readerName);case _:
  return null;

}
}

}

/// @nodoc


class _SellBack implements SellBack {
  const _SellBack({required this.id, required this.book, required this.condition, required this.quoteBdt, required this.status, required this.pickupAddress, required this.createdAt, this.flags = 0, this.gradedCondition, this.paidBdt, this.readerName});
  

@override final  String id;
@override final  SellBackBook book;
@override final  BookCondition condition;
@override final  int quoteBdt;
@override final  SellBackStatus status;
@override final  String pickupAddress;
@override final  DateTime createdAt;
@override@JsonKey() final  int flags;
/// Staff's grade, and what Waraqah paid for it.
@override final  BookCondition? gradedCondition;
@override final  int? paidBdt;
/// Who's selling, for staff.
@override final  String? readerName;

/// Create a copy of SellBack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellBackCopyWith<_SellBack> get copyWith => __$SellBackCopyWithImpl<_SellBack>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellBack&&(identical(other.id, id) || other.id == id)&&(identical(other.book, book) || other.book == book)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.quoteBdt, quoteBdt) || other.quoteBdt == quoteBdt)&&(identical(other.status, status) || other.status == status)&&(identical(other.pickupAddress, pickupAddress) || other.pickupAddress == pickupAddress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.flags, flags) || other.flags == flags)&&(identical(other.gradedCondition, gradedCondition) || other.gradedCondition == gradedCondition)&&(identical(other.paidBdt, paidBdt) || other.paidBdt == paidBdt)&&(identical(other.readerName, readerName) || other.readerName == readerName));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,book,condition,quoteBdt,status,pickupAddress,createdAt,flags,gradedCondition,paidBdt,readerName);
}

@override
String toString() {
    return 'SellBack(id: $id, book: $book, condition: $condition, quoteBdt: $quoteBdt, status: $status, pickupAddress: $pickupAddress, createdAt: $createdAt, flags: $flags, gradedCondition: $gradedCondition, paidBdt: $paidBdt, readerName: $readerName)';
}


}

/// @nodoc
abstract mixin class _$SellBackCopyWith<$Res> implements $SellBackCopyWith<$Res> {
  factory _$SellBackCopyWith(_SellBack value, $Res Function(_SellBack) _then) = __$SellBackCopyWithImpl;
@override @useResult
$Res call({
 String id, SellBackBook book, BookCondition condition, int quoteBdt, SellBackStatus status, String pickupAddress, DateTime createdAt, int flags, BookCondition? gradedCondition, int? paidBdt, String? readerName
});


@override $SellBackBookCopyWith<$Res> get book;

}
/// @nodoc
class __$SellBackCopyWithImpl<$Res>
    implements _$SellBackCopyWith<$Res> {
  __$SellBackCopyWithImpl(this._self, this._then);

  final _SellBack _self;
  final $Res Function(_SellBack) _then;

/// Create a copy of SellBack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? book = null,Object? condition = null,Object? quoteBdt = null,Object? status = null,Object? pickupAddress = null,Object? createdAt = null,Object? flags = null,Object? gradedCondition = freezed,Object? paidBdt = freezed,Object? readerName = freezed,}) {
  return _then(_SellBack(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as SellBackBook,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,quoteBdt: null == quoteBdt ? _self.quoteBdt : quoteBdt // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SellBackStatus,pickupAddress: null == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as int,gradedCondition: freezed == gradedCondition ? _self.gradedCondition : gradedCondition // ignore: cast_nullable_to_non_nullable
as BookCondition?,paidBdt: freezed == paidBdt ? _self.paidBdt : paidBdt // ignore: cast_nullable_to_non_nullable
as int?,readerName: freezed == readerName ? _self.readerName : readerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SellBack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellBackBookCopyWith<$Res> get book {
  
  return $SellBackBookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

/// @nodoc
mixin _$SellBackDraft {

 String get bookId; BookCondition get condition; String get pickupAddress; int get flags;
/// Create a copy of SellBackDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellBackDraftCopyWith<SellBackDraft> get copyWith => _$SellBackDraftCopyWithImpl<SellBackDraft>(this as SellBackDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SellBackDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellBackDraft&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.condition, _this.condition) || other.condition == _this.condition)&&(identical(other.pickupAddress, _this.pickupAddress) || other.pickupAddress == _this.pickupAddress)&&(identical(other.flags, _this.flags) || other.flags == _this.flags));
}


@override
int get hashCode {
  final _this = this as SellBackDraft;
  return Object.hash(runtimeType,_this.bookId,_this.condition,_this.pickupAddress,_this.flags);
}

@override
String toString() {
  final _this = this as SellBackDraft;
  return 'SellBackDraft(bookId: ${_this.bookId}, condition: ${_this.condition}, pickupAddress: ${_this.pickupAddress}, flags: ${_this.flags})';
}


}

/// @nodoc
abstract mixin class $SellBackDraftCopyWith<$Res>  {
  factory $SellBackDraftCopyWith(SellBackDraft value, $Res Function(SellBackDraft) _then) = _$SellBackDraftCopyWithImpl;
@useResult
$Res call({
 String bookId, BookCondition condition, String pickupAddress, int flags
});




}
/// @nodoc
class _$SellBackDraftCopyWithImpl<$Res>
    implements $SellBackDraftCopyWith<$Res> {
  _$SellBackDraftCopyWithImpl(this._self, this._then);

  final SellBackDraft _self;
  final $Res Function(SellBackDraft) _then;

/// Create a copy of SellBackDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? condition = null,Object? pickupAddress = null,Object? flags = null,}) {
  return _then(SellBackDraft(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,pickupAddress: null == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as String,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SellBackDraft].
extension SellBackDraftPatterns on SellBackDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellBackDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellBackDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellBackDraft value)  $default,){
final _that = this;
switch (_that) {
case _SellBackDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellBackDraft value)?  $default,){
final _that = this;
switch (_that) {
case _SellBackDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookId,  BookCondition condition,  String pickupAddress,  int flags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellBackDraft() when $default != null:
return $default(_that.bookId,_that.condition,_that.pickupAddress,_that.flags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookId,  BookCondition condition,  String pickupAddress,  int flags)  $default,) {final _that = this;
switch (_that) {
case _SellBackDraft():
return $default(_that.bookId,_that.condition,_that.pickupAddress,_that.flags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookId,  BookCondition condition,  String pickupAddress,  int flags)?  $default,) {final _that = this;
switch (_that) {
case _SellBackDraft() when $default != null:
return $default(_that.bookId,_that.condition,_that.pickupAddress,_that.flags);case _:
  return null;

}
}

}

/// @nodoc


class _SellBackDraft implements SellBackDraft {
  const _SellBackDraft({required this.bookId, required this.condition, required this.pickupAddress, this.flags = 0});
  

@override final  String bookId;
@override final  BookCondition condition;
@override final  String pickupAddress;
@override@JsonKey() final  int flags;

/// Create a copy of SellBackDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellBackDraftCopyWith<_SellBackDraft> get copyWith => __$SellBackDraftCopyWithImpl<_SellBackDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellBackDraft&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.pickupAddress, pickupAddress) || other.pickupAddress == pickupAddress)&&(identical(other.flags, flags) || other.flags == flags));
}


@override
int get hashCode {
    return Object.hash(runtimeType,bookId,condition,pickupAddress,flags);
}

@override
String toString() {
    return 'SellBackDraft(bookId: $bookId, condition: $condition, pickupAddress: $pickupAddress, flags: $flags)';
}


}

/// @nodoc
abstract mixin class _$SellBackDraftCopyWith<$Res> implements $SellBackDraftCopyWith<$Res> {
  factory _$SellBackDraftCopyWith(_SellBackDraft value, $Res Function(_SellBackDraft) _then) = __$SellBackDraftCopyWithImpl;
@override @useResult
$Res call({
 String bookId, BookCondition condition, String pickupAddress, int flags
});




}
/// @nodoc
class __$SellBackDraftCopyWithImpl<$Res>
    implements _$SellBackDraftCopyWith<$Res> {
  __$SellBackDraftCopyWithImpl(this._self, this._then);

  final _SellBackDraft _self;
  final $Res Function(_SellBackDraft) _then;

/// Create a copy of SellBackDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? condition = null,Object? pickupAddress = null,Object? flags = null,}) {
  return _then(_SellBackDraft(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,pickupAddress: null == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as String,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
