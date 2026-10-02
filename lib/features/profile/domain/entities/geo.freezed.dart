// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeoDivision {

 String get name; String get nameBn; List<GeoDistrict> get districts;
/// Create a copy of GeoDivision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoDivisionCopyWith<GeoDivision> get copyWith => _$GeoDivisionCopyWithImpl<GeoDivision>(this as GeoDivision, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GeoDivision;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoDivision&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn)&&const DeepCollectionEquality().equals(other.districts, _this.districts));
}


@override
int get hashCode {
  final _this = this as GeoDivision;
  return Object.hash(runtimeType,_this.name,_this.nameBn,const DeepCollectionEquality().hash(_this.districts));
}

@override
String toString() {
  final _this = this as GeoDivision;
  return 'GeoDivision(name: ${_this.name}, nameBn: ${_this.nameBn}, districts: ${_this.districts})';
}


}

/// @nodoc
abstract mixin class $GeoDivisionCopyWith<$Res>  {
  factory $GeoDivisionCopyWith(GeoDivision value, $Res Function(GeoDivision) _then) = _$GeoDivisionCopyWithImpl;
@useResult
$Res call({
 String name, String nameBn, List<GeoDistrict> districts
});




}
/// @nodoc
class _$GeoDivisionCopyWithImpl<$Res>
    implements $GeoDivisionCopyWith<$Res> {
  _$GeoDivisionCopyWithImpl(this._self, this._then);

  final GeoDivision _self;
  final $Res Function(GeoDivision) _then;

/// Create a copy of GeoDivision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? nameBn = null,Object? districts = null,}) {
  return _then(GeoDivision(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as List<GeoDistrict>,
  ));
}

}


/// Adds pattern-matching-related methods to [GeoDivision].
extension GeoDivisionPatterns on GeoDivision {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoDivision value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoDivision() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoDivision value)  $default,){
final _that = this;
switch (_that) {
case _GeoDivision():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoDivision value)?  $default,){
final _that = this;
switch (_that) {
case _GeoDivision() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String nameBn,  List<GeoDistrict> districts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoDivision() when $default != null:
return $default(_that.name,_that.nameBn,_that.districts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String nameBn,  List<GeoDistrict> districts)  $default,) {final _that = this;
switch (_that) {
case _GeoDivision():
return $default(_that.name,_that.nameBn,_that.districts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String nameBn,  List<GeoDistrict> districts)?  $default,) {final _that = this;
switch (_that) {
case _GeoDivision() when $default != null:
return $default(_that.name,_that.nameBn,_that.districts);case _:
  return null;

}
}

}

/// @nodoc


class _GeoDivision implements GeoDivision {
  const _GeoDivision({required this.name, required this.nameBn, required  List<GeoDistrict> districts}): _districts = districts;
  

@override final  String name;
@override final  String nameBn;
 final  List<GeoDistrict> _districts;
@override List<GeoDistrict> get districts {
  if (_districts is EqualUnmodifiableListView) return _districts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_districts);
}


/// Create a copy of GeoDivision
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoDivisionCopyWith<_GeoDivision> get copyWith => __$GeoDivisionCopyWithImpl<_GeoDivision>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoDivision&&(identical(other.name, name) || other.name == name)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&const DeepCollectionEquality().equals(other.districts, _districts));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,nameBn,const DeepCollectionEquality().hash(_districts));
}

@override
String toString() {
    return 'GeoDivision(name: $name, nameBn: $nameBn, districts: $districts)';
}


}

/// @nodoc
abstract mixin class _$GeoDivisionCopyWith<$Res> implements $GeoDivisionCopyWith<$Res> {
  factory _$GeoDivisionCopyWith(_GeoDivision value, $Res Function(_GeoDivision) _then) = __$GeoDivisionCopyWithImpl;
@override @useResult
$Res call({
 String name, String nameBn, List<GeoDistrict> districts
});




}
/// @nodoc
class __$GeoDivisionCopyWithImpl<$Res>
    implements _$GeoDivisionCopyWith<$Res> {
  __$GeoDivisionCopyWithImpl(this._self, this._then);

  final _GeoDivision _self;
  final $Res Function(_GeoDivision) _then;

/// Create a copy of GeoDivision
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? nameBn = null,Object? districts = null,}) {
  return _then(_GeoDivision(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self._districts : districts // ignore: cast_nullable_to_non_nullable
as List<GeoDistrict>,
  ));
}


}

/// @nodoc
mixin _$GeoDistrict {

 String get name; String get nameBn; List<String> get upazilas;
/// Create a copy of GeoDistrict
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoDistrictCopyWith<GeoDistrict> get copyWith => _$GeoDistrictCopyWithImpl<GeoDistrict>(this as GeoDistrict, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GeoDistrict;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoDistrict&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn)&&const DeepCollectionEquality().equals(other.upazilas, _this.upazilas));
}


@override
int get hashCode {
  final _this = this as GeoDistrict;
  return Object.hash(runtimeType,_this.name,_this.nameBn,const DeepCollectionEquality().hash(_this.upazilas));
}

@override
String toString() {
  final _this = this as GeoDistrict;
  return 'GeoDistrict(name: ${_this.name}, nameBn: ${_this.nameBn}, upazilas: ${_this.upazilas})';
}


}

/// @nodoc
abstract mixin class $GeoDistrictCopyWith<$Res>  {
  factory $GeoDistrictCopyWith(GeoDistrict value, $Res Function(GeoDistrict) _then) = _$GeoDistrictCopyWithImpl;
@useResult
$Res call({
 String name, String nameBn, List<String> upazilas
});




}
/// @nodoc
class _$GeoDistrictCopyWithImpl<$Res>
    implements $GeoDistrictCopyWith<$Res> {
  _$GeoDistrictCopyWithImpl(this._self, this._then);

  final GeoDistrict _self;
  final $Res Function(GeoDistrict) _then;

/// Create a copy of GeoDistrict
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? nameBn = null,Object? upazilas = null,}) {
  return _then(GeoDistrict(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,upazilas: null == upazilas ? _self.upazilas : upazilas // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [GeoDistrict].
extension GeoDistrictPatterns on GeoDistrict {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoDistrict value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoDistrict() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoDistrict value)  $default,){
final _that = this;
switch (_that) {
case _GeoDistrict():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoDistrict value)?  $default,){
final _that = this;
switch (_that) {
case _GeoDistrict() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String nameBn,  List<String> upazilas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoDistrict() when $default != null:
return $default(_that.name,_that.nameBn,_that.upazilas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String nameBn,  List<String> upazilas)  $default,) {final _that = this;
switch (_that) {
case _GeoDistrict():
return $default(_that.name,_that.nameBn,_that.upazilas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String nameBn,  List<String> upazilas)?  $default,) {final _that = this;
switch (_that) {
case _GeoDistrict() when $default != null:
return $default(_that.name,_that.nameBn,_that.upazilas);case _:
  return null;

}
}

}

/// @nodoc


class _GeoDistrict implements GeoDistrict {
  const _GeoDistrict({required this.name, required this.nameBn, required  List<String> upazilas}): _upazilas = upazilas;
  

@override final  String name;
@override final  String nameBn;
 final  List<String> _upazilas;
@override List<String> get upazilas {
  if (_upazilas is EqualUnmodifiableListView) return _upazilas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upazilas);
}


/// Create a copy of GeoDistrict
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoDistrictCopyWith<_GeoDistrict> get copyWith => __$GeoDistrictCopyWithImpl<_GeoDistrict>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoDistrict&&(identical(other.name, name) || other.name == name)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&const DeepCollectionEquality().equals(other.upazilas, _upazilas));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,nameBn,const DeepCollectionEquality().hash(_upazilas));
}

@override
String toString() {
    return 'GeoDistrict(name: $name, nameBn: $nameBn, upazilas: $upazilas)';
}


}

/// @nodoc
abstract mixin class _$GeoDistrictCopyWith<$Res> implements $GeoDistrictCopyWith<$Res> {
  factory _$GeoDistrictCopyWith(_GeoDistrict value, $Res Function(_GeoDistrict) _then) = __$GeoDistrictCopyWithImpl;
@override @useResult
$Res call({
 String name, String nameBn, List<String> upazilas
});




}
/// @nodoc
class __$GeoDistrictCopyWithImpl<$Res>
    implements _$GeoDistrictCopyWith<$Res> {
  __$GeoDistrictCopyWithImpl(this._self, this._then);

  final _GeoDistrict _self;
  final $Res Function(_GeoDistrict) _then;

/// Create a copy of GeoDistrict
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? nameBn = null,Object? upazilas = null,}) {
  return _then(_GeoDistrict(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,upazilas: null == upazilas ? _self._upazilas : upazilas // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
