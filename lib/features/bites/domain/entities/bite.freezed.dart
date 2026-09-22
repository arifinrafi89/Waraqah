// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bite {

 String get id; String get authorName; String get authorHandle; String get text; String? get taggedBookTitle; String? get taggedBookId; int get avatarSeed;
/// Create a copy of Bite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiteCopyWith<Bite> get copyWith => _$BiteCopyWithImpl<Bite>(this as Bite, _$identity);

  /// Serializes this Bite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Bite;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bite&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.authorName, _this.authorName) || other.authorName == _this.authorName)&&(identical(other.authorHandle, _this.authorHandle) || other.authorHandle == _this.authorHandle)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.taggedBookTitle, _this.taggedBookTitle) || other.taggedBookTitle == _this.taggedBookTitle)&&(identical(other.taggedBookId, _this.taggedBookId) || other.taggedBookId == _this.taggedBookId)&&(identical(other.avatarSeed, _this.avatarSeed) || other.avatarSeed == _this.avatarSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Bite;
  return Object.hash(runtimeType,_this.id,_this.authorName,_this.authorHandle,_this.text,_this.taggedBookTitle,_this.taggedBookId,_this.avatarSeed);
}

@override
String toString() {
  final _this = this as Bite;
  return 'Bite(id: ${_this.id}, authorName: ${_this.authorName}, authorHandle: ${_this.authorHandle}, text: ${_this.text}, taggedBookTitle: ${_this.taggedBookTitle}, taggedBookId: ${_this.taggedBookId}, avatarSeed: ${_this.avatarSeed})';
}


}

/// @nodoc
abstract mixin class $BiteCopyWith<$Res>  {
  factory $BiteCopyWith(Bite value, $Res Function(Bite) _then) = _$BiteCopyWithImpl;
@useResult
$Res call({
 String id, String authorName, String authorHandle, String text, String? taggedBookTitle, String? taggedBookId, int avatarSeed
});




}
/// @nodoc
class _$BiteCopyWithImpl<$Res>
    implements $BiteCopyWith<$Res> {
  _$BiteCopyWithImpl(this._self, this._then);

  final Bite _self;
  final $Res Function(Bite) _then;

/// Create a copy of Bite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorName = null,Object? authorHandle = null,Object? text = null,Object? taggedBookTitle = freezed,Object? taggedBookId = freezed,Object? avatarSeed = null,}) {
  return _then(Bite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorHandle: null == authorHandle ? _self.authorHandle : authorHandle // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,taggedBookTitle: freezed == taggedBookTitle ? _self.taggedBookTitle : taggedBookTitle // ignore: cast_nullable_to_non_nullable
as String?,taggedBookId: freezed == taggedBookId ? _self.taggedBookId : taggedBookId // ignore: cast_nullable_to_non_nullable
as String?,avatarSeed: null == avatarSeed ? _self.avatarSeed : avatarSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Bite].
extension BitePatterns on Bite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bite value)  $default,){
final _that = this;
switch (_that) {
case _Bite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bite value)?  $default,){
final _that = this;
switch (_that) {
case _Bite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String authorName,  String authorHandle,  String text,  String? taggedBookTitle,  String? taggedBookId,  int avatarSeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bite() when $default != null:
return $default(_that.id,_that.authorName,_that.authorHandle,_that.text,_that.taggedBookTitle,_that.taggedBookId,_that.avatarSeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String authorName,  String authorHandle,  String text,  String? taggedBookTitle,  String? taggedBookId,  int avatarSeed)  $default,) {final _that = this;
switch (_that) {
case _Bite():
return $default(_that.id,_that.authorName,_that.authorHandle,_that.text,_that.taggedBookTitle,_that.taggedBookId,_that.avatarSeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String authorName,  String authorHandle,  String text,  String? taggedBookTitle,  String? taggedBookId,  int avatarSeed)?  $default,) {final _that = this;
switch (_that) {
case _Bite() when $default != null:
return $default(_that.id,_that.authorName,_that.authorHandle,_that.text,_that.taggedBookTitle,_that.taggedBookId,_that.avatarSeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Bite implements Bite {
  const _Bite({required this.id, required this.authorName, required this.authorHandle, required this.text, this.taggedBookTitle, this.taggedBookId, this.avatarSeed = 0});
  factory _Bite.fromJson(Map<String, dynamic> json) => _$BiteFromJson(json);

@override final  String id;
@override final  String authorName;
@override final  String authorHandle;
@override final  String text;
@override final  String? taggedBookTitle;
@override final  String? taggedBookId;
@override@JsonKey() final  int avatarSeed;

/// Create a copy of Bite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiteCopyWith<_Bite> get copyWith => __$BiteCopyWithImpl<_Bite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BiteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bite&&(identical(other.id, id) || other.id == id)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorHandle, authorHandle) || other.authorHandle == authorHandle)&&(identical(other.text, text) || other.text == text)&&(identical(other.taggedBookTitle, taggedBookTitle) || other.taggedBookTitle == taggedBookTitle)&&(identical(other.taggedBookId, taggedBookId) || other.taggedBookId == taggedBookId)&&(identical(other.avatarSeed, avatarSeed) || other.avatarSeed == avatarSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,authorName,authorHandle,text,taggedBookTitle,taggedBookId,avatarSeed);
}

@override
String toString() {
    return 'Bite(id: $id, authorName: $authorName, authorHandle: $authorHandle, text: $text, taggedBookTitle: $taggedBookTitle, taggedBookId: $taggedBookId, avatarSeed: $avatarSeed)';
}


}

/// @nodoc
abstract mixin class _$BiteCopyWith<$Res> implements $BiteCopyWith<$Res> {
  factory _$BiteCopyWith(_Bite value, $Res Function(_Bite) _then) = __$BiteCopyWithImpl;
@override @useResult
$Res call({
 String id, String authorName, String authorHandle, String text, String? taggedBookTitle, String? taggedBookId, int avatarSeed
});




}
/// @nodoc
class __$BiteCopyWithImpl<$Res>
    implements _$BiteCopyWith<$Res> {
  __$BiteCopyWithImpl(this._self, this._then);

  final _Bite _self;
  final $Res Function(_Bite) _then;

/// Create a copy of Bite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorName = null,Object? authorHandle = null,Object? text = null,Object? taggedBookTitle = freezed,Object? taggedBookId = freezed,Object? avatarSeed = null,}) {
  return _then(_Bite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorHandle: null == authorHandle ? _self.authorHandle : authorHandle // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,taggedBookTitle: freezed == taggedBookTitle ? _self.taggedBookTitle : taggedBookTitle // ignore: cast_nullable_to_non_nullable
as String?,taggedBookId: freezed == taggedBookId ? _self.taggedBookId : taggedBookId // ignore: cast_nullable_to_non_nullable
as String?,avatarSeed: null == avatarSeed ? _self.avatarSeed : avatarSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
