// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booklist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BooklistModel {

 String get id; String get titleEn; String get titleBn; BooklistKind get kind; List<String> get bookIds; String? get noteEn; String? get noteBn; bool get isMine;
/// Create a copy of BooklistModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BooklistModelCopyWith<BooklistModel> get copyWith => _$BooklistModelCopyWithImpl<BooklistModel>(this as BooklistModel, _$identity);

  /// Serializes this BooklistModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BooklistModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BooklistModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.titleEn, _this.titleEn) || other.titleEn == _this.titleEn)&&(identical(other.titleBn, _this.titleBn) || other.titleBn == _this.titleBn)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&const DeepCollectionEquality().equals(other.bookIds, _this.bookIds)&&(identical(other.noteEn, _this.noteEn) || other.noteEn == _this.noteEn)&&(identical(other.noteBn, _this.noteBn) || other.noteBn == _this.noteBn)&&(identical(other.isMine, _this.isMine) || other.isMine == _this.isMine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BooklistModel;
  return Object.hash(runtimeType,_this.id,_this.titleEn,_this.titleBn,_this.kind,const DeepCollectionEquality().hash(_this.bookIds),_this.noteEn,_this.noteBn,_this.isMine);
}

@override
String toString() {
  final _this = this as BooklistModel;
  return 'BooklistModel(id: ${_this.id}, titleEn: ${_this.titleEn}, titleBn: ${_this.titleBn}, kind: ${_this.kind}, bookIds: ${_this.bookIds}, noteEn: ${_this.noteEn}, noteBn: ${_this.noteBn}, isMine: ${_this.isMine})';
}


}

/// @nodoc
abstract mixin class $BooklistModelCopyWith<$Res>  {
  factory $BooklistModelCopyWith(BooklistModel value, $Res Function(BooklistModel) _then) = _$BooklistModelCopyWithImpl;
@useResult
$Res call({
 String id, String titleEn, String titleBn, BooklistKind kind, List<String> bookIds, String? noteEn, String? noteBn, bool isMine
});




}
/// @nodoc
class _$BooklistModelCopyWithImpl<$Res>
    implements $BooklistModelCopyWith<$Res> {
  _$BooklistModelCopyWithImpl(this._self, this._then);

  final BooklistModel _self;
  final $Res Function(BooklistModel) _then;

/// Create a copy of BooklistModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titleEn = null,Object? titleBn = null,Object? kind = null,Object? bookIds = null,Object? noteEn = freezed,Object? noteBn = freezed,Object? isMine = null,}) {
  return _then(BooklistModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as BooklistKind,bookIds: null == bookIds ? _self.bookIds : bookIds // ignore: cast_nullable_to_non_nullable
as List<String>,noteEn: freezed == noteEn ? _self.noteEn : noteEn // ignore: cast_nullable_to_non_nullable
as String?,noteBn: freezed == noteBn ? _self.noteBn : noteBn // ignore: cast_nullable_to_non_nullable
as String?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BooklistModel].
extension BooklistModelPatterns on BooklistModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BooklistModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BooklistModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BooklistModel value)  $default,){
final _that = this;
switch (_that) {
case _BooklistModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BooklistModel value)?  $default,){
final _that = this;
switch (_that) {
case _BooklistModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String titleEn,  String titleBn,  BooklistKind kind,  List<String> bookIds,  String? noteEn,  String? noteBn,  bool isMine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BooklistModel() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleBn,_that.kind,_that.bookIds,_that.noteEn,_that.noteBn,_that.isMine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String titleEn,  String titleBn,  BooklistKind kind,  List<String> bookIds,  String? noteEn,  String? noteBn,  bool isMine)  $default,) {final _that = this;
switch (_that) {
case _BooklistModel():
return $default(_that.id,_that.titleEn,_that.titleBn,_that.kind,_that.bookIds,_that.noteEn,_that.noteBn,_that.isMine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String titleEn,  String titleBn,  BooklistKind kind,  List<String> bookIds,  String? noteEn,  String? noteBn,  bool isMine)?  $default,) {final _that = this;
switch (_that) {
case _BooklistModel() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleBn,_that.kind,_that.bookIds,_that.noteEn,_that.noteBn,_that.isMine);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BooklistModel implements BooklistModel {
  const _BooklistModel({required this.id, required this.titleEn, required this.titleBn, required this.kind, required  List<String> bookIds, this.noteEn, this.noteBn, this.isMine = false}): _bookIds = bookIds;
  factory _BooklistModel.fromJson(Map<String, dynamic> json) => _$BooklistModelFromJson(json);

@override final  String id;
@override final  String titleEn;
@override final  String titleBn;
@override final  BooklistKind kind;
 final  List<String> _bookIds;
@override List<String> get bookIds {
  if (_bookIds is EqualUnmodifiableListView) return _bookIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookIds);
}

@override final  String? noteEn;
@override final  String? noteBn;
@override@JsonKey() final  bool isMine;

/// Create a copy of BooklistModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BooklistModelCopyWith<_BooklistModel> get copyWith => __$BooklistModelCopyWithImpl<_BooklistModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BooklistModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BooklistModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleBn, titleBn) || other.titleBn == titleBn)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.bookIds, _bookIds)&&(identical(other.noteEn, noteEn) || other.noteEn == noteEn)&&(identical(other.noteBn, noteBn) || other.noteBn == noteBn)&&(identical(other.isMine, isMine) || other.isMine == isMine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,titleEn,titleBn,kind,const DeepCollectionEquality().hash(_bookIds),noteEn,noteBn,isMine);
}

@override
String toString() {
    return 'BooklistModel(id: $id, titleEn: $titleEn, titleBn: $titleBn, kind: $kind, bookIds: $bookIds, noteEn: $noteEn, noteBn: $noteBn, isMine: $isMine)';
}


}

/// @nodoc
abstract mixin class _$BooklistModelCopyWith<$Res> implements $BooklistModelCopyWith<$Res> {
  factory _$BooklistModelCopyWith(_BooklistModel value, $Res Function(_BooklistModel) _then) = __$BooklistModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String titleEn, String titleBn, BooklistKind kind, List<String> bookIds, String? noteEn, String? noteBn, bool isMine
});




}
/// @nodoc
class __$BooklistModelCopyWithImpl<$Res>
    implements _$BooklistModelCopyWith<$Res> {
  __$BooklistModelCopyWithImpl(this._self, this._then);

  final _BooklistModel _self;
  final $Res Function(_BooklistModel) _then;

/// Create a copy of BooklistModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titleEn = null,Object? titleBn = null,Object? kind = null,Object? bookIds = null,Object? noteEn = freezed,Object? noteBn = freezed,Object? isMine = null,}) {
  return _then(_BooklistModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as BooklistKind,bookIds: null == bookIds ? _self._bookIds : bookIds // ignore: cast_nullable_to_non_nullable
as List<String>,noteEn: freezed == noteEn ? _self.noteEn : noteEn // ignore: cast_nullable_to_non_nullable
as String?,noteBn: freezed == noteBn ? _self.noteBn : noteBn // ignore: cast_nullable_to_non_nullable
as String?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
