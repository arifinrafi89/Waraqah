// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeasonModel {

 Season get season; String get titleEn; String get titleBn; String get subtitleEn; String get subtitleBn; int get seed; String get collectionId;
/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonModelCopyWith<SeasonModel> get copyWith => _$SeasonModelCopyWithImpl<SeasonModel>(this as SeasonModel, _$identity);

  /// Serializes this SeasonModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SeasonModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeasonModel&&(identical(other.season, _this.season) || other.season == _this.season)&&(identical(other.titleEn, _this.titleEn) || other.titleEn == _this.titleEn)&&(identical(other.titleBn, _this.titleBn) || other.titleBn == _this.titleBn)&&(identical(other.subtitleEn, _this.subtitleEn) || other.subtitleEn == _this.subtitleEn)&&(identical(other.subtitleBn, _this.subtitleBn) || other.subtitleBn == _this.subtitleBn)&&(identical(other.seed, _this.seed) || other.seed == _this.seed)&&(identical(other.collectionId, _this.collectionId) || other.collectionId == _this.collectionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SeasonModel;
  return Object.hash(runtimeType,_this.season,_this.titleEn,_this.titleBn,_this.subtitleEn,_this.subtitleBn,_this.seed,_this.collectionId);
}

@override
String toString() {
  final _this = this as SeasonModel;
  return 'SeasonModel(season: ${_this.season}, titleEn: ${_this.titleEn}, titleBn: ${_this.titleBn}, subtitleEn: ${_this.subtitleEn}, subtitleBn: ${_this.subtitleBn}, seed: ${_this.seed}, collectionId: ${_this.collectionId})';
}


}

/// @nodoc
abstract mixin class $SeasonModelCopyWith<$Res>  {
  factory $SeasonModelCopyWith(SeasonModel value, $Res Function(SeasonModel) _then) = _$SeasonModelCopyWithImpl;
@useResult
$Res call({
 Season season, String titleEn, String titleBn, String subtitleEn, String subtitleBn, int seed, String collectionId
});




}
/// @nodoc
class _$SeasonModelCopyWithImpl<$Res>
    implements $SeasonModelCopyWith<$Res> {
  _$SeasonModelCopyWithImpl(this._self, this._then);

  final SeasonModel _self;
  final $Res Function(SeasonModel) _then;

/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? season = null,Object? titleEn = null,Object? titleBn = null,Object? subtitleEn = null,Object? subtitleBn = null,Object? seed = null,Object? collectionId = null,}) {
  return _then(SeasonModel(
season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,subtitleEn: null == subtitleEn ? _self.subtitleEn : subtitleEn // ignore: cast_nullable_to_non_nullable
as String,subtitleBn: null == subtitleBn ? _self.subtitleBn : subtitleBn // ignore: cast_nullable_to_non_nullable
as String,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int,collectionId: null == collectionId ? _self.collectionId : collectionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SeasonModel].
extension SeasonModelPatterns on SeasonModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeasonModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeasonModel value)  $default,){
final _that = this;
switch (_that) {
case _SeasonModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeasonModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Season season,  String titleEn,  String titleBn,  String subtitleEn,  String subtitleBn,  int seed,  String collectionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
return $default(_that.season,_that.titleEn,_that.titleBn,_that.subtitleEn,_that.subtitleBn,_that.seed,_that.collectionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Season season,  String titleEn,  String titleBn,  String subtitleEn,  String subtitleBn,  int seed,  String collectionId)  $default,) {final _that = this;
switch (_that) {
case _SeasonModel():
return $default(_that.season,_that.titleEn,_that.titleBn,_that.subtitleEn,_that.subtitleBn,_that.seed,_that.collectionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Season season,  String titleEn,  String titleBn,  String subtitleEn,  String subtitleBn,  int seed,  String collectionId)?  $default,) {final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
return $default(_that.season,_that.titleEn,_that.titleBn,_that.subtitleEn,_that.subtitleBn,_that.seed,_that.collectionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeasonModel implements SeasonModel {
  const _SeasonModel({required this.season, required this.titleEn, required this.titleBn, required this.subtitleEn, required this.subtitleBn, required this.seed, required this.collectionId});
  factory _SeasonModel.fromJson(Map<String, dynamic> json) => _$SeasonModelFromJson(json);

@override final  Season season;
@override final  String titleEn;
@override final  String titleBn;
@override final  String subtitleEn;
@override final  String subtitleBn;
@override final  int seed;
@override final  String collectionId;

/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonModelCopyWith<_SeasonModel> get copyWith => __$SeasonModelCopyWithImpl<_SeasonModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeasonModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeasonModel&&(identical(other.season, season) || other.season == season)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleBn, titleBn) || other.titleBn == titleBn)&&(identical(other.subtitleEn, subtitleEn) || other.subtitleEn == subtitleEn)&&(identical(other.subtitleBn, subtitleBn) || other.subtitleBn == subtitleBn)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.collectionId, collectionId) || other.collectionId == collectionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,season,titleEn,titleBn,subtitleEn,subtitleBn,seed,collectionId);
}

@override
String toString() {
    return 'SeasonModel(season: $season, titleEn: $titleEn, titleBn: $titleBn, subtitleEn: $subtitleEn, subtitleBn: $subtitleBn, seed: $seed, collectionId: $collectionId)';
}


}

/// @nodoc
abstract mixin class _$SeasonModelCopyWith<$Res> implements $SeasonModelCopyWith<$Res> {
  factory _$SeasonModelCopyWith(_SeasonModel value, $Res Function(_SeasonModel) _then) = __$SeasonModelCopyWithImpl;
@override @useResult
$Res call({
 Season season, String titleEn, String titleBn, String subtitleEn, String subtitleBn, int seed, String collectionId
});




}
/// @nodoc
class __$SeasonModelCopyWithImpl<$Res>
    implements _$SeasonModelCopyWith<$Res> {
  __$SeasonModelCopyWithImpl(this._self, this._then);

  final _SeasonModel _self;
  final $Res Function(_SeasonModel) _then;

/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? season = null,Object? titleEn = null,Object? titleBn = null,Object? subtitleEn = null,Object? subtitleBn = null,Object? seed = null,Object? collectionId = null,}) {
  return _then(_SeasonModel(
season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleBn: null == titleBn ? _self.titleBn : titleBn // ignore: cast_nullable_to_non_nullable
as String,subtitleEn: null == subtitleEn ? _self.subtitleEn : subtitleEn // ignore: cast_nullable_to_non_nullable
as String,subtitleBn: null == subtitleBn ? _self.subtitleBn : subtitleBn // ignore: cast_nullable_to_non_nullable
as String,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int,collectionId: null == collectionId ? _self.collectionId : collectionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
