// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bite_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BiteQuery {

 bool get following; String? get bookId; String? get authorId;
/// Create a copy of BiteQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiteQueryCopyWith<BiteQuery> get copyWith => _$BiteQueryCopyWithImpl<BiteQuery>(this as BiteQuery, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BiteQuery;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiteQuery&&(identical(other.following, _this.following) || other.following == _this.following)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.authorId, _this.authorId) || other.authorId == _this.authorId));
}


@override
int get hashCode {
  final _this = this as BiteQuery;
  return Object.hash(runtimeType,_this.following,_this.bookId,_this.authorId);
}

@override
String toString() {
  final _this = this as BiteQuery;
  return 'BiteQuery(following: ${_this.following}, bookId: ${_this.bookId}, authorId: ${_this.authorId})';
}


}

/// @nodoc
abstract mixin class $BiteQueryCopyWith<$Res>  {
  factory $BiteQueryCopyWith(BiteQuery value, $Res Function(BiteQuery) _then) = _$BiteQueryCopyWithImpl;
@useResult
$Res call({
 bool following, String? bookId, String? authorId
});




}
/// @nodoc
class _$BiteQueryCopyWithImpl<$Res>
    implements $BiteQueryCopyWith<$Res> {
  _$BiteQueryCopyWithImpl(this._self, this._then);

  final BiteQuery _self;
  final $Res Function(BiteQuery) _then;

/// Create a copy of BiteQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? following = null,Object? bookId = freezed,Object? authorId = freezed,}) {
  return _then(BiteQuery(
following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as bool,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BiteQuery].
extension BiteQueryPatterns on BiteQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiteQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiteQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiteQuery value)  $default,){
final _that = this;
switch (_that) {
case _BiteQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiteQuery value)?  $default,){
final _that = this;
switch (_that) {
case _BiteQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool following,  String? bookId,  String? authorId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiteQuery() when $default != null:
return $default(_that.following,_that.bookId,_that.authorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool following,  String? bookId,  String? authorId)  $default,) {final _that = this;
switch (_that) {
case _BiteQuery():
return $default(_that.following,_that.bookId,_that.authorId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool following,  String? bookId,  String? authorId)?  $default,) {final _that = this;
switch (_that) {
case _BiteQuery() when $default != null:
return $default(_that.following,_that.bookId,_that.authorId);case _:
  return null;

}
}

}

/// @nodoc


class _BiteQuery implements BiteQuery {
  const _BiteQuery({this.following = false, this.bookId, this.authorId});
  

@override@JsonKey() final  bool following;
@override final  String? bookId;
@override final  String? authorId;

/// Create a copy of BiteQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiteQueryCopyWith<_BiteQuery> get copyWith => __$BiteQueryCopyWithImpl<_BiteQuery>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiteQuery&&(identical(other.following, following) || other.following == following)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.authorId, authorId) || other.authorId == authorId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,following,bookId,authorId);
}

@override
String toString() {
    return 'BiteQuery(following: $following, bookId: $bookId, authorId: $authorId)';
}


}

/// @nodoc
abstract mixin class _$BiteQueryCopyWith<$Res> implements $BiteQueryCopyWith<$Res> {
  factory _$BiteQueryCopyWith(_BiteQuery value, $Res Function(_BiteQuery) _then) = __$BiteQueryCopyWithImpl;
@override @useResult
$Res call({
 bool following, String? bookId, String? authorId
});




}
/// @nodoc
class __$BiteQueryCopyWithImpl<$Res>
    implements _$BiteQueryCopyWith<$Res> {
  __$BiteQueryCopyWithImpl(this._self, this._then);

  final _BiteQuery _self;
  final $Res Function(_BiteQuery) _then;

/// Create a copy of BiteQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? following = null,Object? bookId = freezed,Object? authorId = freezed,}) {
  return _then(_BiteQuery(
following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as bool,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BiteDraft {

 String? get id; String get text; String? get bookId; bool get spoiler;
/// Create a copy of BiteDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiteDraftCopyWith<BiteDraft> get copyWith => _$BiteDraftCopyWithImpl<BiteDraft>(this as BiteDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BiteDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiteDraft&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.spoiler, _this.spoiler) || other.spoiler == _this.spoiler));
}


@override
int get hashCode {
  final _this = this as BiteDraft;
  return Object.hash(runtimeType,_this.id,_this.text,_this.bookId,_this.spoiler);
}

@override
String toString() {
  final _this = this as BiteDraft;
  return 'BiteDraft(id: ${_this.id}, text: ${_this.text}, bookId: ${_this.bookId}, spoiler: ${_this.spoiler})';
}


}

/// @nodoc
abstract mixin class $BiteDraftCopyWith<$Res>  {
  factory $BiteDraftCopyWith(BiteDraft value, $Res Function(BiteDraft) _then) = _$BiteDraftCopyWithImpl;
@useResult
$Res call({
 String? id, String text, String? bookId, bool spoiler
});




}
/// @nodoc
class _$BiteDraftCopyWithImpl<$Res>
    implements $BiteDraftCopyWith<$Res> {
  _$BiteDraftCopyWithImpl(this._self, this._then);

  final BiteDraft _self;
  final $Res Function(BiteDraft) _then;

/// Create a copy of BiteDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? text = null,Object? bookId = freezed,Object? spoiler = null,}) {
  return _then(BiteDraft(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,spoiler: null == spoiler ? _self.spoiler : spoiler // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BiteDraft].
extension BiteDraftPatterns on BiteDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiteDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiteDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiteDraft value)  $default,){
final _that = this;
switch (_that) {
case _BiteDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiteDraft value)?  $default,){
final _that = this;
switch (_that) {
case _BiteDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String text,  String? bookId,  bool spoiler)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiteDraft() when $default != null:
return $default(_that.id,_that.text,_that.bookId,_that.spoiler);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String text,  String? bookId,  bool spoiler)  $default,) {final _that = this;
switch (_that) {
case _BiteDraft():
return $default(_that.id,_that.text,_that.bookId,_that.spoiler);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String text,  String? bookId,  bool spoiler)?  $default,) {final _that = this;
switch (_that) {
case _BiteDraft() when $default != null:
return $default(_that.id,_that.text,_that.bookId,_that.spoiler);case _:
  return null;

}
}

}

/// @nodoc


class _BiteDraft implements BiteDraft {
  const _BiteDraft({this.id, required this.text, this.bookId, this.spoiler = false});
  

@override final  String? id;
@override final  String text;
@override final  String? bookId;
@override@JsonKey() final  bool spoiler;

/// Create a copy of BiteDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiteDraftCopyWith<_BiteDraft> get copyWith => __$BiteDraftCopyWithImpl<_BiteDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiteDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.spoiler, spoiler) || other.spoiler == spoiler));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,text,bookId,spoiler);
}

@override
String toString() {
    return 'BiteDraft(id: $id, text: $text, bookId: $bookId, spoiler: $spoiler)';
}


}

/// @nodoc
abstract mixin class _$BiteDraftCopyWith<$Res> implements $BiteDraftCopyWith<$Res> {
  factory _$BiteDraftCopyWith(_BiteDraft value, $Res Function(_BiteDraft) _then) = __$BiteDraftCopyWithImpl;
@override @useResult
$Res call({
 String? id, String text, String? bookId, bool spoiler
});




}
/// @nodoc
class __$BiteDraftCopyWithImpl<$Res>
    implements _$BiteDraftCopyWith<$Res> {
  __$BiteDraftCopyWithImpl(this._self, this._then);

  final _BiteDraft _self;
  final $Res Function(_BiteDraft) _then;

/// Create a copy of BiteDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? text = null,Object? bookId = freezed,Object? spoiler = null,}) {
  return _then(_BiteDraft(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,spoiler: null == spoiler ? _self.spoiler : spoiler // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
