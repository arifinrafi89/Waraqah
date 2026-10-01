// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_change.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InboxChange {

/// Counts up, so two changes to the same thread are still two events.
 int get seq; String get threadId; String get listingId;
/// Create a copy of InboxChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxChangeCopyWith<InboxChange> get copyWith => _$InboxChangeCopyWithImpl<InboxChange>(this as InboxChange, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as InboxChange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxChange&&(identical(other.seq, _this.seq) || other.seq == _this.seq)&&(identical(other.threadId, _this.threadId) || other.threadId == _this.threadId)&&(identical(other.listingId, _this.listingId) || other.listingId == _this.listingId));
}


@override
int get hashCode {
  final _this = this as InboxChange;
  return Object.hash(runtimeType,_this.seq,_this.threadId,_this.listingId);
}

@override
String toString() {
  final _this = this as InboxChange;
  return 'InboxChange(seq: ${_this.seq}, threadId: ${_this.threadId}, listingId: ${_this.listingId})';
}


}

/// @nodoc
abstract mixin class $InboxChangeCopyWith<$Res>  {
  factory $InboxChangeCopyWith(InboxChange value, $Res Function(InboxChange) _then) = _$InboxChangeCopyWithImpl;
@useResult
$Res call({
 int seq, String threadId, String listingId
});




}
/// @nodoc
class _$InboxChangeCopyWithImpl<$Res>
    implements $InboxChangeCopyWith<$Res> {
  _$InboxChangeCopyWithImpl(this._self, this._then);

  final InboxChange _self;
  final $Res Function(InboxChange) _then;

/// Create a copy of InboxChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seq = null,Object? threadId = null,Object? listingId = null,}) {
  return _then(InboxChange(
seq: null == seq ? _self.seq : seq // ignore: cast_nullable_to_non_nullable
as int,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InboxChange].
extension InboxChangePatterns on InboxChange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxChange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxChange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxChange value)  $default,){
final _that = this;
switch (_that) {
case _InboxChange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxChange value)?  $default,){
final _that = this;
switch (_that) {
case _InboxChange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int seq,  String threadId,  String listingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxChange() when $default != null:
return $default(_that.seq,_that.threadId,_that.listingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int seq,  String threadId,  String listingId)  $default,) {final _that = this;
switch (_that) {
case _InboxChange():
return $default(_that.seq,_that.threadId,_that.listingId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int seq,  String threadId,  String listingId)?  $default,) {final _that = this;
switch (_that) {
case _InboxChange() when $default != null:
return $default(_that.seq,_that.threadId,_that.listingId);case _:
  return null;

}
}

}

/// @nodoc


class _InboxChange implements InboxChange {
  const _InboxChange({required this.seq, required this.threadId, required this.listingId});
  

/// Counts up, so two changes to the same thread are still two events.
@override final  int seq;
@override final  String threadId;
@override final  String listingId;

/// Create a copy of InboxChange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxChangeCopyWith<_InboxChange> get copyWith => __$InboxChangeCopyWithImpl<_InboxChange>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxChange&&(identical(other.seq, seq) || other.seq == seq)&&(identical(other.threadId, threadId) || other.threadId == threadId)&&(identical(other.listingId, listingId) || other.listingId == listingId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,seq,threadId,listingId);
}

@override
String toString() {
    return 'InboxChange(seq: $seq, threadId: $threadId, listingId: $listingId)';
}


}

/// @nodoc
abstract mixin class _$InboxChangeCopyWith<$Res> implements $InboxChangeCopyWith<$Res> {
  factory _$InboxChangeCopyWith(_InboxChange value, $Res Function(_InboxChange) _then) = __$InboxChangeCopyWithImpl;
@override @useResult
$Res call({
 int seq, String threadId, String listingId
});




}
/// @nodoc
class __$InboxChangeCopyWithImpl<$Res>
    implements _$InboxChangeCopyWith<$Res> {
  __$InboxChangeCopyWithImpl(this._self, this._then);

  final _InboxChange _self;
  final $Res Function(_InboxChange) _then;

/// Create a copy of InboxChange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seq = null,Object? threadId = null,Object? listingId = null,}) {
  return _then(_InboxChange(
seq: null == seq ? _self.seq : seq // ignore: cast_nullable_to_non_nullable
as int,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
