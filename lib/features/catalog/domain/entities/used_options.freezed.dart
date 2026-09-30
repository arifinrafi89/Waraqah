// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'used_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsedCopy {

 String get id; int get priceBdt; BookCondition get condition; String? get sellerName; String? get area;
/// Create a copy of UsedCopy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsedCopyCopyWith<UsedCopy> get copyWith => _$UsedCopyCopyWithImpl<UsedCopy>(this as UsedCopy, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UsedCopy;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsedCopy&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.condition, _this.condition) || other.condition == _this.condition)&&(identical(other.sellerName, _this.sellerName) || other.sellerName == _this.sellerName)&&(identical(other.area, _this.area) || other.area == _this.area));
}


@override
int get hashCode {
  final _this = this as UsedCopy;
  return Object.hash(runtimeType,_this.id,_this.priceBdt,_this.condition,_this.sellerName,_this.area);
}

@override
String toString() {
  final _this = this as UsedCopy;
  return 'UsedCopy(id: ${_this.id}, priceBdt: ${_this.priceBdt}, condition: ${_this.condition}, sellerName: ${_this.sellerName}, area: ${_this.area})';
}


}

/// @nodoc
abstract mixin class $UsedCopyCopyWith<$Res>  {
  factory $UsedCopyCopyWith(UsedCopy value, $Res Function(UsedCopy) _then) = _$UsedCopyCopyWithImpl;
@useResult
$Res call({
 String id, int priceBdt, BookCondition condition, String? sellerName, String? area
});




}
/// @nodoc
class _$UsedCopyCopyWithImpl<$Res>
    implements $UsedCopyCopyWith<$Res> {
  _$UsedCopyCopyWithImpl(this._self, this._then);

  final UsedCopy _self;
  final $Res Function(UsedCopy) _then;

/// Create a copy of UsedCopy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? priceBdt = null,Object? condition = null,Object? sellerName = freezed,Object? area = freezed,}) {
  return _then(UsedCopy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,sellerName: freezed == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UsedCopy].
extension UsedCopyPatterns on UsedCopy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsedCopy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsedCopy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsedCopy value)  $default,){
final _that = this;
switch (_that) {
case _UsedCopy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsedCopy value)?  $default,){
final _that = this;
switch (_that) {
case _UsedCopy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int priceBdt,  BookCondition condition,  String? sellerName,  String? area)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsedCopy() when $default != null:
return $default(_that.id,_that.priceBdt,_that.condition,_that.sellerName,_that.area);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int priceBdt,  BookCondition condition,  String? sellerName,  String? area)  $default,) {final _that = this;
switch (_that) {
case _UsedCopy():
return $default(_that.id,_that.priceBdt,_that.condition,_that.sellerName,_that.area);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int priceBdt,  BookCondition condition,  String? sellerName,  String? area)?  $default,) {final _that = this;
switch (_that) {
case _UsedCopy() when $default != null:
return $default(_that.id,_that.priceBdt,_that.condition,_that.sellerName,_that.area);case _:
  return null;

}
}

}

/// @nodoc


class _UsedCopy implements UsedCopy {
  const _UsedCopy({required this.id, required this.priceBdt, required this.condition, this.sellerName, this.area});
  

@override final  String id;
@override final  int priceBdt;
@override final  BookCondition condition;
@override final  String? sellerName;
@override final  String? area;

/// Create a copy of UsedCopy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsedCopyCopyWith<_UsedCopy> get copyWith => __$UsedCopyCopyWithImpl<_UsedCopy>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsedCopy&&(identical(other.id, id) || other.id == id)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.area, area) || other.area == area));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,priceBdt,condition,sellerName,area);
}

@override
String toString() {
    return 'UsedCopy(id: $id, priceBdt: $priceBdt, condition: $condition, sellerName: $sellerName, area: $area)';
}


}

/// @nodoc
abstract mixin class _$UsedCopyCopyWith<$Res> implements $UsedCopyCopyWith<$Res> {
  factory _$UsedCopyCopyWith(_UsedCopy value, $Res Function(_UsedCopy) _then) = __$UsedCopyCopyWithImpl;
@override @useResult
$Res call({
 String id, int priceBdt, BookCondition condition, String? sellerName, String? area
});




}
/// @nodoc
class __$UsedCopyCopyWithImpl<$Res>
    implements _$UsedCopyCopyWith<$Res> {
  __$UsedCopyCopyWithImpl(this._self, this._then);

  final _UsedCopy _self;
  final $Res Function(_UsedCopy) _then;

/// Create a copy of UsedCopy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? priceBdt = null,Object? condition = null,Object? sellerName = freezed,Object? area = freezed,}) {
  return _then(_UsedCopy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,sellerName: freezed == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$UsedOptions {

 UsedCopy? get certifiedUsed; List<UsedCopy> get listings;/// What a used copy usually sells back for, if we know.
 int? get resaleValueBdt;
/// Create a copy of UsedOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsedOptionsCopyWith<UsedOptions> get copyWith => _$UsedOptionsCopyWithImpl<UsedOptions>(this as UsedOptions, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UsedOptions;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsedOptions&&(identical(other.certifiedUsed, _this.certifiedUsed) || other.certifiedUsed == _this.certifiedUsed)&&const DeepCollectionEquality().equals(other.listings, _this.listings)&&(identical(other.resaleValueBdt, _this.resaleValueBdt) || other.resaleValueBdt == _this.resaleValueBdt));
}


@override
int get hashCode {
  final _this = this as UsedOptions;
  return Object.hash(runtimeType,_this.certifiedUsed,const DeepCollectionEquality().hash(_this.listings),_this.resaleValueBdt);
}

@override
String toString() {
  final _this = this as UsedOptions;
  return 'UsedOptions(certifiedUsed: ${_this.certifiedUsed}, listings: ${_this.listings}, resaleValueBdt: ${_this.resaleValueBdt})';
}


}

/// @nodoc
abstract mixin class $UsedOptionsCopyWith<$Res>  {
  factory $UsedOptionsCopyWith(UsedOptions value, $Res Function(UsedOptions) _then) = _$UsedOptionsCopyWithImpl;
@useResult
$Res call({
 UsedCopy? certifiedUsed, List<UsedCopy> listings, int? resaleValueBdt
});


$UsedCopyCopyWith<$Res>? get certifiedUsed;

}
/// @nodoc
class _$UsedOptionsCopyWithImpl<$Res>
    implements $UsedOptionsCopyWith<$Res> {
  _$UsedOptionsCopyWithImpl(this._self, this._then);

  final UsedOptions _self;
  final $Res Function(UsedOptions) _then;

/// Create a copy of UsedOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? certifiedUsed = freezed,Object? listings = null,Object? resaleValueBdt = freezed,}) {
  return _then(UsedOptions(
certifiedUsed: freezed == certifiedUsed ? _self.certifiedUsed : certifiedUsed // ignore: cast_nullable_to_non_nullable
as UsedCopy?,listings: null == listings ? _self.listings : listings // ignore: cast_nullable_to_non_nullable
as List<UsedCopy>,resaleValueBdt: freezed == resaleValueBdt ? _self.resaleValueBdt : resaleValueBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of UsedOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsedCopyCopyWith<$Res>? get certifiedUsed {
    if (_self.certifiedUsed == null) {
    return null;
  }

  return $UsedCopyCopyWith<$Res>(_self.certifiedUsed!, (value) {
    return _then(_self.copyWith(certifiedUsed: value));
  });
}
}


/// Adds pattern-matching-related methods to [UsedOptions].
extension UsedOptionsPatterns on UsedOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsedOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsedOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsedOptions value)  $default,){
final _that = this;
switch (_that) {
case _UsedOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsedOptions value)?  $default,){
final _that = this;
switch (_that) {
case _UsedOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UsedCopy? certifiedUsed,  List<UsedCopy> listings,  int? resaleValueBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsedOptions() when $default != null:
return $default(_that.certifiedUsed,_that.listings,_that.resaleValueBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UsedCopy? certifiedUsed,  List<UsedCopy> listings,  int? resaleValueBdt)  $default,) {final _that = this;
switch (_that) {
case _UsedOptions():
return $default(_that.certifiedUsed,_that.listings,_that.resaleValueBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UsedCopy? certifiedUsed,  List<UsedCopy> listings,  int? resaleValueBdt)?  $default,) {final _that = this;
switch (_that) {
case _UsedOptions() when $default != null:
return $default(_that.certifiedUsed,_that.listings,_that.resaleValueBdt);case _:
  return null;

}
}

}

/// @nodoc


class _UsedOptions implements UsedOptions {
  const _UsedOptions({this.certifiedUsed,  List<UsedCopy> listings = const <UsedCopy>[], this.resaleValueBdt}): _listings = listings;
  

@override final  UsedCopy? certifiedUsed;
 final  List<UsedCopy> _listings;
@override@JsonKey() List<UsedCopy> get listings {
  if (_listings is EqualUnmodifiableListView) return _listings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listings);
}

/// What a used copy usually sells back for, if we know.
@override final  int? resaleValueBdt;

/// Create a copy of UsedOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsedOptionsCopyWith<_UsedOptions> get copyWith => __$UsedOptionsCopyWithImpl<_UsedOptions>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsedOptions&&(identical(other.certifiedUsed, certifiedUsed) || other.certifiedUsed == certifiedUsed)&&const DeepCollectionEquality().equals(other.listings, _listings)&&(identical(other.resaleValueBdt, resaleValueBdt) || other.resaleValueBdt == resaleValueBdt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,certifiedUsed,const DeepCollectionEquality().hash(_listings),resaleValueBdt);
}

@override
String toString() {
    return 'UsedOptions(certifiedUsed: $certifiedUsed, listings: $listings, resaleValueBdt: $resaleValueBdt)';
}


}

/// @nodoc
abstract mixin class _$UsedOptionsCopyWith<$Res> implements $UsedOptionsCopyWith<$Res> {
  factory _$UsedOptionsCopyWith(_UsedOptions value, $Res Function(_UsedOptions) _then) = __$UsedOptionsCopyWithImpl;
@override @useResult
$Res call({
 UsedCopy? certifiedUsed, List<UsedCopy> listings, int? resaleValueBdt
});


@override $UsedCopyCopyWith<$Res>? get certifiedUsed;

}
/// @nodoc
class __$UsedOptionsCopyWithImpl<$Res>
    implements _$UsedOptionsCopyWith<$Res> {
  __$UsedOptionsCopyWithImpl(this._self, this._then);

  final _UsedOptions _self;
  final $Res Function(_UsedOptions) _then;

/// Create a copy of UsedOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? certifiedUsed = freezed,Object? listings = null,Object? resaleValueBdt = freezed,}) {
  return _then(_UsedOptions(
certifiedUsed: freezed == certifiedUsed ? _self.certifiedUsed : certifiedUsed // ignore: cast_nullable_to_non_nullable
as UsedCopy?,listings: null == listings ? _self._listings : listings // ignore: cast_nullable_to_non_nullable
as List<UsedCopy>,resaleValueBdt: freezed == resaleValueBdt ? _self.resaleValueBdt : resaleValueBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of UsedOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsedCopyCopyWith<$Res>? get certifiedUsed {
    if (_self.certifiedUsed == null) {
    return null;
  }

  return $UsedCopyCopyWith<$Res>(_self.certifiedUsed!, (value) {
    return _then(_self.copyWith(certifiedUsed: value));
  });
}
}

// dart format on
