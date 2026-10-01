// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookRequestModel {

 String get id; String get title; DateTime get createdAt; String? get author; String? get bookId; int? get maxPriceBdt; String? get note; bool get isOpen; int get matchCount; int get notifiedSellers;/// Who asked. Only the server sees this.
@JsonKey(includeToJson: false) String get requesterId;
/// Create a copy of BookRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookRequestModelCopyWith<BookRequestModel> get copyWith => _$BookRequestModelCopyWithImpl<BookRequestModel>(this as BookRequestModel, _$identity);

  /// Serializes this BookRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookRequestModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookRequestModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.maxPriceBdt, _this.maxPriceBdt) || other.maxPriceBdt == _this.maxPriceBdt)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.isOpen, _this.isOpen) || other.isOpen == _this.isOpen)&&(identical(other.matchCount, _this.matchCount) || other.matchCount == _this.matchCount)&&(identical(other.notifiedSellers, _this.notifiedSellers) || other.notifiedSellers == _this.notifiedSellers)&&(identical(other.requesterId, _this.requesterId) || other.requesterId == _this.requesterId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookRequestModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.createdAt,_this.author,_this.bookId,_this.maxPriceBdt,_this.note,_this.isOpen,_this.matchCount,_this.notifiedSellers,_this.requesterId);
}

@override
String toString() {
  final _this = this as BookRequestModel;
  return 'BookRequestModel(id: ${_this.id}, title: ${_this.title}, createdAt: ${_this.createdAt}, author: ${_this.author}, bookId: ${_this.bookId}, maxPriceBdt: ${_this.maxPriceBdt}, note: ${_this.note}, isOpen: ${_this.isOpen}, matchCount: ${_this.matchCount}, notifiedSellers: ${_this.notifiedSellers}, requesterId: ${_this.requesterId})';
}


}

/// @nodoc
abstract mixin class $BookRequestModelCopyWith<$Res>  {
  factory $BookRequestModelCopyWith(BookRequestModel value, $Res Function(BookRequestModel) _then) = _$BookRequestModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, DateTime createdAt, String? author, String? bookId, int? maxPriceBdt, String? note, bool isOpen, int matchCount, int notifiedSellers,@JsonKey(includeToJson: false) String requesterId
});




}
/// @nodoc
class _$BookRequestModelCopyWithImpl<$Res>
    implements $BookRequestModelCopyWith<$Res> {
  _$BookRequestModelCopyWithImpl(this._self, this._then);

  final BookRequestModel _self;
  final $Res Function(BookRequestModel) _then;

/// Create a copy of BookRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? author = freezed,Object? bookId = freezed,Object? maxPriceBdt = freezed,Object? note = freezed,Object? isOpen = null,Object? matchCount = null,Object? notifiedSellers = null,Object? requesterId = null,}) {
  return _then(BookRequestModel(
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
as int,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookRequestModel].
extension BookRequestModelPatterns on BookRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _BookRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  DateTime createdAt,  String? author,  String? bookId,  int? maxPriceBdt,  String? note,  bool isOpen,  int matchCount,  int notifiedSellers, @JsonKey(includeToJson: false)  String requesterId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookRequestModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.author,_that.bookId,_that.maxPriceBdt,_that.note,_that.isOpen,_that.matchCount,_that.notifiedSellers,_that.requesterId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  DateTime createdAt,  String? author,  String? bookId,  int? maxPriceBdt,  String? note,  bool isOpen,  int matchCount,  int notifiedSellers, @JsonKey(includeToJson: false)  String requesterId)  $default,) {final _that = this;
switch (_that) {
case _BookRequestModel():
return $default(_that.id,_that.title,_that.createdAt,_that.author,_that.bookId,_that.maxPriceBdt,_that.note,_that.isOpen,_that.matchCount,_that.notifiedSellers,_that.requesterId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  DateTime createdAt,  String? author,  String? bookId,  int? maxPriceBdt,  String? note,  bool isOpen,  int matchCount,  int notifiedSellers, @JsonKey(includeToJson: false)  String requesterId)?  $default,) {final _that = this;
switch (_that) {
case _BookRequestModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.author,_that.bookId,_that.maxPriceBdt,_that.note,_that.isOpen,_that.matchCount,_that.notifiedSellers,_that.requesterId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookRequestModel implements BookRequestModel {
  const _BookRequestModel({required this.id, required this.title, required this.createdAt, this.author, this.bookId, this.maxPriceBdt, this.note, this.isOpen = true, this.matchCount = 0, this.notifiedSellers = 0, @JsonKey(includeToJson: false) this.requesterId = 'me'});
  factory _BookRequestModel.fromJson(Map<String, dynamic> json) => _$BookRequestModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  DateTime createdAt;
@override final  String? author;
@override final  String? bookId;
@override final  int? maxPriceBdt;
@override final  String? note;
@override@JsonKey() final  bool isOpen;
@override@JsonKey() final  int matchCount;
@override@JsonKey() final  int notifiedSellers;
/// Who asked. Only the server sees this.
@override@JsonKey(includeToJson: false) final  String requesterId;

/// Create a copy of BookRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookRequestModelCopyWith<_BookRequestModel> get copyWith => __$BookRequestModelCopyWithImpl<_BookRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.maxPriceBdt, maxPriceBdt) || other.maxPriceBdt == maxPriceBdt)&&(identical(other.note, note) || other.note == note)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.matchCount, matchCount) || other.matchCount == matchCount)&&(identical(other.notifiedSellers, notifiedSellers) || other.notifiedSellers == notifiedSellers)&&(identical(other.requesterId, requesterId) || other.requesterId == requesterId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,createdAt,author,bookId,maxPriceBdt,note,isOpen,matchCount,notifiedSellers,requesterId);
}

@override
String toString() {
    return 'BookRequestModel(id: $id, title: $title, createdAt: $createdAt, author: $author, bookId: $bookId, maxPriceBdt: $maxPriceBdt, note: $note, isOpen: $isOpen, matchCount: $matchCount, notifiedSellers: $notifiedSellers, requesterId: $requesterId)';
}


}

/// @nodoc
abstract mixin class _$BookRequestModelCopyWith<$Res> implements $BookRequestModelCopyWith<$Res> {
  factory _$BookRequestModelCopyWith(_BookRequestModel value, $Res Function(_BookRequestModel) _then) = __$BookRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime createdAt, String? author, String? bookId, int? maxPriceBdt, String? note, bool isOpen, int matchCount, int notifiedSellers,@JsonKey(includeToJson: false) String requesterId
});




}
/// @nodoc
class __$BookRequestModelCopyWithImpl<$Res>
    implements _$BookRequestModelCopyWith<$Res> {
  __$BookRequestModelCopyWithImpl(this._self, this._then);

  final _BookRequestModel _self;
  final $Res Function(_BookRequestModel) _then;

/// Create a copy of BookRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? author = freezed,Object? bookId = freezed,Object? maxPriceBdt = freezed,Object? note = freezed,Object? isOpen = null,Object? matchCount = null,Object? notifiedSellers = null,Object? requesterId = null,}) {
  return _then(_BookRequestModel(
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
as int,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
