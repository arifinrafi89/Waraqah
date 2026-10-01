// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sell_back_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SellBackBookModel {

 String get bookId; String get title; String get author; int get newPriceBdt; int get coverSeed;
/// Create a copy of SellBackBookModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellBackBookModelCopyWith<SellBackBookModel> get copyWith => _$SellBackBookModelCopyWithImpl<SellBackBookModel>(this as SellBackBookModel, _$identity);

  /// Serializes this SellBackBookModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SellBackBookModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellBackBookModel&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.newPriceBdt, _this.newPriceBdt) || other.newPriceBdt == _this.newPriceBdt)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SellBackBookModel;
  return Object.hash(runtimeType,_this.bookId,_this.title,_this.author,_this.newPriceBdt,_this.coverSeed);
}

@override
String toString() {
  final _this = this as SellBackBookModel;
  return 'SellBackBookModel(bookId: ${_this.bookId}, title: ${_this.title}, author: ${_this.author}, newPriceBdt: ${_this.newPriceBdt}, coverSeed: ${_this.coverSeed})';
}


}

/// @nodoc
abstract mixin class $SellBackBookModelCopyWith<$Res>  {
  factory $SellBackBookModelCopyWith(SellBackBookModel value, $Res Function(SellBackBookModel) _then) = _$SellBackBookModelCopyWithImpl;
@useResult
$Res call({
 String bookId, String title, String author, int newPriceBdt, int coverSeed
});




}
/// @nodoc
class _$SellBackBookModelCopyWithImpl<$Res>
    implements $SellBackBookModelCopyWith<$Res> {
  _$SellBackBookModelCopyWithImpl(this._self, this._then);

  final SellBackBookModel _self;
  final $Res Function(SellBackBookModel) _then;

/// Create a copy of SellBackBookModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? newPriceBdt = null,Object? coverSeed = null,}) {
  return _then(SellBackBookModel(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,newPriceBdt: null == newPriceBdt ? _self.newPriceBdt : newPriceBdt // ignore: cast_nullable_to_non_nullable
as int,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SellBackBookModel].
extension SellBackBookModelPatterns on SellBackBookModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellBackBookModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellBackBookModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellBackBookModel value)  $default,){
final _that = this;
switch (_that) {
case _SellBackBookModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellBackBookModel value)?  $default,){
final _that = this;
switch (_that) {
case _SellBackBookModel() when $default != null:
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
case _SellBackBookModel() when $default != null:
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
case _SellBackBookModel():
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
case _SellBackBookModel() when $default != null:
return $default(_that.bookId,_that.title,_that.author,_that.newPriceBdt,_that.coverSeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellBackBookModel implements SellBackBookModel {
  const _SellBackBookModel({required this.bookId, required this.title, required this.author, required this.newPriceBdt, this.coverSeed = 0});
  factory _SellBackBookModel.fromJson(Map<String, dynamic> json) => _$SellBackBookModelFromJson(json);

@override final  String bookId;
@override final  String title;
@override final  String author;
@override final  int newPriceBdt;
@override@JsonKey() final  int coverSeed;

/// Create a copy of SellBackBookModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellBackBookModelCopyWith<_SellBackBookModel> get copyWith => __$SellBackBookModelCopyWithImpl<_SellBackBookModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellBackBookModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellBackBookModel&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.newPriceBdt, newPriceBdt) || other.newPriceBdt == newPriceBdt)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,bookId,title,author,newPriceBdt,coverSeed);
}

@override
String toString() {
    return 'SellBackBookModel(bookId: $bookId, title: $title, author: $author, newPriceBdt: $newPriceBdt, coverSeed: $coverSeed)';
}


}

/// @nodoc
abstract mixin class _$SellBackBookModelCopyWith<$Res> implements $SellBackBookModelCopyWith<$Res> {
  factory _$SellBackBookModelCopyWith(_SellBackBookModel value, $Res Function(_SellBackBookModel) _then) = __$SellBackBookModelCopyWithImpl;
@override @useResult
$Res call({
 String bookId, String title, String author, int newPriceBdt, int coverSeed
});




}
/// @nodoc
class __$SellBackBookModelCopyWithImpl<$Res>
    implements _$SellBackBookModelCopyWith<$Res> {
  __$SellBackBookModelCopyWithImpl(this._self, this._then);

  final _SellBackBookModel _self;
  final $Res Function(_SellBackBookModel) _then;

/// Create a copy of SellBackBookModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? newPriceBdt = null,Object? coverSeed = null,}) {
  return _then(_SellBackBookModel(
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
mixin _$SellBackModel {

 String get id; SellBackBookModel get book; BookCondition get condition; int get quoteBdt; SellBackStatus get status; String get pickupAddress; DateTime get createdAt; int get flags; BookCondition? get gradedCondition; int? get paidBdt; String? get readerName;
/// Create a copy of SellBackModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellBackModelCopyWith<SellBackModel> get copyWith => _$SellBackModelCopyWithImpl<SellBackModel>(this as SellBackModel, _$identity);

  /// Serializes this SellBackModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SellBackModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellBackModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.book, _this.book) || other.book == _this.book)&&(identical(other.condition, _this.condition) || other.condition == _this.condition)&&(identical(other.quoteBdt, _this.quoteBdt) || other.quoteBdt == _this.quoteBdt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.pickupAddress, _this.pickupAddress) || other.pickupAddress == _this.pickupAddress)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.flags, _this.flags) || other.flags == _this.flags)&&(identical(other.gradedCondition, _this.gradedCondition) || other.gradedCondition == _this.gradedCondition)&&(identical(other.paidBdt, _this.paidBdt) || other.paidBdt == _this.paidBdt)&&(identical(other.readerName, _this.readerName) || other.readerName == _this.readerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SellBackModel;
  return Object.hash(runtimeType,_this.id,_this.book,_this.condition,_this.quoteBdt,_this.status,_this.pickupAddress,_this.createdAt,_this.flags,_this.gradedCondition,_this.paidBdt,_this.readerName);
}

@override
String toString() {
  final _this = this as SellBackModel;
  return 'SellBackModel(id: ${_this.id}, book: ${_this.book}, condition: ${_this.condition}, quoteBdt: ${_this.quoteBdt}, status: ${_this.status}, pickupAddress: ${_this.pickupAddress}, createdAt: ${_this.createdAt}, flags: ${_this.flags}, gradedCondition: ${_this.gradedCondition}, paidBdt: ${_this.paidBdt}, readerName: ${_this.readerName})';
}


}

/// @nodoc
abstract mixin class $SellBackModelCopyWith<$Res>  {
  factory $SellBackModelCopyWith(SellBackModel value, $Res Function(SellBackModel) _then) = _$SellBackModelCopyWithImpl;
@useResult
$Res call({
 String id, SellBackBookModel book, BookCondition condition, int quoteBdt, SellBackStatus status, String pickupAddress, DateTime createdAt, int flags, BookCondition? gradedCondition, int? paidBdt, String? readerName
});


$SellBackBookModelCopyWith<$Res> get book;

}
/// @nodoc
class _$SellBackModelCopyWithImpl<$Res>
    implements $SellBackModelCopyWith<$Res> {
  _$SellBackModelCopyWithImpl(this._self, this._then);

  final SellBackModel _self;
  final $Res Function(SellBackModel) _then;

/// Create a copy of SellBackModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? book = null,Object? condition = null,Object? quoteBdt = null,Object? status = null,Object? pickupAddress = null,Object? createdAt = null,Object? flags = null,Object? gradedCondition = freezed,Object? paidBdt = freezed,Object? readerName = freezed,}) {
  return _then(SellBackModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as SellBackBookModel,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
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
/// Create a copy of SellBackModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellBackBookModelCopyWith<$Res> get book {
  
  return $SellBackBookModelCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [SellBackModel].
extension SellBackModelPatterns on SellBackModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellBackModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellBackModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellBackModel value)  $default,){
final _that = this;
switch (_that) {
case _SellBackModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellBackModel value)?  $default,){
final _that = this;
switch (_that) {
case _SellBackModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  SellBackBookModel book,  BookCondition condition,  int quoteBdt,  SellBackStatus status,  String pickupAddress,  DateTime createdAt,  int flags,  BookCondition? gradedCondition,  int? paidBdt,  String? readerName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellBackModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  SellBackBookModel book,  BookCondition condition,  int quoteBdt,  SellBackStatus status,  String pickupAddress,  DateTime createdAt,  int flags,  BookCondition? gradedCondition,  int? paidBdt,  String? readerName)  $default,) {final _that = this;
switch (_that) {
case _SellBackModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  SellBackBookModel book,  BookCondition condition,  int quoteBdt,  SellBackStatus status,  String pickupAddress,  DateTime createdAt,  int flags,  BookCondition? gradedCondition,  int? paidBdt,  String? readerName)?  $default,) {final _that = this;
switch (_that) {
case _SellBackModel() when $default != null:
return $default(_that.id,_that.book,_that.condition,_that.quoteBdt,_that.status,_that.pickupAddress,_that.createdAt,_that.flags,_that.gradedCondition,_that.paidBdt,_that.readerName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SellBackModel implements SellBackModel {
  const _SellBackModel({required this.id, required this.book, required this.condition, required this.quoteBdt, required this.status, required this.pickupAddress, required this.createdAt, this.flags = 0, this.gradedCondition, this.paidBdt, this.readerName});
  factory _SellBackModel.fromJson(Map<String, dynamic> json) => _$SellBackModelFromJson(json);

@override final  String id;
@override final  SellBackBookModel book;
@override final  BookCondition condition;
@override final  int quoteBdt;
@override final  SellBackStatus status;
@override final  String pickupAddress;
@override final  DateTime createdAt;
@override@JsonKey() final  int flags;
@override final  BookCondition? gradedCondition;
@override final  int? paidBdt;
@override final  String? readerName;

/// Create a copy of SellBackModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellBackModelCopyWith<_SellBackModel> get copyWith => __$SellBackModelCopyWithImpl<_SellBackModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellBackModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellBackModel&&(identical(other.id, id) || other.id == id)&&(identical(other.book, book) || other.book == book)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.quoteBdt, quoteBdt) || other.quoteBdt == quoteBdt)&&(identical(other.status, status) || other.status == status)&&(identical(other.pickupAddress, pickupAddress) || other.pickupAddress == pickupAddress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.flags, flags) || other.flags == flags)&&(identical(other.gradedCondition, gradedCondition) || other.gradedCondition == gradedCondition)&&(identical(other.paidBdt, paidBdt) || other.paidBdt == paidBdt)&&(identical(other.readerName, readerName) || other.readerName == readerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,book,condition,quoteBdt,status,pickupAddress,createdAt,flags,gradedCondition,paidBdt,readerName);
}

@override
String toString() {
    return 'SellBackModel(id: $id, book: $book, condition: $condition, quoteBdt: $quoteBdt, status: $status, pickupAddress: $pickupAddress, createdAt: $createdAt, flags: $flags, gradedCondition: $gradedCondition, paidBdt: $paidBdt, readerName: $readerName)';
}


}

/// @nodoc
abstract mixin class _$SellBackModelCopyWith<$Res> implements $SellBackModelCopyWith<$Res> {
  factory _$SellBackModelCopyWith(_SellBackModel value, $Res Function(_SellBackModel) _then) = __$SellBackModelCopyWithImpl;
@override @useResult
$Res call({
 String id, SellBackBookModel book, BookCondition condition, int quoteBdt, SellBackStatus status, String pickupAddress, DateTime createdAt, int flags, BookCondition? gradedCondition, int? paidBdt, String? readerName
});


@override $SellBackBookModelCopyWith<$Res> get book;

}
/// @nodoc
class __$SellBackModelCopyWithImpl<$Res>
    implements _$SellBackModelCopyWith<$Res> {
  __$SellBackModelCopyWithImpl(this._self, this._then);

  final _SellBackModel _self;
  final $Res Function(_SellBackModel) _then;

/// Create a copy of SellBackModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? book = null,Object? condition = null,Object? quoteBdt = null,Object? status = null,Object? pickupAddress = null,Object? createdAt = null,Object? flags = null,Object? gradedCondition = freezed,Object? paidBdt = freezed,Object? readerName = freezed,}) {
  return _then(_SellBackModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as SellBackBookModel,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
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

/// Create a copy of SellBackModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellBackBookModelCopyWith<$Res> get book {
  
  return $SellBackBookModelCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

// dart format on
