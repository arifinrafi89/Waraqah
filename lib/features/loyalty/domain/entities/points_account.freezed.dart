// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'points_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PointsEntry {

 int get points; PointsReason get reason; DateTime get at; String? get orderNumber;
/// Create a copy of PointsEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointsEntryCopyWith<PointsEntry> get copyWith => _$PointsEntryCopyWithImpl<PointsEntry>(this as PointsEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PointsEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointsEntry&&(identical(other.points, _this.points) || other.points == _this.points)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber));
}


@override
int get hashCode {
  final _this = this as PointsEntry;
  return Object.hash(runtimeType,_this.points,_this.reason,_this.at,_this.orderNumber);
}

@override
String toString() {
  final _this = this as PointsEntry;
  return 'PointsEntry(points: ${_this.points}, reason: ${_this.reason}, at: ${_this.at}, orderNumber: ${_this.orderNumber})';
}


}

/// @nodoc
abstract mixin class $PointsEntryCopyWith<$Res>  {
  factory $PointsEntryCopyWith(PointsEntry value, $Res Function(PointsEntry) _then) = _$PointsEntryCopyWithImpl;
@useResult
$Res call({
 int points, PointsReason reason, DateTime at, String? orderNumber
});




}
/// @nodoc
class _$PointsEntryCopyWithImpl<$Res>
    implements $PointsEntryCopyWith<$Res> {
  _$PointsEntryCopyWithImpl(this._self, this._then);

  final PointsEntry _self;
  final $Res Function(PointsEntry) _then;

/// Create a copy of PointsEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? reason = null,Object? at = null,Object? orderNumber = freezed,}) {
  return _then(PointsEntry(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as PointsReason,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PointsEntry].
extension PointsEntryPatterns on PointsEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointsEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointsEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointsEntry value)  $default,){
final _that = this;
switch (_that) {
case _PointsEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointsEntry value)?  $default,){
final _that = this;
switch (_that) {
case _PointsEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points,  PointsReason reason,  DateTime at,  String? orderNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PointsEntry() when $default != null:
return $default(_that.points,_that.reason,_that.at,_that.orderNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points,  PointsReason reason,  DateTime at,  String? orderNumber)  $default,) {final _that = this;
switch (_that) {
case _PointsEntry():
return $default(_that.points,_that.reason,_that.at,_that.orderNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points,  PointsReason reason,  DateTime at,  String? orderNumber)?  $default,) {final _that = this;
switch (_that) {
case _PointsEntry() when $default != null:
return $default(_that.points,_that.reason,_that.at,_that.orderNumber);case _:
  return null;

}
}

}

/// @nodoc


class _PointsEntry implements PointsEntry {
  const _PointsEntry({required this.points, required this.reason, required this.at, this.orderNumber});
  

@override final  int points;
@override final  PointsReason reason;
@override final  DateTime at;
@override final  String? orderNumber;

/// Create a copy of PointsEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointsEntryCopyWith<_PointsEntry> get copyWith => __$PointsEntryCopyWithImpl<_PointsEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointsEntry&&(identical(other.points, points) || other.points == points)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.at, at) || other.at == at)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber));
}


@override
int get hashCode {
    return Object.hash(runtimeType,points,reason,at,orderNumber);
}

@override
String toString() {
    return 'PointsEntry(points: $points, reason: $reason, at: $at, orderNumber: $orderNumber)';
}


}

/// @nodoc
abstract mixin class _$PointsEntryCopyWith<$Res> implements $PointsEntryCopyWith<$Res> {
  factory _$PointsEntryCopyWith(_PointsEntry value, $Res Function(_PointsEntry) _then) = __$PointsEntryCopyWithImpl;
@override @useResult
$Res call({
 int points, PointsReason reason, DateTime at, String? orderNumber
});




}
/// @nodoc
class __$PointsEntryCopyWithImpl<$Res>
    implements _$PointsEntryCopyWith<$Res> {
  __$PointsEntryCopyWithImpl(this._self, this._then);

  final _PointsEntry _self;
  final $Res Function(_PointsEntry) _then;

/// Create a copy of PointsEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? reason = null,Object? at = null,Object? orderNumber = freezed,}) {
  return _then(_PointsEntry(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as PointsReason,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PointsAccount {

 int get balance; List<PointsEntry> get entries;
/// Create a copy of PointsAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointsAccountCopyWith<PointsAccount> get copyWith => _$PointsAccountCopyWithImpl<PointsAccount>(this as PointsAccount, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PointsAccount;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointsAccount&&(identical(other.balance, _this.balance) || other.balance == _this.balance)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}


@override
int get hashCode {
  final _this = this as PointsAccount;
  return Object.hash(runtimeType,_this.balance,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as PointsAccount;
  return 'PointsAccount(balance: ${_this.balance}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $PointsAccountCopyWith<$Res>  {
  factory $PointsAccountCopyWith(PointsAccount value, $Res Function(PointsAccount) _then) = _$PointsAccountCopyWithImpl;
@useResult
$Res call({
 int balance, List<PointsEntry> entries
});




}
/// @nodoc
class _$PointsAccountCopyWithImpl<$Res>
    implements $PointsAccountCopyWith<$Res> {
  _$PointsAccountCopyWithImpl(this._self, this._then);

  final PointsAccount _self;
  final $Res Function(PointsAccount) _then;

/// Create a copy of PointsAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balance = null,Object? entries = null,}) {
  return _then(PointsAccount(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<PointsEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [PointsAccount].
extension PointsAccountPatterns on PointsAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointsAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointsAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointsAccount value)  $default,){
final _that = this;
switch (_that) {
case _PointsAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointsAccount value)?  $default,){
final _that = this;
switch (_that) {
case _PointsAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int balance,  List<PointsEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PointsAccount() when $default != null:
return $default(_that.balance,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int balance,  List<PointsEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _PointsAccount():
return $default(_that.balance,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int balance,  List<PointsEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _PointsAccount() when $default != null:
return $default(_that.balance,_that.entries);case _:
  return null;

}
}

}

/// @nodoc


class _PointsAccount implements PointsAccount {
  const _PointsAccount({this.balance = 0,  List<PointsEntry> entries = const <PointsEntry>[]}): _entries = entries;
  

@override@JsonKey() final  int balance;
 final  List<PointsEntry> _entries;
@override@JsonKey() List<PointsEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of PointsAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointsAccountCopyWith<_PointsAccount> get copyWith => __$PointsAccountCopyWithImpl<_PointsAccount>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointsAccount&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.entries, _entries));
}


@override
int get hashCode {
    return Object.hash(runtimeType,balance,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'PointsAccount(balance: $balance, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$PointsAccountCopyWith<$Res> implements $PointsAccountCopyWith<$Res> {
  factory _$PointsAccountCopyWith(_PointsAccount value, $Res Function(_PointsAccount) _then) = __$PointsAccountCopyWithImpl;
@override @useResult
$Res call({
 int balance, List<PointsEntry> entries
});




}
/// @nodoc
class __$PointsAccountCopyWithImpl<$Res>
    implements _$PointsAccountCopyWith<$Res> {
  __$PointsAccountCopyWithImpl(this._self, this._then);

  final _PointsAccount _self;
  final $Res Function(_PointsAccount) _then;

/// Create a copy of PointsAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balance = null,Object? entries = null,}) {
  return _then(_PointsAccount(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<PointsEntry>,
  ));
}


}

// dart format on
