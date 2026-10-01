// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListDraft {

 String? get id; String get titleEn; String get titleBn; String get noteEn; String get noteBn; Section? get section; String? get expertId;/// `null` for a Collection.
 BooklistKind? get kind; List<String> get bookIds;
/// Create a copy of ListDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListDraftCopyWith<ListDraft> get copyWith => _$ListDraftCopyWithImpl<ListDraft>(this as ListDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ListDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDraft&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.titleEn, _this.titleEn) || other.titleEn == _this.titleEn)&&(identical(other.titleBn, _this.titleBn) || other.titleBn == _this.titleBn)&&(identical(other.noteEn, _this.noteEn) || other.noteEn == _this.noteEn)&&(identical(other.noteBn, _this.noteBn) || other.noteBn == _this.noteBn)&&(identical(other.section, _this.section) || other.section == _this.section)&&(identical(other.expertId, _this.expertId) || other.expertId == _this.expertId)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&const DeepCollectionEquality().equals(other.bookIds, _this.bookIds));
}


@override
int get hashCode {
  final _this = this as ListDraft;
  return Object.hash(runtimeType,_this.id,_this.titleEn,_this.titleBn,_this.noteEn,_this.noteBn,_this.section,_this.expertId,_this.kind,const DeepCollectionEquality().hash(_this.bookIds));
}

@override
String toString() {
  final _this = this as ListDraft;
  return 'ListDraft(id: ${_this.id}, titleEn: ${_this.titleEn}, titleBn: ${_this.titleBn}, noteEn: ${_this.noteEn}, noteBn: ${_this.noteBn}, section: ${_this.section}, expertId: ${_this.expertId}, kind: ${_this.kind}, bookIds: ${_this.bookIds})';
}


}

/// @nodoc
abstract mixin class $ListDraftCopyWith<$Res>  {
  factory $ListDraftCopyWith(ListDraft value, $Res Function(ListDraft) _then) = _$ListDraftCopyWithImpl;
@useResult
$Res call({
 String? id, String titleEn, String titleBn, String noteEn, String noteBn, Section? section, String? expertId, BooklistKind? kind, List<String> bookIds
});




}
/// @nodoc
class _$ListDraftCopyWithImpl<$Res>
    implements $ListDraftCopyWith<$Res> {
  _$ListDraftCopyWithImpl(this._self, this._then);

  final ListDraft _self;
  final $Res Function(ListDraft) _then;

/// Create a copy of ListDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? titleEn = null,Object? titleBn = null,Object? noteEn = null,Object? noteBn = null,Object? section = freezed,Object? expertId = freezed,Object? kind = freezed,Object? bookIds = null,}) {
  return _then(ListDraft(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,noteEn: null == noteEn ? _self.noteEn : noteEn // ignore: cast_nullable_to_non_nullable
as String,noteBn: null == noteBn ? _self.noteBn : noteBn // ignore: cast_nullable_to_non_nullable
as String,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,expertId: freezed == expertId ? _self.expertId : expertId // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as BooklistKind?,bookIds: null == bookIds ? _self.bookIds : bookIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListDraft].
extension ListDraftPatterns on ListDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListDraft value)  $default,){
final _that = this;
switch (_that) {
case _ListDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListDraft value)?  $default,){
final _that = this;
switch (_that) {
case _ListDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String titleEn,  String titleBn,  String noteEn,  String noteBn,  Section? section,  String? expertId,  BooklistKind? kind,  List<String> bookIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListDraft() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleBn,_that.noteEn,_that.noteBn,_that.section,_that.expertId,_that.kind,_that.bookIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String titleEn,  String titleBn,  String noteEn,  String noteBn,  Section? section,  String? expertId,  BooklistKind? kind,  List<String> bookIds)  $default,) {final _that = this;
switch (_that) {
case _ListDraft():
return $default(_that.id,_that.titleEn,_that.titleBn,_that.noteEn,_that.noteBn,_that.section,_that.expertId,_that.kind,_that.bookIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String titleEn,  String titleBn,  String noteEn,  String noteBn,  Section? section,  String? expertId,  BooklistKind? kind,  List<String> bookIds)?  $default,) {final _that = this;
switch (_that) {
case _ListDraft() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleBn,_that.noteEn,_that.noteBn,_that.section,_that.expertId,_that.kind,_that.bookIds);case _:
  return null;

}
}

}

/// @nodoc


class _ListDraft implements ListDraft {
  const _ListDraft({this.id, this.titleEn = '', this.titleBn = '', this.noteEn = '', this.noteBn = '', this.section, this.expertId, this.kind,  List<String> bookIds = const <String>[]}): _bookIds = bookIds;
  

@override final  String? id;
@override@JsonKey() final  String titleEn;
@override@JsonKey() final  String titleBn;
@override@JsonKey() final  String noteEn;
@override@JsonKey() final  String noteBn;
@override final  Section? section;
@override final  String? expertId;
/// `null` for a Collection.
@override final  BooklistKind? kind;
 final  List<String> _bookIds;
@override@JsonKey() List<String> get bookIds {
  if (_bookIds is EqualUnmodifiableListView) return _bookIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookIds);
}


/// Create a copy of ListDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListDraftCopyWith<_ListDraft> get copyWith => __$ListDraftCopyWithImpl<_ListDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleBn, titleBn) || other.titleBn == titleBn)&&(identical(other.noteEn, noteEn) || other.noteEn == noteEn)&&(identical(other.noteBn, noteBn) || other.noteBn == noteBn)&&(identical(other.section, section) || other.section == section)&&(identical(other.expertId, expertId) || other.expertId == expertId)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.bookIds, _bookIds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,titleEn,titleBn,noteEn,noteBn,section,expertId,kind,const DeepCollectionEquality().hash(_bookIds));
}

@override
String toString() {
    return 'ListDraft(id: $id, titleEn: $titleEn, titleBn: $titleBn, noteEn: $noteEn, noteBn: $noteBn, section: $section, expertId: $expertId, kind: $kind, bookIds: $bookIds)';
}


}

/// @nodoc
abstract mixin class _$ListDraftCopyWith<$Res> implements $ListDraftCopyWith<$Res> {
  factory _$ListDraftCopyWith(_ListDraft value, $Res Function(_ListDraft) _then) = __$ListDraftCopyWithImpl;
@override @useResult
$Res call({
 String? id, String titleEn, String titleBn, String noteEn, String noteBn, Section? section, String? expertId, BooklistKind? kind, List<String> bookIds
});




}
/// @nodoc
class __$ListDraftCopyWithImpl<$Res>
    implements _$ListDraftCopyWith<$Res> {
  __$ListDraftCopyWithImpl(this._self, this._then);

  final _ListDraft _self;
  final $Res Function(_ListDraft) _then;

/// Create a copy of ListDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? titleEn = null,Object? titleBn = null,Object? noteEn = null,Object? noteBn = null,Object? section = freezed,Object? expertId = freezed,Object? kind = freezed,Object? bookIds = null,}) {
  return _then(_ListDraft(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,noteEn: null == noteEn ? _self.noteEn : noteEn // ignore: cast_nullable_to_non_nullable
as String,noteBn: null == noteBn ? _self.noteBn : noteBn // ignore: cast_nullable_to_non_nullable
as String,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,expertId: freezed == expertId ? _self.expertId : expertId // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as BooklistKind?,bookIds: null == bookIds ? _self._bookIds : bookIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
