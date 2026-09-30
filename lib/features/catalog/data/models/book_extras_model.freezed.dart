// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_extras_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentsEntryModel {

 String get title; bool get isPart;
/// Create a copy of ContentsEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentsEntryModelCopyWith<ContentsEntryModel> get copyWith => _$ContentsEntryModelCopyWithImpl<ContentsEntryModel>(this as ContentsEntryModel, _$identity);

  /// Serializes this ContentsEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ContentsEntryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentsEntryModel&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.isPart, _this.isPart) || other.isPart == _this.isPart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ContentsEntryModel;
  return Object.hash(runtimeType,_this.title,_this.isPart);
}

@override
String toString() {
  final _this = this as ContentsEntryModel;
  return 'ContentsEntryModel(title: ${_this.title}, isPart: ${_this.isPart})';
}


}

/// @nodoc
abstract mixin class $ContentsEntryModelCopyWith<$Res>  {
  factory $ContentsEntryModelCopyWith(ContentsEntryModel value, $Res Function(ContentsEntryModel) _then) = _$ContentsEntryModelCopyWithImpl;
@useResult
$Res call({
 String title, bool isPart
});




}
/// @nodoc
class _$ContentsEntryModelCopyWithImpl<$Res>
    implements $ContentsEntryModelCopyWith<$Res> {
  _$ContentsEntryModelCopyWithImpl(this._self, this._then);

  final ContentsEntryModel _self;
  final $Res Function(ContentsEntryModel) _then;

/// Create a copy of ContentsEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? isPart = null,}) {
  return _then(ContentsEntryModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isPart: null == isPart ? _self.isPart : isPart // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentsEntryModel].
extension ContentsEntryModelPatterns on ContentsEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentsEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentsEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentsEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _ContentsEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentsEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContentsEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  bool isPart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentsEntryModel() when $default != null:
return $default(_that.title,_that.isPart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  bool isPart)  $default,) {final _that = this;
switch (_that) {
case _ContentsEntryModel():
return $default(_that.title,_that.isPart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  bool isPart)?  $default,) {final _that = this;
switch (_that) {
case _ContentsEntryModel() when $default != null:
return $default(_that.title,_that.isPart);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentsEntryModel implements ContentsEntryModel {
  const _ContentsEntryModel({required this.title, this.isPart = false});
  factory _ContentsEntryModel.fromJson(Map<String, dynamic> json) => _$ContentsEntryModelFromJson(json);

@override final  String title;
@override@JsonKey() final  bool isPart;

/// Create a copy of ContentsEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentsEntryModelCopyWith<_ContentsEntryModel> get copyWith => __$ContentsEntryModelCopyWithImpl<_ContentsEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentsEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentsEntryModel&&(identical(other.title, title) || other.title == title)&&(identical(other.isPart, isPart) || other.isPart == isPart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,isPart);
}

@override
String toString() {
    return 'ContentsEntryModel(title: $title, isPart: $isPart)';
}


}

/// @nodoc
abstract mixin class _$ContentsEntryModelCopyWith<$Res> implements $ContentsEntryModelCopyWith<$Res> {
  factory _$ContentsEntryModelCopyWith(_ContentsEntryModel value, $Res Function(_ContentsEntryModel) _then) = __$ContentsEntryModelCopyWithImpl;
@override @useResult
$Res call({
 String title, bool isPart
});




}
/// @nodoc
class __$ContentsEntryModelCopyWithImpl<$Res>
    implements _$ContentsEntryModelCopyWith<$Res> {
  __$ContentsEntryModelCopyWithImpl(this._self, this._then);

  final _ContentsEntryModel _self;
  final $Res Function(_ContentsEntryModel) _then;

/// Create a copy of ContentsEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? isPart = null,}) {
  return _then(_ContentsEntryModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isPart: null == isPart ? _self.isPart : isPart // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$LookInsideModel {

 List<ContentsEntryModel> get contents; List<String> get samplePages;
/// Create a copy of LookInsideModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookInsideModelCopyWith<LookInsideModel> get copyWith => _$LookInsideModelCopyWithImpl<LookInsideModel>(this as LookInsideModel, _$identity);

  /// Serializes this LookInsideModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LookInsideModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LookInsideModel&&const DeepCollectionEquality().equals(other.contents, _this.contents)&&const DeepCollectionEquality().equals(other.samplePages, _this.samplePages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LookInsideModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.contents),const DeepCollectionEquality().hash(_this.samplePages));
}

@override
String toString() {
  final _this = this as LookInsideModel;
  return 'LookInsideModel(contents: ${_this.contents}, samplePages: ${_this.samplePages})';
}


}

/// @nodoc
abstract mixin class $LookInsideModelCopyWith<$Res>  {
  factory $LookInsideModelCopyWith(LookInsideModel value, $Res Function(LookInsideModel) _then) = _$LookInsideModelCopyWithImpl;
@useResult
$Res call({
 List<ContentsEntryModel> contents, List<String> samplePages
});




}
/// @nodoc
class _$LookInsideModelCopyWithImpl<$Res>
    implements $LookInsideModelCopyWith<$Res> {
  _$LookInsideModelCopyWithImpl(this._self, this._then);

  final LookInsideModel _self;
  final $Res Function(LookInsideModel) _then;

/// Create a copy of LookInsideModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contents = null,Object? samplePages = null,}) {
  return _then(LookInsideModel(
contents: null == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as List<ContentsEntryModel>,samplePages: null == samplePages ? _self.samplePages : samplePages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [LookInsideModel].
extension LookInsideModelPatterns on LookInsideModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LookInsideModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LookInsideModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LookInsideModel value)  $default,){
final _that = this;
switch (_that) {
case _LookInsideModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LookInsideModel value)?  $default,){
final _that = this;
switch (_that) {
case _LookInsideModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContentsEntryModel> contents,  List<String> samplePages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LookInsideModel() when $default != null:
return $default(_that.contents,_that.samplePages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContentsEntryModel> contents,  List<String> samplePages)  $default,) {final _that = this;
switch (_that) {
case _LookInsideModel():
return $default(_that.contents,_that.samplePages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContentsEntryModel> contents,  List<String> samplePages)?  $default,) {final _that = this;
switch (_that) {
case _LookInsideModel() when $default != null:
return $default(_that.contents,_that.samplePages);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _LookInsideModel implements LookInsideModel {
  const _LookInsideModel({ List<ContentsEntryModel> contents = const <ContentsEntryModel>[],  List<String> samplePages = const <String>[]}): _contents = contents,_samplePages = samplePages;
  factory _LookInsideModel.fromJson(Map<String, dynamic> json) => _$LookInsideModelFromJson(json);

 final  List<ContentsEntryModel> _contents;
@override@JsonKey() List<ContentsEntryModel> get contents {
  if (_contents is EqualUnmodifiableListView) return _contents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contents);
}

 final  List<String> _samplePages;
@override@JsonKey() List<String> get samplePages {
  if (_samplePages is EqualUnmodifiableListView) return _samplePages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_samplePages);
}


/// Create a copy of LookInsideModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LookInsideModelCopyWith<_LookInsideModel> get copyWith => __$LookInsideModelCopyWithImpl<_LookInsideModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LookInsideModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LookInsideModel&&const DeepCollectionEquality().equals(other.contents, _contents)&&const DeepCollectionEquality().equals(other.samplePages, _samplePages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_contents),const DeepCollectionEquality().hash(_samplePages));
}

@override
String toString() {
    return 'LookInsideModel(contents: $contents, samplePages: $samplePages)';
}


}

/// @nodoc
abstract mixin class _$LookInsideModelCopyWith<$Res> implements $LookInsideModelCopyWith<$Res> {
  factory _$LookInsideModelCopyWith(_LookInsideModel value, $Res Function(_LookInsideModel) _then) = __$LookInsideModelCopyWithImpl;
@override @useResult
$Res call({
 List<ContentsEntryModel> contents, List<String> samplePages
});




}
/// @nodoc
class __$LookInsideModelCopyWithImpl<$Res>
    implements _$LookInsideModelCopyWith<$Res> {
  __$LookInsideModelCopyWithImpl(this._self, this._then);

  final _LookInsideModel _self;
  final $Res Function(_LookInsideModel) _then;

/// Create a copy of LookInsideModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contents = null,Object? samplePages = null,}) {
  return _then(_LookInsideModel(
contents: null == contents ? _self._contents : contents // ignore: cast_nullable_to_non_nullable
as List<ContentsEntryModel>,samplePages: null == samplePages ? _self._samplePages : samplePages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$SeriesEntryModel {

 int get position; String get title; String? get bookId; int get coverSeed;
/// Create a copy of SeriesEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesEntryModelCopyWith<SeriesEntryModel> get copyWith => _$SeriesEntryModelCopyWithImpl<SeriesEntryModel>(this as SeriesEntryModel, _$identity);

  /// Serializes this SeriesEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SeriesEntryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesEntryModel&&(identical(other.position, _this.position) || other.position == _this.position)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SeriesEntryModel;
  return Object.hash(runtimeType,_this.position,_this.title,_this.bookId,_this.coverSeed);
}

@override
String toString() {
  final _this = this as SeriesEntryModel;
  return 'SeriesEntryModel(position: ${_this.position}, title: ${_this.title}, bookId: ${_this.bookId}, coverSeed: ${_this.coverSeed})';
}


}

/// @nodoc
abstract mixin class $SeriesEntryModelCopyWith<$Res>  {
  factory $SeriesEntryModelCopyWith(SeriesEntryModel value, $Res Function(SeriesEntryModel) _then) = _$SeriesEntryModelCopyWithImpl;
@useResult
$Res call({
 int position, String title, String? bookId, int coverSeed
});




}
/// @nodoc
class _$SeriesEntryModelCopyWithImpl<$Res>
    implements $SeriesEntryModelCopyWith<$Res> {
  _$SeriesEntryModelCopyWithImpl(this._self, this._then);

  final SeriesEntryModel _self;
  final $Res Function(SeriesEntryModel) _then;

/// Create a copy of SeriesEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? title = null,Object? bookId = freezed,Object? coverSeed = null,}) {
  return _then(SeriesEntryModel(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesEntryModel].
extension SeriesEntryModelPatterns on SeriesEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _SeriesEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int position,  String title,  String? bookId,  int coverSeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesEntryModel() when $default != null:
return $default(_that.position,_that.title,_that.bookId,_that.coverSeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int position,  String title,  String? bookId,  int coverSeed)  $default,) {final _that = this;
switch (_that) {
case _SeriesEntryModel():
return $default(_that.position,_that.title,_that.bookId,_that.coverSeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int position,  String title,  String? bookId,  int coverSeed)?  $default,) {final _that = this;
switch (_that) {
case _SeriesEntryModel() when $default != null:
return $default(_that.position,_that.title,_that.bookId,_that.coverSeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeriesEntryModel implements SeriesEntryModel {
  const _SeriesEntryModel({required this.position, required this.title, this.bookId, this.coverSeed = 0});
  factory _SeriesEntryModel.fromJson(Map<String, dynamic> json) => _$SeriesEntryModelFromJson(json);

@override final  int position;
@override final  String title;
@override final  String? bookId;
@override@JsonKey() final  int coverSeed;

/// Create a copy of SeriesEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesEntryModelCopyWith<_SeriesEntryModel> get copyWith => __$SeriesEntryModelCopyWithImpl<_SeriesEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriesEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesEntryModel&&(identical(other.position, position) || other.position == position)&&(identical(other.title, title) || other.title == title)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,position,title,bookId,coverSeed);
}

@override
String toString() {
    return 'SeriesEntryModel(position: $position, title: $title, bookId: $bookId, coverSeed: $coverSeed)';
}


}

/// @nodoc
abstract mixin class _$SeriesEntryModelCopyWith<$Res> implements $SeriesEntryModelCopyWith<$Res> {
  factory _$SeriesEntryModelCopyWith(_SeriesEntryModel value, $Res Function(_SeriesEntryModel) _then) = __$SeriesEntryModelCopyWithImpl;
@override @useResult
$Res call({
 int position, String title, String? bookId, int coverSeed
});




}
/// @nodoc
class __$SeriesEntryModelCopyWithImpl<$Res>
    implements _$SeriesEntryModelCopyWith<$Res> {
  __$SeriesEntryModelCopyWithImpl(this._self, this._then);

  final _SeriesEntryModel _self;
  final $Res Function(_SeriesEntryModel) _then;

/// Create a copy of SeriesEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? title = null,Object? bookId = freezed,Object? coverSeed = null,}) {
  return _then(_SeriesEntryModel(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BookSeriesModel {

 String get name; List<SeriesEntryModel> get entries;
/// Create a copy of BookSeriesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookSeriesModelCopyWith<BookSeriesModel> get copyWith => _$BookSeriesModelCopyWithImpl<BookSeriesModel>(this as BookSeriesModel, _$identity);

  /// Serializes this BookSeriesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookSeriesModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookSeriesModel&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookSeriesModel;
  return Object.hash(runtimeType,_this.name,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as BookSeriesModel;
  return 'BookSeriesModel(name: ${_this.name}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $BookSeriesModelCopyWith<$Res>  {
  factory $BookSeriesModelCopyWith(BookSeriesModel value, $Res Function(BookSeriesModel) _then) = _$BookSeriesModelCopyWithImpl;
@useResult
$Res call({
 String name, List<SeriesEntryModel> entries
});




}
/// @nodoc
class _$BookSeriesModelCopyWithImpl<$Res>
    implements $BookSeriesModelCopyWith<$Res> {
  _$BookSeriesModelCopyWithImpl(this._self, this._then);

  final BookSeriesModel _self;
  final $Res Function(BookSeriesModel) _then;

/// Create a copy of BookSeriesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? entries = null,}) {
  return _then(BookSeriesModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<SeriesEntryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookSeriesModel].
extension BookSeriesModelPatterns on BookSeriesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookSeriesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookSeriesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookSeriesModel value)  $default,){
final _that = this;
switch (_that) {
case _BookSeriesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookSeriesModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookSeriesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<SeriesEntryModel> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookSeriesModel() when $default != null:
return $default(_that.name,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<SeriesEntryModel> entries)  $default,) {final _that = this;
switch (_that) {
case _BookSeriesModel():
return $default(_that.name,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<SeriesEntryModel> entries)?  $default,) {final _that = this;
switch (_that) {
case _BookSeriesModel() when $default != null:
return $default(_that.name,_that.entries);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BookSeriesModel implements BookSeriesModel {
  const _BookSeriesModel({required this.name, required  List<SeriesEntryModel> entries}): _entries = entries;
  factory _BookSeriesModel.fromJson(Map<String, dynamic> json) => _$BookSeriesModelFromJson(json);

@override final  String name;
 final  List<SeriesEntryModel> _entries;
@override List<SeriesEntryModel> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of BookSeriesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookSeriesModelCopyWith<_BookSeriesModel> get copyWith => __$BookSeriesModelCopyWithImpl<_BookSeriesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookSeriesModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookSeriesModel&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'BookSeriesModel(name: $name, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$BookSeriesModelCopyWith<$Res> implements $BookSeriesModelCopyWith<$Res> {
  factory _$BookSeriesModelCopyWith(_BookSeriesModel value, $Res Function(_BookSeriesModel) _then) = __$BookSeriesModelCopyWithImpl;
@override @useResult
$Res call({
 String name, List<SeriesEntryModel> entries
});




}
/// @nodoc
class __$BookSeriesModelCopyWithImpl<$Res>
    implements _$BookSeriesModelCopyWith<$Res> {
  __$BookSeriesModelCopyWithImpl(this._self, this._then);

  final _BookSeriesModel _self;
  final $Res Function(_BookSeriesModel) _then;

/// Create a copy of BookSeriesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? entries = null,}) {
  return _then(_BookSeriesModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<SeriesEntryModel>,
  ));
}


}

// dart format on
