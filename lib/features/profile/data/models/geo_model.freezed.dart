// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeoDivisionModel {

 String get name; String get nameBn; List<GeoDistrictModel> get districts;
/// Create a copy of GeoDivisionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoDivisionModelCopyWith<GeoDivisionModel> get copyWith => _$GeoDivisionModelCopyWithImpl<GeoDivisionModel>(this as GeoDivisionModel, _$identity);

  /// Serializes this GeoDivisionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GeoDivisionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoDivisionModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn)&&const DeepCollectionEquality().equals(other.districts, _this.districts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GeoDivisionModel;
  return Object.hash(runtimeType,_this.name,_this.nameBn,const DeepCollectionEquality().hash(_this.districts));
}

@override
String toString() {
  final _this = this as GeoDivisionModel;
  return 'GeoDivisionModel(name: ${_this.name}, nameBn: ${_this.nameBn}, districts: ${_this.districts})';
}


}

/// @nodoc
abstract mixin class $GeoDivisionModelCopyWith<$Res>  {
  factory $GeoDivisionModelCopyWith(GeoDivisionModel value, $Res Function(GeoDivisionModel) _then) = _$GeoDivisionModelCopyWithImpl;
@useResult
$Res call({
 String name, String nameBn, List<GeoDistrictModel> districts
});




}
/// @nodoc
class _$GeoDivisionModelCopyWithImpl<$Res>
    implements $GeoDivisionModelCopyWith<$Res> {
  _$GeoDivisionModelCopyWithImpl(this._self, this._then);

  final GeoDivisionModel _self;
  final $Res Function(GeoDivisionModel) _then;

/// Create a copy of GeoDivisionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? nameBn = null,Object? districts = null,}) {
  return _then(GeoDivisionModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as List<GeoDistrictModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [GeoDivisionModel].
extension GeoDivisionModelPatterns on GeoDivisionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoDivisionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoDivisionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoDivisionModel value)  $default,){
final _that = this;
switch (_that) {
case _GeoDivisionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoDivisionModel value)?  $default,){
final _that = this;
switch (_that) {
case _GeoDivisionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String nameBn,  List<GeoDistrictModel> districts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoDivisionModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String nameBn,  List<GeoDistrictModel> districts)  $default,) {final _that = this;
switch (_that) {
case _GeoDivisionModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String nameBn,  List<GeoDistrictModel> districts)?  $default,) {final _that = this;
switch (_that) {
case _GeoDivisionModel() when $default != null:
return $default(_that.name,_that.nameBn,_that.districts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeoDivisionModel implements GeoDivisionModel {
  const _GeoDivisionModel({required this.name, required this.nameBn, required  List<GeoDistrictModel> districts}): _districts = districts;
  factory _GeoDivisionModel.fromJson(Map<String, dynamic> json) => _$GeoDivisionModelFromJson(json);

@override final  String name;
@override final  String nameBn;
 final  List<GeoDistrictModel> _districts;
@override List<GeoDistrictModel> get districts {
  if (_districts is EqualUnmodifiableListView) return _districts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_districts);
}


/// Create a copy of GeoDivisionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoDivisionModelCopyWith<_GeoDivisionModel> get copyWith => __$GeoDivisionModelCopyWithImpl<_GeoDivisionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeoDivisionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoDivisionModel&&(identical(other.name, name) || other.name == name)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&const DeepCollectionEquality().equals(other.districts, _districts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,nameBn,const DeepCollectionEquality().hash(_districts));
}

@override
String toString() {
    return 'GeoDivisionModel(name: $name, nameBn: $nameBn, districts: $districts)';
}


}

/// @nodoc
abstract mixin class _$GeoDivisionModelCopyWith<$Res> implements $GeoDivisionModelCopyWith<$Res> {
  factory _$GeoDivisionModelCopyWith(_GeoDivisionModel value, $Res Function(_GeoDivisionModel) _then) = __$GeoDivisionModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String nameBn, List<GeoDistrictModel> districts
});




}
/// @nodoc
class __$GeoDivisionModelCopyWithImpl<$Res>
    implements _$GeoDivisionModelCopyWith<$Res> {
  __$GeoDivisionModelCopyWithImpl(this._self, this._then);

  final _GeoDivisionModel _self;
  final $Res Function(_GeoDivisionModel) _then;

/// Create a copy of GeoDivisionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? nameBn = null,Object? districts = null,}) {
  return _then(_GeoDivisionModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self._districts : districts // ignore: cast_nullable_to_non_nullable
as List<GeoDistrictModel>,
  ));
}


}


/// @nodoc
mixin _$GeoDistrictModel {

 String get name; String get nameBn; List<String> get upazilas;
/// Create a copy of GeoDistrictModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoDistrictModelCopyWith<GeoDistrictModel> get copyWith => _$GeoDistrictModelCopyWithImpl<GeoDistrictModel>(this as GeoDistrictModel, _$identity);

  /// Serializes this GeoDistrictModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GeoDistrictModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoDistrictModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn)&&const DeepCollectionEquality().equals(other.upazilas, _this.upazilas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GeoDistrictModel;
  return Object.hash(runtimeType,_this.name,_this.nameBn,const DeepCollectionEquality().hash(_this.upazilas));
}

@override
String toString() {
  final _this = this as GeoDistrictModel;
  return 'GeoDistrictModel(name: ${_this.name}, nameBn: ${_this.nameBn}, upazilas: ${_this.upazilas})';
}


}

/// @nodoc
abstract mixin class $GeoDistrictModelCopyWith<$Res>  {
  factory $GeoDistrictModelCopyWith(GeoDistrictModel value, $Res Function(GeoDistrictModel) _then) = _$GeoDistrictModelCopyWithImpl;
@useResult
$Res call({
 String name, String nameBn, List<String> upazilas
});




}
/// @nodoc
class _$GeoDistrictModelCopyWithImpl<$Res>
    implements $GeoDistrictModelCopyWith<$Res> {
  _$GeoDistrictModelCopyWithImpl(this._self, this._then);

  final GeoDistrictModel _self;
  final $Res Function(GeoDistrictModel) _then;

/// Create a copy of GeoDistrictModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? nameBn = null,Object? upazilas = null,}) {
  return _then(GeoDistrictModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,upazilas: null == upazilas ? _self.upazilas : upazilas // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [GeoDistrictModel].
extension GeoDistrictModelPatterns on GeoDistrictModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoDistrictModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoDistrictModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoDistrictModel value)  $default,){
final _that = this;
switch (_that) {
case _GeoDistrictModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoDistrictModel value)?  $default,){
final _that = this;
switch (_that) {
case _GeoDistrictModel() when $default != null:
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
case _GeoDistrictModel() when $default != null:
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
case _GeoDistrictModel():
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
case _GeoDistrictModel() when $default != null:
return $default(_that.name,_that.nameBn,_that.upazilas);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeoDistrictModel implements GeoDistrictModel {
  const _GeoDistrictModel({required this.name, required this.nameBn, required  List<String> upazilas}): _upazilas = upazilas;
  factory _GeoDistrictModel.fromJson(Map<String, dynamic> json) => _$GeoDistrictModelFromJson(json);

@override final  String name;
@override final  String nameBn;
 final  List<String> _upazilas;
@override List<String> get upazilas {
  if (_upazilas is EqualUnmodifiableListView) return _upazilas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upazilas);
}


/// Create a copy of GeoDistrictModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoDistrictModelCopyWith<_GeoDistrictModel> get copyWith => __$GeoDistrictModelCopyWithImpl<_GeoDistrictModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeoDistrictModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoDistrictModel&&(identical(other.name, name) || other.name == name)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&const DeepCollectionEquality().equals(other.upazilas, _upazilas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,nameBn,const DeepCollectionEquality().hash(_upazilas));
}

@override
String toString() {
    return 'GeoDistrictModel(name: $name, nameBn: $nameBn, upazilas: $upazilas)';
}


}

/// @nodoc
abstract mixin class _$GeoDistrictModelCopyWith<$Res> implements $GeoDistrictModelCopyWith<$Res> {
  factory _$GeoDistrictModelCopyWith(_GeoDistrictModel value, $Res Function(_GeoDistrictModel) _then) = __$GeoDistrictModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String nameBn, List<String> upazilas
});




}
/// @nodoc
class __$GeoDistrictModelCopyWithImpl<$Res>
    implements _$GeoDistrictModelCopyWith<$Res> {
  __$GeoDistrictModelCopyWithImpl(this._self, this._then);

  final _GeoDistrictModel _self;
  final $Res Function(_GeoDistrictModel) _then;

/// Create a copy of GeoDistrictModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? nameBn = null,Object? upazilas = null,}) {
  return _then(_GeoDistrictModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,upazilas: null == upazilas ? _self._upazilas : upazilas // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
