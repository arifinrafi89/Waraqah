// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'points_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PointsEntryModel {

 int get points; PointsReason get reason; DateTime get at; String? get orderNumber;
/// Create a copy of PointsEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointsEntryModelCopyWith<PointsEntryModel> get copyWith => _$PointsEntryModelCopyWithImpl<PointsEntryModel>(this as PointsEntryModel, _$identity);

  /// Serializes this PointsEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PointsEntryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointsEntryModel&&(identical(other.points, _this.points) || other.points == _this.points)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PointsEntryModel;
  return Object.hash(runtimeType,_this.points,_this.reason,_this.at,_this.orderNumber);
}

@override
String toString() {
  final _this = this as PointsEntryModel;
  return 'PointsEntryModel(points: ${_this.points}, reason: ${_this.reason}, at: ${_this.at}, orderNumber: ${_this.orderNumber})';
}


}

/// @nodoc
abstract mixin class $PointsEntryModelCopyWith<$Res>  {
  factory $PointsEntryModelCopyWith(PointsEntryModel value, $Res Function(PointsEntryModel) _then) = _$PointsEntryModelCopyWithImpl;
@useResult
$Res call({
 int points, PointsReason reason, DateTime at, String? orderNumber
});




}
/// @nodoc
class _$PointsEntryModelCopyWithImpl<$Res>
    implements $PointsEntryModelCopyWith<$Res> {
  _$PointsEntryModelCopyWithImpl(this._self, this._then);

  final PointsEntryModel _self;
  final $Res Function(PointsEntryModel) _then;

/// Create a copy of PointsEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? reason = null,Object? at = null,Object? orderNumber = freezed,}) {
  return _then(PointsEntryModel(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as PointsReason,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PointsEntryModel].
extension PointsEntryModelPatterns on PointsEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointsEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointsEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointsEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _PointsEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointsEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _PointsEntryModel() when $default != null:
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
case _PointsEntryModel() when $default != null:
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
case _PointsEntryModel():
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
case _PointsEntryModel() when $default != null:
return $default(_that.points,_that.reason,_that.at,_that.orderNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PointsEntryModel implements PointsEntryModel {
  const _PointsEntryModel({required this.points, required this.reason, required this.at, this.orderNumber});
  factory _PointsEntryModel.fromJson(Map<String, dynamic> json) => _$PointsEntryModelFromJson(json);

@override final  int points;
@override final  PointsReason reason;
@override final  DateTime at;
@override final  String? orderNumber;

/// Create a copy of PointsEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointsEntryModelCopyWith<_PointsEntryModel> get copyWith => __$PointsEntryModelCopyWithImpl<_PointsEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PointsEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointsEntryModel&&(identical(other.points, points) || other.points == points)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.at, at) || other.at == at)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,points,reason,at,orderNumber);
}

@override
String toString() {
    return 'PointsEntryModel(points: $points, reason: $reason, at: $at, orderNumber: $orderNumber)';
}


}

/// @nodoc
abstract mixin class _$PointsEntryModelCopyWith<$Res> implements $PointsEntryModelCopyWith<$Res> {
  factory _$PointsEntryModelCopyWith(_PointsEntryModel value, $Res Function(_PointsEntryModel) _then) = __$PointsEntryModelCopyWithImpl;
@override @useResult
$Res call({
 int points, PointsReason reason, DateTime at, String? orderNumber
});




}
/// @nodoc
class __$PointsEntryModelCopyWithImpl<$Res>
    implements _$PointsEntryModelCopyWith<$Res> {
  __$PointsEntryModelCopyWithImpl(this._self, this._then);

  final _PointsEntryModel _self;
  final $Res Function(_PointsEntryModel) _then;

/// Create a copy of PointsEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? reason = null,Object? at = null,Object? orderNumber = freezed,}) {
  return _then(_PointsEntryModel(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as PointsReason,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PointsAccountModel {

 int get balance; List<PointsEntryModel> get entries;
/// Create a copy of PointsAccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointsAccountModelCopyWith<PointsAccountModel> get copyWith => _$PointsAccountModelCopyWithImpl<PointsAccountModel>(this as PointsAccountModel, _$identity);

  /// Serializes this PointsAccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PointsAccountModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointsAccountModel&&(identical(other.balance, _this.balance) || other.balance == _this.balance)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PointsAccountModel;
  return Object.hash(runtimeType,_this.balance,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as PointsAccountModel;
  return 'PointsAccountModel(balance: ${_this.balance}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $PointsAccountModelCopyWith<$Res>  {
  factory $PointsAccountModelCopyWith(PointsAccountModel value, $Res Function(PointsAccountModel) _then) = _$PointsAccountModelCopyWithImpl;
@useResult
$Res call({
 int balance, List<PointsEntryModel> entries
});




}
/// @nodoc
class _$PointsAccountModelCopyWithImpl<$Res>
    implements $PointsAccountModelCopyWith<$Res> {
  _$PointsAccountModelCopyWithImpl(this._self, this._then);

  final PointsAccountModel _self;
  final $Res Function(PointsAccountModel) _then;

/// Create a copy of PointsAccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balance = null,Object? entries = null,}) {
  return _then(PointsAccountModel(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<PointsEntryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PointsAccountModel].
extension PointsAccountModelPatterns on PointsAccountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointsAccountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointsAccountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointsAccountModel value)  $default,){
final _that = this;
switch (_that) {
case _PointsAccountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointsAccountModel value)?  $default,){
final _that = this;
switch (_that) {
case _PointsAccountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int balance,  List<PointsEntryModel> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PointsAccountModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int balance,  List<PointsEntryModel> entries)  $default,) {final _that = this;
switch (_that) {
case _PointsAccountModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int balance,  List<PointsEntryModel> entries)?  $default,) {final _that = this;
switch (_that) {
case _PointsAccountModel() when $default != null:
return $default(_that.balance,_that.entries);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PointsAccountModel implements PointsAccountModel {
  const _PointsAccountModel({this.balance = 0,  List<PointsEntryModel> entries = const <PointsEntryModel>[]}): _entries = entries;
  factory _PointsAccountModel.fromJson(Map<String, dynamic> json) => _$PointsAccountModelFromJson(json);

@override@JsonKey() final  int balance;
 final  List<PointsEntryModel> _entries;
@override@JsonKey() List<PointsEntryModel> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of PointsAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointsAccountModelCopyWith<_PointsAccountModel> get copyWith => __$PointsAccountModelCopyWithImpl<_PointsAccountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PointsAccountModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointsAccountModel&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,balance,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'PointsAccountModel(balance: $balance, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$PointsAccountModelCopyWith<$Res> implements $PointsAccountModelCopyWith<$Res> {
  factory _$PointsAccountModelCopyWith(_PointsAccountModel value, $Res Function(_PointsAccountModel) _then) = __$PointsAccountModelCopyWithImpl;
@override @useResult
$Res call({
 int balance, List<PointsEntryModel> entries
});




}
/// @nodoc
class __$PointsAccountModelCopyWithImpl<$Res>
    implements _$PointsAccountModelCopyWith<$Res> {
  __$PointsAccountModelCopyWithImpl(this._self, this._then);

  final _PointsAccountModel _self;
  final $Res Function(_PointsAccountModel) _then;

/// Create a copy of PointsAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balance = null,Object? entries = null,}) {
  return _then(_PointsAccountModel(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<PointsEntryModel>,
  ));
}


}

// dart format on
