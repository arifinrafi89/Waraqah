// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'look_inside.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContentsEntry {

 String get title; bool get isPart;
/// Create a copy of ContentsEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentsEntryCopyWith<ContentsEntry> get copyWith => _$ContentsEntryCopyWithImpl<ContentsEntry>(this as ContentsEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ContentsEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentsEntry&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.isPart, _this.isPart) || other.isPart == _this.isPart));
}


@override
int get hashCode {
  final _this = this as ContentsEntry;
  return Object.hash(runtimeType,_this.title,_this.isPart);
}

@override
String toString() {
  final _this = this as ContentsEntry;
  return 'ContentsEntry(title: ${_this.title}, isPart: ${_this.isPart})';
}


}

/// @nodoc
abstract mixin class $ContentsEntryCopyWith<$Res>  {
  factory $ContentsEntryCopyWith(ContentsEntry value, $Res Function(ContentsEntry) _then) = _$ContentsEntryCopyWithImpl;
@useResult
$Res call({
 String title, bool isPart
});




}
/// @nodoc
class _$ContentsEntryCopyWithImpl<$Res>
    implements $ContentsEntryCopyWith<$Res> {
  _$ContentsEntryCopyWithImpl(this._self, this._then);

  final ContentsEntry _self;
  final $Res Function(ContentsEntry) _then;

/// Create a copy of ContentsEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? isPart = null,}) {
  return _then(ContentsEntry(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isPart: null == isPart ? _self.isPart : isPart // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentsEntry].
extension ContentsEntryPatterns on ContentsEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentsEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentsEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentsEntry value)  $default,){
final _that = this;
switch (_that) {
case _ContentsEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentsEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ContentsEntry() when $default != null:
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
case _ContentsEntry() when $default != null:
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
case _ContentsEntry():
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
case _ContentsEntry() when $default != null:
return $default(_that.title,_that.isPart);case _:
  return null;

}
}

}

/// @nodoc


class _ContentsEntry implements ContentsEntry {
  const _ContentsEntry({required this.title, this.isPart = false});
  

@override final  String title;
@override@JsonKey() final  bool isPart;

/// Create a copy of ContentsEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentsEntryCopyWith<_ContentsEntry> get copyWith => __$ContentsEntryCopyWithImpl<_ContentsEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentsEntry&&(identical(other.title, title) || other.title == title)&&(identical(other.isPart, isPart) || other.isPart == isPart));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,isPart);
}

@override
String toString() {
    return 'ContentsEntry(title: $title, isPart: $isPart)';
}


}

/// @nodoc
abstract mixin class _$ContentsEntryCopyWith<$Res> implements $ContentsEntryCopyWith<$Res> {
  factory _$ContentsEntryCopyWith(_ContentsEntry value, $Res Function(_ContentsEntry) _then) = __$ContentsEntryCopyWithImpl;
@override @useResult
$Res call({
 String title, bool isPart
});




}
/// @nodoc
class __$ContentsEntryCopyWithImpl<$Res>
    implements _$ContentsEntryCopyWith<$Res> {
  __$ContentsEntryCopyWithImpl(this._self, this._then);

  final _ContentsEntry _self;
  final $Res Function(_ContentsEntry) _then;

/// Create a copy of ContentsEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? isPart = null,}) {
  return _then(_ContentsEntry(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isPart: null == isPart ? _self.isPart : isPart // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$LookInside {

 List<ContentsEntry> get contents;/// Each page's text, in reading order.
 List<String> get samplePages;
/// Create a copy of LookInside
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookInsideCopyWith<LookInside> get copyWith => _$LookInsideCopyWithImpl<LookInside>(this as LookInside, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LookInside;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LookInside&&const DeepCollectionEquality().equals(other.contents, _this.contents)&&const DeepCollectionEquality().equals(other.samplePages, _this.samplePages));
}


@override
int get hashCode {
  final _this = this as LookInside;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.contents),const DeepCollectionEquality().hash(_this.samplePages));
}

@override
String toString() {
  final _this = this as LookInside;
  return 'LookInside(contents: ${_this.contents}, samplePages: ${_this.samplePages})';
}


}

/// @nodoc
abstract mixin class $LookInsideCopyWith<$Res>  {
  factory $LookInsideCopyWith(LookInside value, $Res Function(LookInside) _then) = _$LookInsideCopyWithImpl;
@useResult
$Res call({
 List<ContentsEntry> contents, List<String> samplePages
});




}
/// @nodoc
class _$LookInsideCopyWithImpl<$Res>
    implements $LookInsideCopyWith<$Res> {
  _$LookInsideCopyWithImpl(this._self, this._then);

  final LookInside _self;
  final $Res Function(LookInside) _then;

/// Create a copy of LookInside
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contents = null,Object? samplePages = null,}) {
  return _then(LookInside(
contents: null == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as List<ContentsEntry>,samplePages: null == samplePages ? _self.samplePages : samplePages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [LookInside].
extension LookInsidePatterns on LookInside {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LookInside value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LookInside() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LookInside value)  $default,){
final _that = this;
switch (_that) {
case _LookInside():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LookInside value)?  $default,){
final _that = this;
switch (_that) {
case _LookInside() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContentsEntry> contents,  List<String> samplePages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LookInside() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContentsEntry> contents,  List<String> samplePages)  $default,) {final _that = this;
switch (_that) {
case _LookInside():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContentsEntry> contents,  List<String> samplePages)?  $default,) {final _that = this;
switch (_that) {
case _LookInside() when $default != null:
return $default(_that.contents,_that.samplePages);case _:
  return null;

}
}

}

/// @nodoc


class _LookInside implements LookInside {
  const _LookInside({ List<ContentsEntry> contents = const <ContentsEntry>[],  List<String> samplePages = const <String>[]}): _contents = contents,_samplePages = samplePages;
  

 final  List<ContentsEntry> _contents;
@override@JsonKey() List<ContentsEntry> get contents {
  if (_contents is EqualUnmodifiableListView) return _contents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contents);
}

/// Each page's text, in reading order.
 final  List<String> _samplePages;
/// Each page's text, in reading order.
@override@JsonKey() List<String> get samplePages {
  if (_samplePages is EqualUnmodifiableListView) return _samplePages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_samplePages);
}


/// Create a copy of LookInside
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LookInsideCopyWith<_LookInside> get copyWith => __$LookInsideCopyWithImpl<_LookInside>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LookInside&&const DeepCollectionEquality().equals(other.contents, _contents)&&const DeepCollectionEquality().equals(other.samplePages, _samplePages));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_contents),const DeepCollectionEquality().hash(_samplePages));
}

@override
String toString() {
    return 'LookInside(contents: $contents, samplePages: $samplePages)';
}


}

/// @nodoc
abstract mixin class _$LookInsideCopyWith<$Res> implements $LookInsideCopyWith<$Res> {
  factory _$LookInsideCopyWith(_LookInside value, $Res Function(_LookInside) _then) = __$LookInsideCopyWithImpl;
@override @useResult
$Res call({
 List<ContentsEntry> contents, List<String> samplePages
});




}
/// @nodoc
class __$LookInsideCopyWithImpl<$Res>
    implements _$LookInsideCopyWith<$Res> {
  __$LookInsideCopyWithImpl(this._self, this._then);

  final _LookInside _self;
  final $Res Function(_LookInside) _then;

/// Create a copy of LookInside
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contents = null,Object? samplePages = null,}) {
  return _then(_LookInside(
contents: null == contents ? _self._contents : contents // ignore: cast_nullable_to_non_nullable
as List<ContentsEntry>,samplePages: null == samplePages ? _self._samplePages : samplePages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
