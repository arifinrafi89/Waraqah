// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookAlert {

 String get id; AlertKind get kind; String get bookId; String get editionId; String get bookTitle; int get currentPriceBdt; bool get isTriggered;/// Only for price drops: alert at this price or less.
 int? get targetPriceBdt;
/// Create a copy of BookAlert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookAlertCopyWith<BookAlert> get copyWith => _$BookAlertCopyWithImpl<BookAlert>(this as BookAlert, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BookAlert;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookAlert&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.editionId, _this.editionId) || other.editionId == _this.editionId)&&(identical(other.bookTitle, _this.bookTitle) || other.bookTitle == _this.bookTitle)&&(identical(other.currentPriceBdt, _this.currentPriceBdt) || other.currentPriceBdt == _this.currentPriceBdt)&&(identical(other.isTriggered, _this.isTriggered) || other.isTriggered == _this.isTriggered)&&(identical(other.targetPriceBdt, _this.targetPriceBdt) || other.targetPriceBdt == _this.targetPriceBdt));
}


@override
int get hashCode {
  final _this = this as BookAlert;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.bookId,_this.editionId,_this.bookTitle,_this.currentPriceBdt,_this.isTriggered,_this.targetPriceBdt);
}

@override
String toString() {
  final _this = this as BookAlert;
  return 'BookAlert(id: ${_this.id}, kind: ${_this.kind}, bookId: ${_this.bookId}, editionId: ${_this.editionId}, bookTitle: ${_this.bookTitle}, currentPriceBdt: ${_this.currentPriceBdt}, isTriggered: ${_this.isTriggered}, targetPriceBdt: ${_this.targetPriceBdt})';
}


}

/// @nodoc
abstract mixin class $BookAlertCopyWith<$Res>  {
  factory $BookAlertCopyWith(BookAlert value, $Res Function(BookAlert) _then) = _$BookAlertCopyWithImpl;
@useResult
$Res call({
 String id, AlertKind kind, String bookId, String editionId, String bookTitle, int currentPriceBdt, bool isTriggered, int? targetPriceBdt
});




}
/// @nodoc
class _$BookAlertCopyWithImpl<$Res>
    implements $BookAlertCopyWith<$Res> {
  _$BookAlertCopyWithImpl(this._self, this._then);

  final BookAlert _self;
  final $Res Function(BookAlert) _then;

/// Create a copy of BookAlert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? bookId = null,Object? editionId = null,Object? bookTitle = null,Object? currentPriceBdt = null,Object? isTriggered = null,Object? targetPriceBdt = freezed,}) {
  return _then(BookAlert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AlertKind,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,editionId: null == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as String,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,currentPriceBdt: null == currentPriceBdt ? _self.currentPriceBdt : currentPriceBdt // ignore: cast_nullable_to_non_nullable
as int,isTriggered: null == isTriggered ? _self.isTriggered : isTriggered // ignore: cast_nullable_to_non_nullable
as bool,targetPriceBdt: freezed == targetPriceBdt ? _self.targetPriceBdt : targetPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookAlert].
extension BookAlertPatterns on BookAlert {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookAlert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookAlert() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookAlert value)  $default,){
final _that = this;
switch (_that) {
case _BookAlert():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookAlert value)?  $default,){
final _that = this;
switch (_that) {
case _BookAlert() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  AlertKind kind,  String bookId,  String editionId,  String bookTitle,  int currentPriceBdt,  bool isTriggered,  int? targetPriceBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookAlert() when $default != null:
return $default(_that.id,_that.kind,_that.bookId,_that.editionId,_that.bookTitle,_that.currentPriceBdt,_that.isTriggered,_that.targetPriceBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  AlertKind kind,  String bookId,  String editionId,  String bookTitle,  int currentPriceBdt,  bool isTriggered,  int? targetPriceBdt)  $default,) {final _that = this;
switch (_that) {
case _BookAlert():
return $default(_that.id,_that.kind,_that.bookId,_that.editionId,_that.bookTitle,_that.currentPriceBdt,_that.isTriggered,_that.targetPriceBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  AlertKind kind,  String bookId,  String editionId,  String bookTitle,  int currentPriceBdt,  bool isTriggered,  int? targetPriceBdt)?  $default,) {final _that = this;
switch (_that) {
case _BookAlert() when $default != null:
return $default(_that.id,_that.kind,_that.bookId,_that.editionId,_that.bookTitle,_that.currentPriceBdt,_that.isTriggered,_that.targetPriceBdt);case _:
  return null;

}
}

}

/// @nodoc


class _BookAlert implements BookAlert {
  const _BookAlert({required this.id, required this.kind, required this.bookId, required this.editionId, required this.bookTitle, required this.currentPriceBdt, required this.isTriggered, this.targetPriceBdt});
  

@override final  String id;
@override final  AlertKind kind;
@override final  String bookId;
@override final  String editionId;
@override final  String bookTitle;
@override final  int currentPriceBdt;
@override final  bool isTriggered;
/// Only for price drops: alert at this price or less.
@override final  int? targetPriceBdt;

/// Create a copy of BookAlert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookAlertCopyWith<_BookAlert> get copyWith => __$BookAlertCopyWithImpl<_BookAlert>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.editionId, editionId) || other.editionId == editionId)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.currentPriceBdt, currentPriceBdt) || other.currentPriceBdt == currentPriceBdt)&&(identical(other.isTriggered, isTriggered) || other.isTriggered == isTriggered)&&(identical(other.targetPriceBdt, targetPriceBdt) || other.targetPriceBdt == targetPriceBdt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,bookId,editionId,bookTitle,currentPriceBdt,isTriggered,targetPriceBdt);
}

@override
String toString() {
    return 'BookAlert(id: $id, kind: $kind, bookId: $bookId, editionId: $editionId, bookTitle: $bookTitle, currentPriceBdt: $currentPriceBdt, isTriggered: $isTriggered, targetPriceBdt: $targetPriceBdt)';
}


}

/// @nodoc
abstract mixin class _$BookAlertCopyWith<$Res> implements $BookAlertCopyWith<$Res> {
  factory _$BookAlertCopyWith(_BookAlert value, $Res Function(_BookAlert) _then) = __$BookAlertCopyWithImpl;
@override @useResult
$Res call({
 String id, AlertKind kind, String bookId, String editionId, String bookTitle, int currentPriceBdt, bool isTriggered, int? targetPriceBdt
});




}
/// @nodoc
class __$BookAlertCopyWithImpl<$Res>
    implements _$BookAlertCopyWith<$Res> {
  __$BookAlertCopyWithImpl(this._self, this._then);

  final _BookAlert _self;
  final $Res Function(_BookAlert) _then;

/// Create a copy of BookAlert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? bookId = null,Object? editionId = null,Object? bookTitle = null,Object? currentPriceBdt = null,Object? isTriggered = null,Object? targetPriceBdt = freezed,}) {
  return _then(_BookAlert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AlertKind,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,editionId: null == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as String,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,currentPriceBdt: null == currentPriceBdt ? _self.currentPriceBdt : currentPriceBdt // ignore: cast_nullable_to_non_nullable
as int,isTriggered: null == isTriggered ? _self.isTriggered : isTriggered // ignore: cast_nullable_to_non_nullable
as bool,targetPriceBdt: freezed == targetPriceBdt ? _self.targetPriceBdt : targetPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
