// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalletEntry {

 int get amountBdt; WalletReason get reason; DateTime get at; String? get orderNumber;/// What it was for when there's no order, e.g. the book sold back.
 String? get note;
/// Create a copy of WalletEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletEntryCopyWith<WalletEntry> get copyWith => _$WalletEntryCopyWithImpl<WalletEntry>(this as WalletEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WalletEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletEntry&&(identical(other.amountBdt, _this.amountBdt) || other.amountBdt == _this.amountBdt)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as WalletEntry;
  return Object.hash(runtimeType,_this.amountBdt,_this.reason,_this.at,_this.orderNumber,_this.note);
}

@override
String toString() {
  final _this = this as WalletEntry;
  return 'WalletEntry(amountBdt: ${_this.amountBdt}, reason: ${_this.reason}, at: ${_this.at}, orderNumber: ${_this.orderNumber}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $WalletEntryCopyWith<$Res>  {
  factory $WalletEntryCopyWith(WalletEntry value, $Res Function(WalletEntry) _then) = _$WalletEntryCopyWithImpl;
@useResult
$Res call({
 int amountBdt, WalletReason reason, DateTime at, String? orderNumber, String? note
});




}
/// @nodoc
class _$WalletEntryCopyWithImpl<$Res>
    implements $WalletEntryCopyWith<$Res> {
  _$WalletEntryCopyWithImpl(this._self, this._then);

  final WalletEntry _self;
  final $Res Function(WalletEntry) _then;

/// Create a copy of WalletEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amountBdt = null,Object? reason = null,Object? at = null,Object? orderNumber = freezed,Object? note = freezed,}) {
  return _then(WalletEntry(
amountBdt: null == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as WalletReason,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletEntry].
extension WalletEntryPatterns on WalletEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletEntry value)  $default,){
final _that = this;
switch (_that) {
case _WalletEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletEntry value)?  $default,){
final _that = this;
switch (_that) {
case _WalletEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int amountBdt,  WalletReason reason,  DateTime at,  String? orderNumber,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletEntry() when $default != null:
return $default(_that.amountBdt,_that.reason,_that.at,_that.orderNumber,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int amountBdt,  WalletReason reason,  DateTime at,  String? orderNumber,  String? note)  $default,) {final _that = this;
switch (_that) {
case _WalletEntry():
return $default(_that.amountBdt,_that.reason,_that.at,_that.orderNumber,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int amountBdt,  WalletReason reason,  DateTime at,  String? orderNumber,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _WalletEntry() when $default != null:
return $default(_that.amountBdt,_that.reason,_that.at,_that.orderNumber,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _WalletEntry implements WalletEntry {
  const _WalletEntry({required this.amountBdt, required this.reason, required this.at, this.orderNumber, this.note});
  

@override final  int amountBdt;
@override final  WalletReason reason;
@override final  DateTime at;
@override final  String? orderNumber;
/// What it was for when there's no order, e.g. the book sold back.
@override final  String? note;

/// Create a copy of WalletEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletEntryCopyWith<_WalletEntry> get copyWith => __$WalletEntryCopyWithImpl<_WalletEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletEntry&&(identical(other.amountBdt, amountBdt) || other.amountBdt == amountBdt)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.at, at) || other.at == at)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,amountBdt,reason,at,orderNumber,note);
}

@override
String toString() {
    return 'WalletEntry(amountBdt: $amountBdt, reason: $reason, at: $at, orderNumber: $orderNumber, note: $note)';
}


}

/// @nodoc
abstract mixin class _$WalletEntryCopyWith<$Res> implements $WalletEntryCopyWith<$Res> {
  factory _$WalletEntryCopyWith(_WalletEntry value, $Res Function(_WalletEntry) _then) = __$WalletEntryCopyWithImpl;
@override @useResult
$Res call({
 int amountBdt, WalletReason reason, DateTime at, String? orderNumber, String? note
});




}
/// @nodoc
class __$WalletEntryCopyWithImpl<$Res>
    implements _$WalletEntryCopyWith<$Res> {
  __$WalletEntryCopyWithImpl(this._self, this._then);

  final _WalletEntry _self;
  final $Res Function(_WalletEntry) _then;

/// Create a copy of WalletEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amountBdt = null,Object? reason = null,Object? at = null,Object? orderNumber = freezed,Object? note = freezed,}) {
  return _then(_WalletEntry(
amountBdt: null == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as WalletReason,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Wallet {

 int get balanceBdt; List<WalletEntry> get entries;
/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletCopyWith<Wallet> get copyWith => _$WalletCopyWithImpl<Wallet>(this as Wallet, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Wallet;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wallet&&(identical(other.balanceBdt, _this.balanceBdt) || other.balanceBdt == _this.balanceBdt)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}


@override
int get hashCode {
  final _this = this as Wallet;
  return Object.hash(runtimeType,_this.balanceBdt,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as Wallet;
  return 'Wallet(balanceBdt: ${_this.balanceBdt}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $WalletCopyWith<$Res>  {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) _then) = _$WalletCopyWithImpl;
@useResult
$Res call({
 int balanceBdt, List<WalletEntry> entries
});




}
/// @nodoc
class _$WalletCopyWithImpl<$Res>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._self, this._then);

  final Wallet _self;
  final $Res Function(Wallet) _then;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balanceBdt = null,Object? entries = null,}) {
  return _then(Wallet(
balanceBdt: null == balanceBdt ? _self.balanceBdt : balanceBdt // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<WalletEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [Wallet].
extension WalletPatterns on Wallet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Wallet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Wallet value)  $default,){
final _that = this;
switch (_that) {
case _Wallet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Wallet value)?  $default,){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int balanceBdt,  List<WalletEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that.balanceBdt,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int balanceBdt,  List<WalletEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _Wallet():
return $default(_that.balanceBdt,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int balanceBdt,  List<WalletEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that.balanceBdt,_that.entries);case _:
  return null;

}
}

}

/// @nodoc


class _Wallet implements Wallet {
  const _Wallet({this.balanceBdt = 0,  List<WalletEntry> entries = const <WalletEntry>[]}): _entries = entries;
  

@override@JsonKey() final  int balanceBdt;
 final  List<WalletEntry> _entries;
@override@JsonKey() List<WalletEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletCopyWith<_Wallet> get copyWith => __$WalletCopyWithImpl<_Wallet>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Wallet&&(identical(other.balanceBdt, balanceBdt) || other.balanceBdt == balanceBdt)&&const DeepCollectionEquality().equals(other.entries, _entries));
}


@override
int get hashCode {
    return Object.hash(runtimeType,balanceBdt,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'Wallet(balanceBdt: $balanceBdt, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$WalletCopyWith(_Wallet value, $Res Function(_Wallet) _then) = __$WalletCopyWithImpl;
@override @useResult
$Res call({
 int balanceBdt, List<WalletEntry> entries
});




}
/// @nodoc
class __$WalletCopyWithImpl<$Res>
    implements _$WalletCopyWith<$Res> {
  __$WalletCopyWithImpl(this._self, this._then);

  final _Wallet _self;
  final $Res Function(_Wallet) _then;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balanceBdt = null,Object? entries = null,}) {
  return _then(_Wallet(
balanceBdt: null == balanceBdt ? _self.balanceBdt : balanceBdt // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<WalletEntry>,
  ));
}


}

// dart format on
