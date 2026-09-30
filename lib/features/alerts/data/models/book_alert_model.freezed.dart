// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_alert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookAlertModel {

 String get id; AlertKind get kind; String get bookId; String get editionId; String get bookTitle; int get currentPriceBdt; bool get isTriggered; int? get targetPriceBdt;
/// Create a copy of BookAlertModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookAlertModelCopyWith<BookAlertModel> get copyWith => _$BookAlertModelCopyWithImpl<BookAlertModel>(this as BookAlertModel, _$identity);

  /// Serializes this BookAlertModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookAlertModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookAlertModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.editionId, _this.editionId) || other.editionId == _this.editionId)&&(identical(other.bookTitle, _this.bookTitle) || other.bookTitle == _this.bookTitle)&&(identical(other.currentPriceBdt, _this.currentPriceBdt) || other.currentPriceBdt == _this.currentPriceBdt)&&(identical(other.isTriggered, _this.isTriggered) || other.isTriggered == _this.isTriggered)&&(identical(other.targetPriceBdt, _this.targetPriceBdt) || other.targetPriceBdt == _this.targetPriceBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookAlertModel;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.bookId,_this.editionId,_this.bookTitle,_this.currentPriceBdt,_this.isTriggered,_this.targetPriceBdt);
}

@override
String toString() {
  final _this = this as BookAlertModel;
  return 'BookAlertModel(id: ${_this.id}, kind: ${_this.kind}, bookId: ${_this.bookId}, editionId: ${_this.editionId}, bookTitle: ${_this.bookTitle}, currentPriceBdt: ${_this.currentPriceBdt}, isTriggered: ${_this.isTriggered}, targetPriceBdt: ${_this.targetPriceBdt})';
}


}

/// @nodoc
abstract mixin class $BookAlertModelCopyWith<$Res>  {
  factory $BookAlertModelCopyWith(BookAlertModel value, $Res Function(BookAlertModel) _then) = _$BookAlertModelCopyWithImpl;
@useResult
$Res call({
 String id, AlertKind kind, String bookId, String editionId, String bookTitle, int currentPriceBdt, bool isTriggered, int? targetPriceBdt
});




}
/// @nodoc
class _$BookAlertModelCopyWithImpl<$Res>
    implements $BookAlertModelCopyWith<$Res> {
  _$BookAlertModelCopyWithImpl(this._self, this._then);

  final BookAlertModel _self;
  final $Res Function(BookAlertModel) _then;

/// Create a copy of BookAlertModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? bookId = null,Object? editionId = null,Object? bookTitle = null,Object? currentPriceBdt = null,Object? isTriggered = null,Object? targetPriceBdt = freezed,}) {
  return _then(BookAlertModel(
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


/// Adds pattern-matching-related methods to [BookAlertModel].
extension BookAlertModelPatterns on BookAlertModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookAlertModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookAlertModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookAlertModel value)  $default,){
final _that = this;
switch (_that) {
case _BookAlertModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookAlertModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookAlertModel() when $default != null:
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
case _BookAlertModel() when $default != null:
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
case _BookAlertModel():
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
case _BookAlertModel() when $default != null:
return $default(_that.id,_that.kind,_that.bookId,_that.editionId,_that.bookTitle,_that.currentPriceBdt,_that.isTriggered,_that.targetPriceBdt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookAlertModel implements BookAlertModel {
  const _BookAlertModel({required this.id, required this.kind, required this.bookId, required this.editionId, required this.bookTitle, required this.currentPriceBdt, required this.isTriggered, this.targetPriceBdt});
  factory _BookAlertModel.fromJson(Map<String, dynamic> json) => _$BookAlertModelFromJson(json);

@override final  String id;
@override final  AlertKind kind;
@override final  String bookId;
@override final  String editionId;
@override final  String bookTitle;
@override final  int currentPriceBdt;
@override final  bool isTriggered;
@override final  int? targetPriceBdt;

/// Create a copy of BookAlertModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookAlertModelCopyWith<_BookAlertModel> get copyWith => __$BookAlertModelCopyWithImpl<_BookAlertModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookAlertModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookAlertModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.editionId, editionId) || other.editionId == editionId)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.currentPriceBdt, currentPriceBdt) || other.currentPriceBdt == currentPriceBdt)&&(identical(other.isTriggered, isTriggered) || other.isTriggered == isTriggered)&&(identical(other.targetPriceBdt, targetPriceBdt) || other.targetPriceBdt == targetPriceBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,bookId,editionId,bookTitle,currentPriceBdt,isTriggered,targetPriceBdt);
}

@override
String toString() {
    return 'BookAlertModel(id: $id, kind: $kind, bookId: $bookId, editionId: $editionId, bookTitle: $bookTitle, currentPriceBdt: $currentPriceBdt, isTriggered: $isTriggered, targetPriceBdt: $targetPriceBdt)';
}


}

/// @nodoc
abstract mixin class _$BookAlertModelCopyWith<$Res> implements $BookAlertModelCopyWith<$Res> {
  factory _$BookAlertModelCopyWith(_BookAlertModel value, $Res Function(_BookAlertModel) _then) = __$BookAlertModelCopyWithImpl;
@override @useResult
$Res call({
 String id, AlertKind kind, String bookId, String editionId, String bookTitle, int currentPriceBdt, bool isTriggered, int? targetPriceBdt
});




}
/// @nodoc
class __$BookAlertModelCopyWithImpl<$Res>
    implements _$BookAlertModelCopyWith<$Res> {
  __$BookAlertModelCopyWithImpl(this._self, this._then);

  final _BookAlertModel _self;
  final $Res Function(_BookAlertModel) _then;

/// Create a copy of BookAlertModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? bookId = null,Object? editionId = null,Object? bookTitle = null,Object? currentPriceBdt = null,Object? isTriggered = null,Object? targetPriceBdt = freezed,}) {
  return _then(_BookAlertModel(
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
