// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'used_options_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsedCopyModel {

 String get id; int get priceBdt; BookCondition get condition;
/// Create a copy of UsedCopyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsedCopyModelCopyWith<UsedCopyModel> get copyWith => _$UsedCopyModelCopyWithImpl<UsedCopyModel>(this as UsedCopyModel, _$identity);

  /// Serializes this UsedCopyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UsedCopyModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsedCopyModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.condition, _this.condition) || other.condition == _this.condition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UsedCopyModel;
  return Object.hash(runtimeType,_this.id,_this.priceBdt,_this.condition);
}

@override
String toString() {
  final _this = this as UsedCopyModel;
  return 'UsedCopyModel(id: ${_this.id}, priceBdt: ${_this.priceBdt}, condition: ${_this.condition})';
}


}

/// @nodoc
abstract mixin class $UsedCopyModelCopyWith<$Res>  {
  factory $UsedCopyModelCopyWith(UsedCopyModel value, $Res Function(UsedCopyModel) _then) = _$UsedCopyModelCopyWithImpl;
@useResult
$Res call({
 String id, int priceBdt, BookCondition condition
});




}
/// @nodoc
class _$UsedCopyModelCopyWithImpl<$Res>
    implements $UsedCopyModelCopyWith<$Res> {
  _$UsedCopyModelCopyWithImpl(this._self, this._then);

  final UsedCopyModel _self;
  final $Res Function(UsedCopyModel) _then;

/// Create a copy of UsedCopyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? priceBdt = null,Object? condition = null,}) {
  return _then(UsedCopyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,
  ));
}

}


/// Adds pattern-matching-related methods to [UsedCopyModel].
extension UsedCopyModelPatterns on UsedCopyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsedCopyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsedCopyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsedCopyModel value)  $default,){
final _that = this;
switch (_that) {
case _UsedCopyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsedCopyModel value)?  $default,){
final _that = this;
switch (_that) {
case _UsedCopyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int priceBdt,  BookCondition condition)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsedCopyModel() when $default != null:
return $default(_that.id,_that.priceBdt,_that.condition);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int priceBdt,  BookCondition condition)  $default,) {final _that = this;
switch (_that) {
case _UsedCopyModel():
return $default(_that.id,_that.priceBdt,_that.condition);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int priceBdt,  BookCondition condition)?  $default,) {final _that = this;
switch (_that) {
case _UsedCopyModel() when $default != null:
return $default(_that.id,_that.priceBdt,_that.condition);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsedCopyModel implements UsedCopyModel {
  const _UsedCopyModel({required this.id, required this.priceBdt, required this.condition});
  factory _UsedCopyModel.fromJson(Map<String, dynamic> json) => _$UsedCopyModelFromJson(json);

@override final  String id;
@override final  int priceBdt;
@override final  BookCondition condition;

/// Create a copy of UsedCopyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsedCopyModelCopyWith<_UsedCopyModel> get copyWith => __$UsedCopyModelCopyWithImpl<_UsedCopyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsedCopyModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsedCopyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.condition, condition) || other.condition == condition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,priceBdt,condition);
}

@override
String toString() {
    return 'UsedCopyModel(id: $id, priceBdt: $priceBdt, condition: $condition)';
}


}

/// @nodoc
abstract mixin class _$UsedCopyModelCopyWith<$Res> implements $UsedCopyModelCopyWith<$Res> {
  factory _$UsedCopyModelCopyWith(_UsedCopyModel value, $Res Function(_UsedCopyModel) _then) = __$UsedCopyModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int priceBdt, BookCondition condition
});




}
/// @nodoc
class __$UsedCopyModelCopyWithImpl<$Res>
    implements _$UsedCopyModelCopyWith<$Res> {
  __$UsedCopyModelCopyWithImpl(this._self, this._then);

  final _UsedCopyModel _self;
  final $Res Function(_UsedCopyModel) _then;

/// Create a copy of UsedCopyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? priceBdt = null,Object? condition = null,}) {
  return _then(_UsedCopyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,
  ));
}


}


/// @nodoc
mixin _$UsedOptionsModel {

 UsedCopyModel? get certifiedUsed; int? get resaleValueBdt;
/// Create a copy of UsedOptionsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsedOptionsModelCopyWith<UsedOptionsModel> get copyWith => _$UsedOptionsModelCopyWithImpl<UsedOptionsModel>(this as UsedOptionsModel, _$identity);

  /// Serializes this UsedOptionsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UsedOptionsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsedOptionsModel&&(identical(other.certifiedUsed, _this.certifiedUsed) || other.certifiedUsed == _this.certifiedUsed)&&(identical(other.resaleValueBdt, _this.resaleValueBdt) || other.resaleValueBdt == _this.resaleValueBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UsedOptionsModel;
  return Object.hash(runtimeType,_this.certifiedUsed,_this.resaleValueBdt);
}

@override
String toString() {
  final _this = this as UsedOptionsModel;
  return 'UsedOptionsModel(certifiedUsed: ${_this.certifiedUsed}, resaleValueBdt: ${_this.resaleValueBdt})';
}


}

/// @nodoc
abstract mixin class $UsedOptionsModelCopyWith<$Res>  {
  factory $UsedOptionsModelCopyWith(UsedOptionsModel value, $Res Function(UsedOptionsModel) _then) = _$UsedOptionsModelCopyWithImpl;
@useResult
$Res call({
 UsedCopyModel? certifiedUsed, int? resaleValueBdt
});


$UsedCopyModelCopyWith<$Res>? get certifiedUsed;

}
/// @nodoc
class _$UsedOptionsModelCopyWithImpl<$Res>
    implements $UsedOptionsModelCopyWith<$Res> {
  _$UsedOptionsModelCopyWithImpl(this._self, this._then);

  final UsedOptionsModel _self;
  final $Res Function(UsedOptionsModel) _then;

/// Create a copy of UsedOptionsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? certifiedUsed = freezed,Object? resaleValueBdt = freezed,}) {
  return _then(UsedOptionsModel(
certifiedUsed: freezed == certifiedUsed ? _self.certifiedUsed : certifiedUsed // ignore: cast_nullable_to_non_nullable
as UsedCopyModel?,resaleValueBdt: freezed == resaleValueBdt ? _self.resaleValueBdt : resaleValueBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of UsedOptionsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsedCopyModelCopyWith<$Res>? get certifiedUsed {
    if (_self.certifiedUsed == null) {
    return null;
  }

  return $UsedCopyModelCopyWith<$Res>(_self.certifiedUsed!, (value) {
    return _then(_self.copyWith(certifiedUsed: value));
  });
}
}


/// Adds pattern-matching-related methods to [UsedOptionsModel].
extension UsedOptionsModelPatterns on UsedOptionsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsedOptionsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsedOptionsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsedOptionsModel value)  $default,){
final _that = this;
switch (_that) {
case _UsedOptionsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsedOptionsModel value)?  $default,){
final _that = this;
switch (_that) {
case _UsedOptionsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UsedCopyModel? certifiedUsed,  int? resaleValueBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsedOptionsModel() when $default != null:
return $default(_that.certifiedUsed,_that.resaleValueBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UsedCopyModel? certifiedUsed,  int? resaleValueBdt)  $default,) {final _that = this;
switch (_that) {
case _UsedOptionsModel():
return $default(_that.certifiedUsed,_that.resaleValueBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UsedCopyModel? certifiedUsed,  int? resaleValueBdt)?  $default,) {final _that = this;
switch (_that) {
case _UsedOptionsModel() when $default != null:
return $default(_that.certifiedUsed,_that.resaleValueBdt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _UsedOptionsModel implements UsedOptionsModel {
  const _UsedOptionsModel({this.certifiedUsed, this.resaleValueBdt});
  factory _UsedOptionsModel.fromJson(Map<String, dynamic> json) => _$UsedOptionsModelFromJson(json);

@override final  UsedCopyModel? certifiedUsed;
@override final  int? resaleValueBdt;

/// Create a copy of UsedOptionsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsedOptionsModelCopyWith<_UsedOptionsModel> get copyWith => __$UsedOptionsModelCopyWithImpl<_UsedOptionsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsedOptionsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsedOptionsModel&&(identical(other.certifiedUsed, certifiedUsed) || other.certifiedUsed == certifiedUsed)&&(identical(other.resaleValueBdt, resaleValueBdt) || other.resaleValueBdt == resaleValueBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,certifiedUsed,resaleValueBdt);
}

@override
String toString() {
    return 'UsedOptionsModel(certifiedUsed: $certifiedUsed, resaleValueBdt: $resaleValueBdt)';
}


}

/// @nodoc
abstract mixin class _$UsedOptionsModelCopyWith<$Res> implements $UsedOptionsModelCopyWith<$Res> {
  factory _$UsedOptionsModelCopyWith(_UsedOptionsModel value, $Res Function(_UsedOptionsModel) _then) = __$UsedOptionsModelCopyWithImpl;
@override @useResult
$Res call({
 UsedCopyModel? certifiedUsed, int? resaleValueBdt
});


@override $UsedCopyModelCopyWith<$Res>? get certifiedUsed;

}
/// @nodoc
class __$UsedOptionsModelCopyWithImpl<$Res>
    implements _$UsedOptionsModelCopyWith<$Res> {
  __$UsedOptionsModelCopyWithImpl(this._self, this._then);

  final _UsedOptionsModel _self;
  final $Res Function(_UsedOptionsModel) _then;

/// Create a copy of UsedOptionsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? certifiedUsed = freezed,Object? resaleValueBdt = freezed,}) {
  return _then(_UsedOptionsModel(
certifiedUsed: freezed == certifiedUsed ? _self.certifiedUsed : certifiedUsed // ignore: cast_nullable_to_non_nullable
as UsedCopyModel?,resaleValueBdt: freezed == resaleValueBdt ? _self.resaleValueBdt : resaleValueBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of UsedOptionsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsedCopyModelCopyWith<$Res>? get certifiedUsed {
    if (_self.certifiedUsed == null) {
    return null;
  }

  return $UsedCopyModelCopyWith<$Res>(_self.certifiedUsed!, (value) {
    return _then(_self.copyWith(certifiedUsed: value));
  });
}
}

// dart format on
