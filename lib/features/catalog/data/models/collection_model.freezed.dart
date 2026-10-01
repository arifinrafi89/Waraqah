// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CollectionModel {

 String get id; String get titleEn; String get titleBn; String get noteEn; String get noteBn; List<String> get bookIds; Section? get section; String? get expertId;
/// Create a copy of CollectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionModelCopyWith<CollectionModel> get copyWith => _$CollectionModelCopyWithImpl<CollectionModel>(this as CollectionModel, _$identity);

  /// Serializes this CollectionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CollectionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.titleEn, _this.titleEn) || other.titleEn == _this.titleEn)&&(identical(other.titleBn, _this.titleBn) || other.titleBn == _this.titleBn)&&(identical(other.noteEn, _this.noteEn) || other.noteEn == _this.noteEn)&&(identical(other.noteBn, _this.noteBn) || other.noteBn == _this.noteBn)&&const DeepCollectionEquality().equals(other.bookIds, _this.bookIds)&&(identical(other.section, _this.section) || other.section == _this.section)&&(identical(other.expertId, _this.expertId) || other.expertId == _this.expertId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CollectionModel;
  return Object.hash(runtimeType,_this.id,_this.titleEn,_this.titleBn,_this.noteEn,_this.noteBn,const DeepCollectionEquality().hash(_this.bookIds),_this.section,_this.expertId);
}

@override
String toString() {
  final _this = this as CollectionModel;
  return 'CollectionModel(id: ${_this.id}, titleEn: ${_this.titleEn}, titleBn: ${_this.titleBn}, noteEn: ${_this.noteEn}, noteBn: ${_this.noteBn}, bookIds: ${_this.bookIds}, section: ${_this.section}, expertId: ${_this.expertId})';
}


}

/// @nodoc
abstract mixin class $CollectionModelCopyWith<$Res>  {
  factory $CollectionModelCopyWith(CollectionModel value, $Res Function(CollectionModel) _then) = _$CollectionModelCopyWithImpl;
@useResult
$Res call({
 String id, String titleEn, String titleBn, String noteEn, String noteBn, List<String> bookIds, Section? section, String? expertId
});




}
/// @nodoc
class _$CollectionModelCopyWithImpl<$Res>
    implements $CollectionModelCopyWith<$Res> {
  _$CollectionModelCopyWithImpl(this._self, this._then);

  final CollectionModel _self;
  final $Res Function(CollectionModel) _then;

/// Create a copy of CollectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titleEn = null,Object? titleBn = null,Object? noteEn = null,Object? noteBn = null,Object? bookIds = null,Object? section = freezed,Object? expertId = freezed,}) {
  return _then(CollectionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,noteEn: null == noteEn ? _self.noteEn : noteEn // ignore: cast_nullable_to_non_nullable
as String,noteBn: null == noteBn ? _self.noteBn : noteBn // ignore: cast_nullable_to_non_nullable
as String,bookIds: null == bookIds ? _self.bookIds : bookIds // ignore: cast_nullable_to_non_nullable
as List<String>,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,expertId: freezed == expertId ? _self.expertId : expertId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CollectionModel].
extension CollectionModelPatterns on CollectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollectionModel value)  $default,){
final _that = this;
switch (_that) {
case _CollectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _CollectionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String titleEn,  String titleBn,  String noteEn,  String noteBn,  List<String> bookIds,  Section? section,  String? expertId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollectionModel() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleBn,_that.noteEn,_that.noteBn,_that.bookIds,_that.section,_that.expertId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String titleEn,  String titleBn,  String noteEn,  String noteBn,  List<String> bookIds,  Section? section,  String? expertId)  $default,) {final _that = this;
switch (_that) {
case _CollectionModel():
return $default(_that.id,_that.titleEn,_that.titleBn,_that.noteEn,_that.noteBn,_that.bookIds,_that.section,_that.expertId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String titleEn,  String titleBn,  String noteEn,  String noteBn,  List<String> bookIds,  Section? section,  String? expertId)?  $default,) {final _that = this;
switch (_that) {
case _CollectionModel() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleBn,_that.noteEn,_that.noteBn,_that.bookIds,_that.section,_that.expertId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CollectionModel implements CollectionModel {
  const _CollectionModel({required this.id, required this.titleEn, required this.titleBn, required this.noteEn, required this.noteBn, required  List<String> bookIds, this.section, this.expertId}): _bookIds = bookIds;
  factory _CollectionModel.fromJson(Map<String, dynamic> json) => _$CollectionModelFromJson(json);

@override final  String id;
@override final  String titleEn;
@override final  String titleBn;
@override final  String noteEn;
@override final  String noteBn;
 final  List<String> _bookIds;
@override List<String> get bookIds {
  if (_bookIds is EqualUnmodifiableListView) return _bookIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookIds);
}

@override final  Section? section;
@override final  String? expertId;

/// Create a copy of CollectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectionModelCopyWith<_CollectionModel> get copyWith => __$CollectionModelCopyWithImpl<_CollectionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollectionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleBn, titleBn) || other.titleBn == titleBn)&&(identical(other.noteEn, noteEn) || other.noteEn == noteEn)&&(identical(other.noteBn, noteBn) || other.noteBn == noteBn)&&const DeepCollectionEquality().equals(other.bookIds, _bookIds)&&(identical(other.section, section) || other.section == section)&&(identical(other.expertId, expertId) || other.expertId == expertId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,titleEn,titleBn,noteEn,noteBn,const DeepCollectionEquality().hash(_bookIds),section,expertId);
}

@override
String toString() {
    return 'CollectionModel(id: $id, titleEn: $titleEn, titleBn: $titleBn, noteEn: $noteEn, noteBn: $noteBn, bookIds: $bookIds, section: $section, expertId: $expertId)';
}


}

/// @nodoc
abstract mixin class _$CollectionModelCopyWith<$Res> implements $CollectionModelCopyWith<$Res> {
  factory _$CollectionModelCopyWith(_CollectionModel value, $Res Function(_CollectionModel) _then) = __$CollectionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String titleEn, String titleBn, String noteEn, String noteBn, List<String> bookIds, Section? section, String? expertId
});




}
/// @nodoc
class __$CollectionModelCopyWithImpl<$Res>
    implements _$CollectionModelCopyWith<$Res> {
  __$CollectionModelCopyWithImpl(this._self, this._then);

  final _CollectionModel _self;
  final $Res Function(_CollectionModel) _then;

/// Create a copy of CollectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titleEn = null,Object? titleBn = null,Object? noteEn = null,Object? noteBn = null,Object? bookIds = null,Object? section = freezed,Object? expertId = freezed,}) {
  return _then(_CollectionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,noteEn: null == noteEn ? _self.noteEn : noteEn // ignore: cast_nullable_to_non_nullable
as String,noteBn: null == noteBn ? _self.noteBn : noteBn // ignore: cast_nullable_to_non_nullable
as String,bookIds: null == bookIds ? _self._bookIds : bookIds // ignore: cast_nullable_to_non_nullable
as List<String>,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,expertId: freezed == expertId ? _self.expertId : expertId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
