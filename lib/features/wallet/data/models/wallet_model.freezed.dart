// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletEntryModel {

 int get amountBdt; WalletReason get reason; DateTime get at; String? get orderNumber; String? get note;
/// Create a copy of WalletEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletEntryModelCopyWith<WalletEntryModel> get copyWith => _$WalletEntryModelCopyWithImpl<WalletEntryModel>(this as WalletEntryModel, _$identity);

  /// Serializes this WalletEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WalletEntryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletEntryModel&&(identical(other.amountBdt, _this.amountBdt) || other.amountBdt == _this.amountBdt)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WalletEntryModel;
  return Object.hash(runtimeType,_this.amountBdt,_this.reason,_this.at,_this.orderNumber,_this.note);
}

@override
String toString() {
  final _this = this as WalletEntryModel;
  return 'WalletEntryModel(amountBdt: ${_this.amountBdt}, reason: ${_this.reason}, at: ${_this.at}, orderNumber: ${_this.orderNumber}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $WalletEntryModelCopyWith<$Res>  {
  factory $WalletEntryModelCopyWith(WalletEntryModel value, $Res Function(WalletEntryModel) _then) = _$WalletEntryModelCopyWithImpl;
@useResult
$Res call({
 int amountBdt, WalletReason reason, DateTime at, String? orderNumber, String? note
});




}
/// @nodoc
class _$WalletEntryModelCopyWithImpl<$Res>
    implements $WalletEntryModelCopyWith<$Res> {
  _$WalletEntryModelCopyWithImpl(this._self, this._then);

  final WalletEntryModel _self;
  final $Res Function(WalletEntryModel) _then;

/// Create a copy of WalletEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amountBdt = null,Object? reason = null,Object? at = null,Object? orderNumber = freezed,Object? note = freezed,}) {
  return _then(WalletEntryModel(
amountBdt: null == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as WalletReason,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletEntryModel].
extension WalletEntryModelPatterns on WalletEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _WalletEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _WalletEntryModel() when $default != null:
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
case _WalletEntryModel() when $default != null:
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
case _WalletEntryModel():
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
case _WalletEntryModel() when $default != null:
return $default(_that.amountBdt,_that.reason,_that.at,_that.orderNumber,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletEntryModel implements WalletEntryModel {
  const _WalletEntryModel({required this.amountBdt, required this.reason, required this.at, this.orderNumber, this.note});
  factory _WalletEntryModel.fromJson(Map<String, dynamic> json) => _$WalletEntryModelFromJson(json);

@override final  int amountBdt;
@override final  WalletReason reason;
@override final  DateTime at;
@override final  String? orderNumber;
@override final  String? note;

/// Create a copy of WalletEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletEntryModelCopyWith<_WalletEntryModel> get copyWith => __$WalletEntryModelCopyWithImpl<_WalletEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletEntryModel&&(identical(other.amountBdt, amountBdt) || other.amountBdt == amountBdt)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.at, at) || other.at == at)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,amountBdt,reason,at,orderNumber,note);
}

@override
String toString() {
    return 'WalletEntryModel(amountBdt: $amountBdt, reason: $reason, at: $at, orderNumber: $orderNumber, note: $note)';
}


}

/// @nodoc
abstract mixin class _$WalletEntryModelCopyWith<$Res> implements $WalletEntryModelCopyWith<$Res> {
  factory _$WalletEntryModelCopyWith(_WalletEntryModel value, $Res Function(_WalletEntryModel) _then) = __$WalletEntryModelCopyWithImpl;
@override @useResult
$Res call({
 int amountBdt, WalletReason reason, DateTime at, String? orderNumber, String? note
});




}
/// @nodoc
class __$WalletEntryModelCopyWithImpl<$Res>
    implements _$WalletEntryModelCopyWith<$Res> {
  __$WalletEntryModelCopyWithImpl(this._self, this._then);

  final _WalletEntryModel _self;
  final $Res Function(_WalletEntryModel) _then;

/// Create a copy of WalletEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amountBdt = null,Object? reason = null,Object? at = null,Object? orderNumber = freezed,Object? note = freezed,}) {
  return _then(_WalletEntryModel(
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
mixin _$WalletModel {

 int get balanceBdt; List<WalletEntryModel> get entries;
/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletModelCopyWith<WalletModel> get copyWith => _$WalletModelCopyWithImpl<WalletModel>(this as WalletModel, _$identity);

  /// Serializes this WalletModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WalletModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletModel&&(identical(other.balanceBdt, _this.balanceBdt) || other.balanceBdt == _this.balanceBdt)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WalletModel;
  return Object.hash(runtimeType,_this.balanceBdt,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as WalletModel;
  return 'WalletModel(balanceBdt: ${_this.balanceBdt}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $WalletModelCopyWith<$Res>  {
  factory $WalletModelCopyWith(WalletModel value, $Res Function(WalletModel) _then) = _$WalletModelCopyWithImpl;
@useResult
$Res call({
 int balanceBdt, List<WalletEntryModel> entries
});




}
/// @nodoc
class _$WalletModelCopyWithImpl<$Res>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._self, this._then);

  final WalletModel _self;
  final $Res Function(WalletModel) _then;

/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balanceBdt = null,Object? entries = null,}) {
  return _then(WalletModel(
balanceBdt: null == balanceBdt ? _self.balanceBdt : balanceBdt // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<WalletEntryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletModel].
extension WalletModelPatterns on WalletModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletModel value)  $default,){
final _that = this;
switch (_that) {
case _WalletModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletModel value)?  $default,){
final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int balanceBdt,  List<WalletEntryModel> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int balanceBdt,  List<WalletEntryModel> entries)  $default,) {final _that = this;
switch (_that) {
case _WalletModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int balanceBdt,  List<WalletEntryModel> entries)?  $default,) {final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
return $default(_that.balanceBdt,_that.entries);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _WalletModel implements WalletModel {
  const _WalletModel({this.balanceBdt = 0,  List<WalletEntryModel> entries = const <WalletEntryModel>[]}): _entries = entries;
  factory _WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);

@override@JsonKey() final  int balanceBdt;
 final  List<WalletEntryModel> _entries;
@override@JsonKey() List<WalletEntryModel> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletModelCopyWith<_WalletModel> get copyWith => __$WalletModelCopyWithImpl<_WalletModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletModel&&(identical(other.balanceBdt, balanceBdt) || other.balanceBdt == balanceBdt)&&const DeepCollectionEquality().equals(other.entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,balanceBdt,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'WalletModel(balanceBdt: $balanceBdt, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$WalletModelCopyWith<$Res> implements $WalletModelCopyWith<$Res> {
  factory _$WalletModelCopyWith(_WalletModel value, $Res Function(_WalletModel) _then) = __$WalletModelCopyWithImpl;
@override @useResult
$Res call({
 int balanceBdt, List<WalletEntryModel> entries
});




}
/// @nodoc
class __$WalletModelCopyWithImpl<$Res>
    implements _$WalletModelCopyWith<$Res> {
  __$WalletModelCopyWithImpl(this._self, this._then);

  final _WalletModel _self;
  final $Res Function(_WalletModel) _then;

/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balanceBdt = null,Object? entries = null,}) {
  return _then(_WalletModel(
balanceBdt: null == balanceBdt ? _self.balanceBdt : balanceBdt // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<WalletEntryModel>,
  ));
}


}

// dart format on
