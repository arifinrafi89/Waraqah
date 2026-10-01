// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerModel {

 String get id; String get titleEn; String get titleBn; String get subtitleEn; String get subtitleBn; int get seed; BannerTargetModel get target;
/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerModelCopyWith<BannerModel> get copyWith => _$BannerModelCopyWithImpl<BannerModel>(this as BannerModel, _$identity);

  /// Serializes this BannerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BannerModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.titleEn, _this.titleEn) || other.titleEn == _this.titleEn)&&(identical(other.titleBn, _this.titleBn) || other.titleBn == _this.titleBn)&&(identical(other.subtitleEn, _this.subtitleEn) || other.subtitleEn == _this.subtitleEn)&&(identical(other.subtitleBn, _this.subtitleBn) || other.subtitleBn == _this.subtitleBn)&&(identical(other.seed, _this.seed) || other.seed == _this.seed)&&(identical(other.target, _this.target) || other.target == _this.target));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BannerModel;
  return Object.hash(runtimeType,_this.id,_this.titleEn,_this.titleBn,_this.subtitleEn,_this.subtitleBn,_this.seed,_this.target);
}

@override
String toString() {
  final _this = this as BannerModel;
  return 'BannerModel(id: ${_this.id}, titleEn: ${_this.titleEn}, titleBn: ${_this.titleBn}, subtitleEn: ${_this.subtitleEn}, subtitleBn: ${_this.subtitleBn}, seed: ${_this.seed}, target: ${_this.target})';
}


}

/// @nodoc
abstract mixin class $BannerModelCopyWith<$Res>  {
  factory $BannerModelCopyWith(BannerModel value, $Res Function(BannerModel) _then) = _$BannerModelCopyWithImpl;
@useResult
$Res call({
 String id, String titleEn, String titleBn, String subtitleEn, String subtitleBn, int seed, BannerTargetModel target
});


$BannerTargetModelCopyWith<$Res> get target;

}
/// @nodoc
class _$BannerModelCopyWithImpl<$Res>
    implements $BannerModelCopyWith<$Res> {
  _$BannerModelCopyWithImpl(this._self, this._then);

  final BannerModel _self;
  final $Res Function(BannerModel) _then;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titleEn = null,Object? titleBn = null,Object? subtitleEn = null,Object? subtitleBn = null,Object? seed = null,Object? target = null,}) {
  return _then(BannerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,subtitleEn: null == subtitleEn ? _self.subtitleEn : subtitleEn // ignore: cast_nullable_to_non_nullable
as String,subtitleBn: null == subtitleBn ? _self.subtitleBn : subtitleBn // ignore: cast_nullable_to_non_nullable
as String,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as BannerTargetModel,
  ));
}
/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTargetModelCopyWith<$Res> get target {
  
  return $BannerTargetModelCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [BannerModel].
extension BannerModelPatterns on BannerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String titleEn,  String titleBn,  String subtitleEn,  String subtitleBn,  int seed,  BannerTargetModel target)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleBn,_that.subtitleEn,_that.subtitleBn,_that.seed,_that.target);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String titleEn,  String titleBn,  String subtitleEn,  String subtitleBn,  int seed,  BannerTargetModel target)  $default,) {final _that = this;
switch (_that) {
case _BannerModel():
return $default(_that.id,_that.titleEn,_that.titleBn,_that.subtitleEn,_that.subtitleBn,_that.seed,_that.target);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String titleEn,  String titleBn,  String subtitleEn,  String subtitleBn,  int seed,  BannerTargetModel target)?  $default,) {final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleBn,_that.subtitleEn,_that.subtitleBn,_that.seed,_that.target);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BannerModel implements BannerModel {
  const _BannerModel({required this.id, required this.titleEn, required this.titleBn, required this.subtitleEn, required this.subtitleBn, required this.seed, required this.target});
  factory _BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

@override final  String id;
@override final  String titleEn;
@override final  String titleBn;
@override final  String subtitleEn;
@override final  String subtitleBn;
@override final  int seed;
@override final  BannerTargetModel target;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerModelCopyWith<_BannerModel> get copyWith => __$BannerModelCopyWithImpl<_BannerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleBn, titleBn) || other.titleBn == titleBn)&&(identical(other.subtitleEn, subtitleEn) || other.subtitleEn == subtitleEn)&&(identical(other.subtitleBn, subtitleBn) || other.subtitleBn == subtitleBn)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.target, target) || other.target == target));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,titleEn,titleBn,subtitleEn,subtitleBn,seed,target);
}

@override
String toString() {
    return 'BannerModel(id: $id, titleEn: $titleEn, titleBn: $titleBn, subtitleEn: $subtitleEn, subtitleBn: $subtitleBn, seed: $seed, target: $target)';
}


}

/// @nodoc
abstract mixin class _$BannerModelCopyWith<$Res> implements $BannerModelCopyWith<$Res> {
  factory _$BannerModelCopyWith(_BannerModel value, $Res Function(_BannerModel) _then) = __$BannerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String titleEn, String titleBn, String subtitleEn, String subtitleBn, int seed, BannerTargetModel target
});


@override $BannerTargetModelCopyWith<$Res> get target;

}
/// @nodoc
class __$BannerModelCopyWithImpl<$Res>
    implements _$BannerModelCopyWith<$Res> {
  __$BannerModelCopyWithImpl(this._self, this._then);

  final _BannerModel _self;
  final $Res Function(_BannerModel) _then;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titleEn = null,Object? titleBn = null,Object? subtitleEn = null,Object? subtitleBn = null,Object? seed = null,Object? target = null,}) {
  return _then(_BannerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,subtitleEn: null == subtitleEn ? _self.subtitleEn : subtitleEn // ignore: cast_nullable_to_non_nullable
as String,subtitleBn: null == subtitleBn ? _self.subtitleBn : subtitleBn // ignore: cast_nullable_to_non_nullable
as String,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as BannerTargetModel,
  ));
}

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTargetModelCopyWith<$Res> get target {
  
  return $BannerTargetModelCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// @nodoc
mixin _$BannerTargetModel {

 BannerTargetKind get kind; String get value;
/// Create a copy of BannerTargetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerTargetModelCopyWith<BannerTargetModel> get copyWith => _$BannerTargetModelCopyWithImpl<BannerTargetModel>(this as BannerTargetModel, _$identity);

  /// Serializes this BannerTargetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BannerTargetModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerTargetModel&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.value, _this.value) || other.value == _this.value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BannerTargetModel;
  return Object.hash(runtimeType,_this.kind,_this.value);
}

@override
String toString() {
  final _this = this as BannerTargetModel;
  return 'BannerTargetModel(kind: ${_this.kind}, value: ${_this.value})';
}


}

/// @nodoc
abstract mixin class $BannerTargetModelCopyWith<$Res>  {
  factory $BannerTargetModelCopyWith(BannerTargetModel value, $Res Function(BannerTargetModel) _then) = _$BannerTargetModelCopyWithImpl;
@useResult
$Res call({
 BannerTargetKind kind, String value
});




}
/// @nodoc
class _$BannerTargetModelCopyWithImpl<$Res>
    implements $BannerTargetModelCopyWith<$Res> {
  _$BannerTargetModelCopyWithImpl(this._self, this._then);

  final BannerTargetModel _self;
  final $Res Function(BannerTargetModel) _then;

/// Create a copy of BannerTargetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? value = null,}) {
  return _then(BannerTargetModel(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as BannerTargetKind,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerTargetModel].
extension BannerTargetModelPatterns on BannerTargetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerTargetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerTargetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerTargetModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerTargetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerTargetModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerTargetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BannerTargetKind kind,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerTargetModel() when $default != null:
return $default(_that.kind,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BannerTargetKind kind,  String value)  $default,) {final _that = this;
switch (_that) {
case _BannerTargetModel():
return $default(_that.kind,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BannerTargetKind kind,  String value)?  $default,) {final _that = this;
switch (_that) {
case _BannerTargetModel() when $default != null:
return $default(_that.kind,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerTargetModel implements BannerTargetModel {
  const _BannerTargetModel({required this.kind, required this.value});
  factory _BannerTargetModel.fromJson(Map<String, dynamic> json) => _$BannerTargetModelFromJson(json);

@override final  BannerTargetKind kind;
@override final  String value;

/// Create a copy of BannerTargetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerTargetModelCopyWith<_BannerTargetModel> get copyWith => __$BannerTargetModelCopyWithImpl<_BannerTargetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerTargetModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerTargetModel&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,value);
}

@override
String toString() {
    return 'BannerTargetModel(kind: $kind, value: $value)';
}


}

/// @nodoc
abstract mixin class _$BannerTargetModelCopyWith<$Res> implements $BannerTargetModelCopyWith<$Res> {
  factory _$BannerTargetModelCopyWith(_BannerTargetModel value, $Res Function(_BannerTargetModel) _then) = __$BannerTargetModelCopyWithImpl;
@override @useResult
$Res call({
 BannerTargetKind kind, String value
});




}
/// @nodoc
class __$BannerTargetModelCopyWithImpl<$Res>
    implements _$BannerTargetModelCopyWith<$Res> {
  __$BannerTargetModelCopyWithImpl(this._self, this._then);

  final _BannerTargetModel _self;
  final $Res Function(_BannerTargetModel) _then;

/// Create a copy of BannerTargetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? value = null,}) {
  return _then(_BannerTargetModel(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as BannerTargetKind,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
