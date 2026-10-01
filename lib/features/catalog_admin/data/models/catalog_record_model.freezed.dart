// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogRecordModel {

 String get id; String get name; String? get nameBn; Section? get section; int get bookCount;
/// Create a copy of CatalogRecordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogRecordModelCopyWith<CatalogRecordModel> get copyWith => _$CatalogRecordModelCopyWithImpl<CatalogRecordModel>(this as CatalogRecordModel, _$identity);

  /// Serializes this CatalogRecordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CatalogRecordModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogRecordModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn)&&(identical(other.section, _this.section) || other.section == _this.section)&&(identical(other.bookCount, _this.bookCount) || other.bookCount == _this.bookCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CatalogRecordModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.nameBn,_this.section,_this.bookCount);
}

@override
String toString() {
  final _this = this as CatalogRecordModel;
  return 'CatalogRecordModel(id: ${_this.id}, name: ${_this.name}, nameBn: ${_this.nameBn}, section: ${_this.section}, bookCount: ${_this.bookCount})';
}


}

/// @nodoc
abstract mixin class $CatalogRecordModelCopyWith<$Res>  {
  factory $CatalogRecordModelCopyWith(CatalogRecordModel value, $Res Function(CatalogRecordModel) _then) = _$CatalogRecordModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? nameBn, Section? section, int bookCount
});




}
/// @nodoc
class _$CatalogRecordModelCopyWithImpl<$Res>
    implements $CatalogRecordModelCopyWith<$Res> {
  _$CatalogRecordModelCopyWithImpl(this._self, this._then);

  final CatalogRecordModel _self;
  final $Res Function(CatalogRecordModel) _then;

/// Create a copy of CatalogRecordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameBn = freezed,Object? section = freezed,Object? bookCount = null,}) {
  return _then(CatalogRecordModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: freezed == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,bookCount: null == bookCount ? _self.bookCount : bookCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogRecordModel].
extension CatalogRecordModelPatterns on CatalogRecordModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogRecordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogRecordModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogRecordModel value)  $default,){
final _that = this;
switch (_that) {
case _CatalogRecordModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogRecordModel value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogRecordModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? nameBn,  Section? section,  int bookCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogRecordModel() when $default != null:
return $default(_that.id,_that.name,_that.nameBn,_that.section,_that.bookCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? nameBn,  Section? section,  int bookCount)  $default,) {final _that = this;
switch (_that) {
case _CatalogRecordModel():
return $default(_that.id,_that.name,_that.nameBn,_that.section,_that.bookCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? nameBn,  Section? section,  int bookCount)?  $default,) {final _that = this;
switch (_that) {
case _CatalogRecordModel() when $default != null:
return $default(_that.id,_that.name,_that.nameBn,_that.section,_that.bookCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogRecordModel implements CatalogRecordModel {
  const _CatalogRecordModel({required this.id, required this.name, this.nameBn, this.section, this.bookCount = 0});
  factory _CatalogRecordModel.fromJson(Map<String, dynamic> json) => _$CatalogRecordModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? nameBn;
@override final  Section? section;
@override@JsonKey() final  int bookCount;

/// Create a copy of CatalogRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogRecordModelCopyWith<_CatalogRecordModel> get copyWith => __$CatalogRecordModelCopyWithImpl<_CatalogRecordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogRecordModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.section, section) || other.section == section)&&(identical(other.bookCount, bookCount) || other.bookCount == bookCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,nameBn,section,bookCount);
}

@override
String toString() {
    return 'CatalogRecordModel(id: $id, name: $name, nameBn: $nameBn, section: $section, bookCount: $bookCount)';
}


}

/// @nodoc
abstract mixin class _$CatalogRecordModelCopyWith<$Res> implements $CatalogRecordModelCopyWith<$Res> {
  factory _$CatalogRecordModelCopyWith(_CatalogRecordModel value, $Res Function(_CatalogRecordModel) _then) = __$CatalogRecordModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? nameBn, Section? section, int bookCount
});




}
/// @nodoc
class __$CatalogRecordModelCopyWithImpl<$Res>
    implements _$CatalogRecordModelCopyWith<$Res> {
  __$CatalogRecordModelCopyWithImpl(this._self, this._then);

  final _CatalogRecordModel _self;
  final $Res Function(_CatalogRecordModel) _then;

/// Create a copy of CatalogRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameBn = freezed,Object? section = freezed,Object? bookCount = null,}) {
  return _then(_CatalogRecordModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: freezed == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,bookCount: null == bookCount ? _self.bookCount : bookCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
