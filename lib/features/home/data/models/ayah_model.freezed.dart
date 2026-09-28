// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ayah_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AyahModel {

 String get arabic; String get translation; String get surahEn; String get surahBn; int get surahNumber; int get verseNumber;
/// Create a copy of AyahModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AyahModelCopyWith<AyahModel> get copyWith => _$AyahModelCopyWithImpl<AyahModel>(this as AyahModel, _$identity);

  /// Serializes this AyahModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AyahModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AyahModel&&(identical(other.arabic, _this.arabic) || other.arabic == _this.arabic)&&(identical(other.translation, _this.translation) || other.translation == _this.translation)&&(identical(other.surahEn, _this.surahEn) || other.surahEn == _this.surahEn)&&(identical(other.surahBn, _this.surahBn) || other.surahBn == _this.surahBn)&&(identical(other.surahNumber, _this.surahNumber) || other.surahNumber == _this.surahNumber)&&(identical(other.verseNumber, _this.verseNumber) || other.verseNumber == _this.verseNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AyahModel;
  return Object.hash(runtimeType,_this.arabic,_this.translation,_this.surahEn,_this.surahBn,_this.surahNumber,_this.verseNumber);
}

@override
String toString() {
  final _this = this as AyahModel;
  return 'AyahModel(arabic: ${_this.arabic}, translation: ${_this.translation}, surahEn: ${_this.surahEn}, surahBn: ${_this.surahBn}, surahNumber: ${_this.surahNumber}, verseNumber: ${_this.verseNumber})';
}


}

/// @nodoc
abstract mixin class $AyahModelCopyWith<$Res>  {
  factory $AyahModelCopyWith(AyahModel value, $Res Function(AyahModel) _then) = _$AyahModelCopyWithImpl;
@useResult
$Res call({
 String arabic, String translation, String surahEn, String surahBn, int surahNumber, int verseNumber
});




}
/// @nodoc
class _$AyahModelCopyWithImpl<$Res>
    implements $AyahModelCopyWith<$Res> {
  _$AyahModelCopyWithImpl(this._self, this._then);

  final AyahModel _self;
  final $Res Function(AyahModel) _then;

/// Create a copy of AyahModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? arabic = null,Object? translation = null,Object? surahEn = null,Object? surahBn = null,Object? surahNumber = null,Object? verseNumber = null,}) {
  return _then(AyahModel(
arabic: null == arabic ? _self.arabic : arabic // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as String,surahEn: null == surahEn ? _self.surahEn : surahEn // ignore: cast_nullable_to_non_nullable
as String,surahBn: null == surahBn ? _self.surahBn : surahBn // ignore: cast_nullable_to_non_nullable
as String,surahNumber: null == surahNumber ? _self.surahNumber : surahNumber // ignore: cast_nullable_to_non_nullable
as int,verseNumber: null == verseNumber ? _self.verseNumber : verseNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AyahModel].
extension AyahModelPatterns on AyahModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AyahModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AyahModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AyahModel value)  $default,){
final _that = this;
switch (_that) {
case _AyahModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AyahModel value)?  $default,){
final _that = this;
switch (_that) {
case _AyahModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String arabic,  String translation,  String surahEn,  String surahBn,  int surahNumber,  int verseNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AyahModel() when $default != null:
return $default(_that.arabic,_that.translation,_that.surahEn,_that.surahBn,_that.surahNumber,_that.verseNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String arabic,  String translation,  String surahEn,  String surahBn,  int surahNumber,  int verseNumber)  $default,) {final _that = this;
switch (_that) {
case _AyahModel():
return $default(_that.arabic,_that.translation,_that.surahEn,_that.surahBn,_that.surahNumber,_that.verseNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String arabic,  String translation,  String surahEn,  String surahBn,  int surahNumber,  int verseNumber)?  $default,) {final _that = this;
switch (_that) {
case _AyahModel() when $default != null:
return $default(_that.arabic,_that.translation,_that.surahEn,_that.surahBn,_that.surahNumber,_that.verseNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AyahModel implements AyahModel {
  const _AyahModel({required this.arabic, required this.translation, required this.surahEn, required this.surahBn, required this.surahNumber, required this.verseNumber});
  factory _AyahModel.fromJson(Map<String, dynamic> json) => _$AyahModelFromJson(json);

@override final  String arabic;
@override final  String translation;
@override final  String surahEn;
@override final  String surahBn;
@override final  int surahNumber;
@override final  int verseNumber;

/// Create a copy of AyahModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AyahModelCopyWith<_AyahModel> get copyWith => __$AyahModelCopyWithImpl<_AyahModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AyahModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AyahModel&&(identical(other.arabic, arabic) || other.arabic == arabic)&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.surahEn, surahEn) || other.surahEn == surahEn)&&(identical(other.surahBn, surahBn) || other.surahBn == surahBn)&&(identical(other.surahNumber, surahNumber) || other.surahNumber == surahNumber)&&(identical(other.verseNumber, verseNumber) || other.verseNumber == verseNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,arabic,translation,surahEn,surahBn,surahNumber,verseNumber);
}

@override
String toString() {
    return 'AyahModel(arabic: $arabic, translation: $translation, surahEn: $surahEn, surahBn: $surahBn, surahNumber: $surahNumber, verseNumber: $verseNumber)';
}


}

/// @nodoc
abstract mixin class _$AyahModelCopyWith<$Res> implements $AyahModelCopyWith<$Res> {
  factory _$AyahModelCopyWith(_AyahModel value, $Res Function(_AyahModel) _then) = __$AyahModelCopyWithImpl;
@override @useResult
$Res call({
 String arabic, String translation, String surahEn, String surahBn, int surahNumber, int verseNumber
});




}
/// @nodoc
class __$AyahModelCopyWithImpl<$Res>
    implements _$AyahModelCopyWith<$Res> {
  __$AyahModelCopyWithImpl(this._self, this._then);

  final _AyahModel _self;
  final $Res Function(_AyahModel) _then;

/// Create a copy of AyahModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? arabic = null,Object? translation = null,Object? surahEn = null,Object? surahBn = null,Object? surahNumber = null,Object? verseNumber = null,}) {
  return _then(_AyahModel(
arabic: null == arabic ? _self.arabic : arabic // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as String,surahEn: null == surahEn ? _self.surahEn : surahEn // ignore: cast_nullable_to_non_nullable
as String,surahBn: null == surahBn ? _self.surahBn : surahBn // ignore: cast_nullable_to_non_nullable
as String,surahNumber: null == surahNumber ? _self.surahNumber : surahNumber // ignore: cast_nullable_to_non_nullable
as int,verseNumber: null == verseNumber ? _self.verseNumber : verseNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
