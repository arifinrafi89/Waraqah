// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogRecord {

 String? get id; String get name; String get nameBn; Section? get section; int get bookCount;
/// Create a copy of CatalogRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogRecordCopyWith<CatalogRecord> get copyWith => _$CatalogRecordCopyWithImpl<CatalogRecord>(this as CatalogRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CatalogRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn)&&(identical(other.section, _this.section) || other.section == _this.section)&&(identical(other.bookCount, _this.bookCount) || other.bookCount == _this.bookCount));
}


@override
int get hashCode {
  final _this = this as CatalogRecord;
  return Object.hash(runtimeType,_this.id,_this.name,_this.nameBn,_this.section,_this.bookCount);
}

@override
String toString() {
  final _this = this as CatalogRecord;
  return 'CatalogRecord(id: ${_this.id}, name: ${_this.name}, nameBn: ${_this.nameBn}, section: ${_this.section}, bookCount: ${_this.bookCount})';
}


}

/// @nodoc
abstract mixin class $CatalogRecordCopyWith<$Res>  {
  factory $CatalogRecordCopyWith(CatalogRecord value, $Res Function(CatalogRecord) _then) = _$CatalogRecordCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String nameBn, Section? section, int bookCount
});




}
/// @nodoc
class _$CatalogRecordCopyWithImpl<$Res>
    implements $CatalogRecordCopyWith<$Res> {
  _$CatalogRecordCopyWithImpl(this._self, this._then);

  final CatalogRecord _self;
  final $Res Function(CatalogRecord) _then;

/// Create a copy of CatalogRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? nameBn = null,Object? section = freezed,Object? bookCount = null,}) {
  return _then(CatalogRecord(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,bookCount: null == bookCount ? _self.bookCount : bookCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogRecord].
extension CatalogRecordPatterns on CatalogRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogRecord value)  $default,){
final _that = this;
switch (_that) {
case _CatalogRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogRecord value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  String nameBn,  Section? section,  int bookCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogRecord() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  String nameBn,  Section? section,  int bookCount)  $default,) {final _that = this;
switch (_that) {
case _CatalogRecord():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  String nameBn,  Section? section,  int bookCount)?  $default,) {final _that = this;
switch (_that) {
case _CatalogRecord() when $default != null:
return $default(_that.id,_that.name,_that.nameBn,_that.section,_that.bookCount);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogRecord implements CatalogRecord {
  const _CatalogRecord({this.id, this.name = '', this.nameBn = '', this.section, this.bookCount = 0});
  

@override final  String? id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String nameBn;
@override final  Section? section;
@override@JsonKey() final  int bookCount;

/// Create a copy of CatalogRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogRecordCopyWith<_CatalogRecord> get copyWith => __$CatalogRecordCopyWithImpl<_CatalogRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.section, section) || other.section == section)&&(identical(other.bookCount, bookCount) || other.bookCount == bookCount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,nameBn,section,bookCount);
}

@override
String toString() {
    return 'CatalogRecord(id: $id, name: $name, nameBn: $nameBn, section: $section, bookCount: $bookCount)';
}


}

/// @nodoc
abstract mixin class _$CatalogRecordCopyWith<$Res> implements $CatalogRecordCopyWith<$Res> {
  factory _$CatalogRecordCopyWith(_CatalogRecord value, $Res Function(_CatalogRecord) _then) = __$CatalogRecordCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String nameBn, Section? section, int bookCount
});




}
/// @nodoc
class __$CatalogRecordCopyWithImpl<$Res>
    implements _$CatalogRecordCopyWith<$Res> {
  __$CatalogRecordCopyWithImpl(this._self, this._then);

  final _CatalogRecord _self;
  final $Res Function(_CatalogRecord) _then;

/// Create a copy of CatalogRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? nameBn = null,Object? section = freezed,Object? bookCount = null,}) {
  return _then(_CatalogRecord(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,bookCount: null == bookCount ? _self.bookCount : bookCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
