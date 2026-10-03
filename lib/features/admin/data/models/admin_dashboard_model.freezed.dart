// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminDashboardModel {

 int get ordersToday; int get salesTodayBdt; int get ordersToShip; int get listingsWaiting; int get openReports; int get openDisputes; List<Map<String, dynamic>> get topSearches; List<Map<String, dynamic>> get topRequested;
/// Create a copy of AdminDashboardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminDashboardModelCopyWith<AdminDashboardModel> get copyWith => _$AdminDashboardModelCopyWithImpl<AdminDashboardModel>(this as AdminDashboardModel, _$identity);

  /// Serializes this AdminDashboardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AdminDashboardModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminDashboardModel&&(identical(other.ordersToday, _this.ordersToday) || other.ordersToday == _this.ordersToday)&&(identical(other.salesTodayBdt, _this.salesTodayBdt) || other.salesTodayBdt == _this.salesTodayBdt)&&(identical(other.ordersToShip, _this.ordersToShip) || other.ordersToShip == _this.ordersToShip)&&(identical(other.listingsWaiting, _this.listingsWaiting) || other.listingsWaiting == _this.listingsWaiting)&&(identical(other.openReports, _this.openReports) || other.openReports == _this.openReports)&&(identical(other.openDisputes, _this.openDisputes) || other.openDisputes == _this.openDisputes)&&const DeepCollectionEquality().equals(other.topSearches, _this.topSearches)&&const DeepCollectionEquality().equals(other.topRequested, _this.topRequested));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AdminDashboardModel;
  return Object.hash(runtimeType,_this.ordersToday,_this.salesTodayBdt,_this.ordersToShip,_this.listingsWaiting,_this.openReports,_this.openDisputes,const DeepCollectionEquality().hash(_this.topSearches),const DeepCollectionEquality().hash(_this.topRequested));
}

@override
String toString() {
  final _this = this as AdminDashboardModel;
  return 'AdminDashboardModel(ordersToday: ${_this.ordersToday}, salesTodayBdt: ${_this.salesTodayBdt}, ordersToShip: ${_this.ordersToShip}, listingsWaiting: ${_this.listingsWaiting}, openReports: ${_this.openReports}, openDisputes: ${_this.openDisputes}, topSearches: ${_this.topSearches}, topRequested: ${_this.topRequested})';
}


}

/// @nodoc
abstract mixin class $AdminDashboardModelCopyWith<$Res>  {
  factory $AdminDashboardModelCopyWith(AdminDashboardModel value, $Res Function(AdminDashboardModel) _then) = _$AdminDashboardModelCopyWithImpl;
@useResult
$Res call({
 int ordersToday, int salesTodayBdt, int ordersToShip, int listingsWaiting, int openReports, int openDisputes, List<Map<String, dynamic>> topSearches, List<Map<String, dynamic>> topRequested
});




}
/// @nodoc
class _$AdminDashboardModelCopyWithImpl<$Res>
    implements $AdminDashboardModelCopyWith<$Res> {
  _$AdminDashboardModelCopyWithImpl(this._self, this._then);

  final AdminDashboardModel _self;
  final $Res Function(AdminDashboardModel) _then;

/// Create a copy of AdminDashboardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ordersToday = null,Object? salesTodayBdt = null,Object? ordersToShip = null,Object? listingsWaiting = null,Object? openReports = null,Object? openDisputes = null,Object? topSearches = null,Object? topRequested = null,}) {
  return _then(AdminDashboardModel(
ordersToday: null == ordersToday ? _self.ordersToday : ordersToday // ignore: cast_nullable_to_non_nullable
as int,salesTodayBdt: null == salesTodayBdt ? _self.salesTodayBdt : salesTodayBdt // ignore: cast_nullable_to_non_nullable
as int,ordersToShip: null == ordersToShip ? _self.ordersToShip : ordersToShip // ignore: cast_nullable_to_non_nullable
as int,listingsWaiting: null == listingsWaiting ? _self.listingsWaiting : listingsWaiting // ignore: cast_nullable_to_non_nullable
as int,openReports: null == openReports ? _self.openReports : openReports // ignore: cast_nullable_to_non_nullable
as int,openDisputes: null == openDisputes ? _self.openDisputes : openDisputes // ignore: cast_nullable_to_non_nullable
as int,topSearches: null == topSearches ? _self.topSearches : topSearches // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,topRequested: null == topRequested ? _self.topRequested : topRequested // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminDashboardModel].
extension AdminDashboardModelPatterns on AdminDashboardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminDashboardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminDashboardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminDashboardModel value)  $default,){
final _that = this;
switch (_that) {
case _AdminDashboardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminDashboardModel value)?  $default,){
final _that = this;
switch (_that) {
case _AdminDashboardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int ordersToday,  int salesTodayBdt,  int ordersToShip,  int listingsWaiting,  int openReports,  int openDisputes,  List<Map<String, dynamic>> topSearches,  List<Map<String, dynamic>> topRequested)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminDashboardModel() when $default != null:
return $default(_that.ordersToday,_that.salesTodayBdt,_that.ordersToShip,_that.listingsWaiting,_that.openReports,_that.openDisputes,_that.topSearches,_that.topRequested);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int ordersToday,  int salesTodayBdt,  int ordersToShip,  int listingsWaiting,  int openReports,  int openDisputes,  List<Map<String, dynamic>> topSearches,  List<Map<String, dynamic>> topRequested)  $default,) {final _that = this;
switch (_that) {
case _AdminDashboardModel():
return $default(_that.ordersToday,_that.salesTodayBdt,_that.ordersToShip,_that.listingsWaiting,_that.openReports,_that.openDisputes,_that.topSearches,_that.topRequested);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int ordersToday,  int salesTodayBdt,  int ordersToShip,  int listingsWaiting,  int openReports,  int openDisputes,  List<Map<String, dynamic>> topSearches,  List<Map<String, dynamic>> topRequested)?  $default,) {final _that = this;
switch (_that) {
case _AdminDashboardModel() when $default != null:
return $default(_that.ordersToday,_that.salesTodayBdt,_that.ordersToShip,_that.listingsWaiting,_that.openReports,_that.openDisputes,_that.topSearches,_that.topRequested);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminDashboardModel implements AdminDashboardModel {
  const _AdminDashboardModel({required this.ordersToday, required this.salesTodayBdt, required this.ordersToShip, required this.listingsWaiting, required this.openReports, required this.openDisputes, required  List<Map<String, dynamic>> topSearches, required  List<Map<String, dynamic>> topRequested}): _topSearches = topSearches,_topRequested = topRequested;
  factory _AdminDashboardModel.fromJson(Map<String, dynamic> json) => _$AdminDashboardModelFromJson(json);

@override final  int ordersToday;
@override final  int salesTodayBdt;
@override final  int ordersToShip;
@override final  int listingsWaiting;
@override final  int openReports;
@override final  int openDisputes;
 final  List<Map<String, dynamic>> _topSearches;
@override List<Map<String, dynamic>> get topSearches {
  if (_topSearches is EqualUnmodifiableListView) return _topSearches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSearches);
}

 final  List<Map<String, dynamic>> _topRequested;
@override List<Map<String, dynamic>> get topRequested {
  if (_topRequested is EqualUnmodifiableListView) return _topRequested;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topRequested);
}


/// Create a copy of AdminDashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminDashboardModelCopyWith<_AdminDashboardModel> get copyWith => __$AdminDashboardModelCopyWithImpl<_AdminDashboardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminDashboardModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminDashboardModel&&(identical(other.ordersToday, ordersToday) || other.ordersToday == ordersToday)&&(identical(other.salesTodayBdt, salesTodayBdt) || other.salesTodayBdt == salesTodayBdt)&&(identical(other.ordersToShip, ordersToShip) || other.ordersToShip == ordersToShip)&&(identical(other.listingsWaiting, listingsWaiting) || other.listingsWaiting == listingsWaiting)&&(identical(other.openReports, openReports) || other.openReports == openReports)&&(identical(other.openDisputes, openDisputes) || other.openDisputes == openDisputes)&&const DeepCollectionEquality().equals(other.topSearches, _topSearches)&&const DeepCollectionEquality().equals(other.topRequested, _topRequested));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,ordersToday,salesTodayBdt,ordersToShip,listingsWaiting,openReports,openDisputes,const DeepCollectionEquality().hash(_topSearches),const DeepCollectionEquality().hash(_topRequested));
}

@override
String toString() {
    return 'AdminDashboardModel(ordersToday: $ordersToday, salesTodayBdt: $salesTodayBdt, ordersToShip: $ordersToShip, listingsWaiting: $listingsWaiting, openReports: $openReports, openDisputes: $openDisputes, topSearches: $topSearches, topRequested: $topRequested)';
}


}

/// @nodoc
abstract mixin class _$AdminDashboardModelCopyWith<$Res> implements $AdminDashboardModelCopyWith<$Res> {
  factory _$AdminDashboardModelCopyWith(_AdminDashboardModel value, $Res Function(_AdminDashboardModel) _then) = __$AdminDashboardModelCopyWithImpl;
@override @useResult
$Res call({
 int ordersToday, int salesTodayBdt, int ordersToShip, int listingsWaiting, int openReports, int openDisputes, List<Map<String, dynamic>> topSearches, List<Map<String, dynamic>> topRequested
});




}
/// @nodoc
class __$AdminDashboardModelCopyWithImpl<$Res>
    implements _$AdminDashboardModelCopyWith<$Res> {
  __$AdminDashboardModelCopyWithImpl(this._self, this._then);

  final _AdminDashboardModel _self;
  final $Res Function(_AdminDashboardModel) _then;

/// Create a copy of AdminDashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ordersToday = null,Object? salesTodayBdt = null,Object? ordersToShip = null,Object? listingsWaiting = null,Object? openReports = null,Object? openDisputes = null,Object? topSearches = null,Object? topRequested = null,}) {
  return _then(_AdminDashboardModel(
ordersToday: null == ordersToday ? _self.ordersToday : ordersToday // ignore: cast_nullable_to_non_nullable
as int,salesTodayBdt: null == salesTodayBdt ? _self.salesTodayBdt : salesTodayBdt // ignore: cast_nullable_to_non_nullable
as int,ordersToShip: null == ordersToShip ? _self.ordersToShip : ordersToShip // ignore: cast_nullable_to_non_nullable
as int,listingsWaiting: null == listingsWaiting ? _self.listingsWaiting : listingsWaiting // ignore: cast_nullable_to_non_nullable
as int,openReports: null == openReports ? _self.openReports : openReports // ignore: cast_nullable_to_non_nullable
as int,openDisputes: null == openDisputes ? _self.openDisputes : openDisputes // ignore: cast_nullable_to_non_nullable
as int,topSearches: null == topSearches ? _self._topSearches : topSearches // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,topRequested: null == topRequested ? _self._topRequested : topRequested // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
