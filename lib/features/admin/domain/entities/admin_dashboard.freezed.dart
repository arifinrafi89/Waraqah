// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminDashboard {

 int get ordersToday; int get salesTodayBdt;/// Placed, confirmed or packed: not shipped yet.
 int get ordersToShip; int get listingsWaiting; int get openReports; int get openDisputes; List<SearchCount> get topSearches; List<RequestCount> get topRequested;
/// Create a copy of AdminDashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminDashboardCopyWith<AdminDashboard> get copyWith => _$AdminDashboardCopyWithImpl<AdminDashboard>(this as AdminDashboard, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AdminDashboard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminDashboard&&(identical(other.ordersToday, _this.ordersToday) || other.ordersToday == _this.ordersToday)&&(identical(other.salesTodayBdt, _this.salesTodayBdt) || other.salesTodayBdt == _this.salesTodayBdt)&&(identical(other.ordersToShip, _this.ordersToShip) || other.ordersToShip == _this.ordersToShip)&&(identical(other.listingsWaiting, _this.listingsWaiting) || other.listingsWaiting == _this.listingsWaiting)&&(identical(other.openReports, _this.openReports) || other.openReports == _this.openReports)&&(identical(other.openDisputes, _this.openDisputes) || other.openDisputes == _this.openDisputes)&&const DeepCollectionEquality().equals(other.topSearches, _this.topSearches)&&const DeepCollectionEquality().equals(other.topRequested, _this.topRequested));
}


@override
int get hashCode {
  final _this = this as AdminDashboard;
  return Object.hash(runtimeType,_this.ordersToday,_this.salesTodayBdt,_this.ordersToShip,_this.listingsWaiting,_this.openReports,_this.openDisputes,const DeepCollectionEquality().hash(_this.topSearches),const DeepCollectionEquality().hash(_this.topRequested));
}

@override
String toString() {
  final _this = this as AdminDashboard;
  return 'AdminDashboard(ordersToday: ${_this.ordersToday}, salesTodayBdt: ${_this.salesTodayBdt}, ordersToShip: ${_this.ordersToShip}, listingsWaiting: ${_this.listingsWaiting}, openReports: ${_this.openReports}, openDisputes: ${_this.openDisputes}, topSearches: ${_this.topSearches}, topRequested: ${_this.topRequested})';
}


}

/// @nodoc
abstract mixin class $AdminDashboardCopyWith<$Res>  {
  factory $AdminDashboardCopyWith(AdminDashboard value, $Res Function(AdminDashboard) _then) = _$AdminDashboardCopyWithImpl;
@useResult
$Res call({
 int ordersToday, int salesTodayBdt, int ordersToShip, int listingsWaiting, int openReports, int openDisputes, List<SearchCount> topSearches, List<RequestCount> topRequested
});




}
/// @nodoc
class _$AdminDashboardCopyWithImpl<$Res>
    implements $AdminDashboardCopyWith<$Res> {
  _$AdminDashboardCopyWithImpl(this._self, this._then);

  final AdminDashboard _self;
  final $Res Function(AdminDashboard) _then;

/// Create a copy of AdminDashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ordersToday = null,Object? salesTodayBdt = null,Object? ordersToShip = null,Object? listingsWaiting = null,Object? openReports = null,Object? openDisputes = null,Object? topSearches = null,Object? topRequested = null,}) {
  return _then(AdminDashboard(
ordersToday: null == ordersToday ? _self.ordersToday : ordersToday // ignore: cast_nullable_to_non_nullable
as int,salesTodayBdt: null == salesTodayBdt ? _self.salesTodayBdt : salesTodayBdt // ignore: cast_nullable_to_non_nullable
as int,ordersToShip: null == ordersToShip ? _self.ordersToShip : ordersToShip // ignore: cast_nullable_to_non_nullable
as int,listingsWaiting: null == listingsWaiting ? _self.listingsWaiting : listingsWaiting // ignore: cast_nullable_to_non_nullable
as int,openReports: null == openReports ? _self.openReports : openReports // ignore: cast_nullable_to_non_nullable
as int,openDisputes: null == openDisputes ? _self.openDisputes : openDisputes // ignore: cast_nullable_to_non_nullable
as int,topSearches: null == topSearches ? _self.topSearches : topSearches // ignore: cast_nullable_to_non_nullable
as List<SearchCount>,topRequested: null == topRequested ? _self.topRequested : topRequested // ignore: cast_nullable_to_non_nullable
as List<RequestCount>,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminDashboard].
extension AdminDashboardPatterns on AdminDashboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminDashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminDashboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminDashboard value)  $default,){
final _that = this;
switch (_that) {
case _AdminDashboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminDashboard value)?  $default,){
final _that = this;
switch (_that) {
case _AdminDashboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int ordersToday,  int salesTodayBdt,  int ordersToShip,  int listingsWaiting,  int openReports,  int openDisputes,  List<SearchCount> topSearches,  List<RequestCount> topRequested)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminDashboard() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int ordersToday,  int salesTodayBdt,  int ordersToShip,  int listingsWaiting,  int openReports,  int openDisputes,  List<SearchCount> topSearches,  List<RequestCount> topRequested)  $default,) {final _that = this;
switch (_that) {
case _AdminDashboard():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int ordersToday,  int salesTodayBdt,  int ordersToShip,  int listingsWaiting,  int openReports,  int openDisputes,  List<SearchCount> topSearches,  List<RequestCount> topRequested)?  $default,) {final _that = this;
switch (_that) {
case _AdminDashboard() when $default != null:
return $default(_that.ordersToday,_that.salesTodayBdt,_that.ordersToShip,_that.listingsWaiting,_that.openReports,_that.openDisputes,_that.topSearches,_that.topRequested);case _:
  return null;

}
}

}

/// @nodoc


class _AdminDashboard implements AdminDashboard {
  const _AdminDashboard({required this.ordersToday, required this.salesTodayBdt, required this.ordersToShip, required this.listingsWaiting, required this.openReports, required this.openDisputes, required  List<SearchCount> topSearches, required  List<RequestCount> topRequested}): _topSearches = topSearches,_topRequested = topRequested;
  

@override final  int ordersToday;
@override final  int salesTodayBdt;
/// Placed, confirmed or packed: not shipped yet.
@override final  int ordersToShip;
@override final  int listingsWaiting;
@override final  int openReports;
@override final  int openDisputes;
 final  List<SearchCount> _topSearches;
@override List<SearchCount> get topSearches {
  if (_topSearches is EqualUnmodifiableListView) return _topSearches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSearches);
}

 final  List<RequestCount> _topRequested;
@override List<RequestCount> get topRequested {
  if (_topRequested is EqualUnmodifiableListView) return _topRequested;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topRequested);
}


/// Create a copy of AdminDashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminDashboardCopyWith<_AdminDashboard> get copyWith => __$AdminDashboardCopyWithImpl<_AdminDashboard>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminDashboard&&(identical(other.ordersToday, ordersToday) || other.ordersToday == ordersToday)&&(identical(other.salesTodayBdt, salesTodayBdt) || other.salesTodayBdt == salesTodayBdt)&&(identical(other.ordersToShip, ordersToShip) || other.ordersToShip == ordersToShip)&&(identical(other.listingsWaiting, listingsWaiting) || other.listingsWaiting == listingsWaiting)&&(identical(other.openReports, openReports) || other.openReports == openReports)&&(identical(other.openDisputes, openDisputes) || other.openDisputes == openDisputes)&&const DeepCollectionEquality().equals(other.topSearches, _topSearches)&&const DeepCollectionEquality().equals(other.topRequested, _topRequested));
}


@override
int get hashCode {
    return Object.hash(runtimeType,ordersToday,salesTodayBdt,ordersToShip,listingsWaiting,openReports,openDisputes,const DeepCollectionEquality().hash(_topSearches),const DeepCollectionEquality().hash(_topRequested));
}

@override
String toString() {
    return 'AdminDashboard(ordersToday: $ordersToday, salesTodayBdt: $salesTodayBdt, ordersToShip: $ordersToShip, listingsWaiting: $listingsWaiting, openReports: $openReports, openDisputes: $openDisputes, topSearches: $topSearches, topRequested: $topRequested)';
}


}

/// @nodoc
abstract mixin class _$AdminDashboardCopyWith<$Res> implements $AdminDashboardCopyWith<$Res> {
  factory _$AdminDashboardCopyWith(_AdminDashboard value, $Res Function(_AdminDashboard) _then) = __$AdminDashboardCopyWithImpl;
@override @useResult
$Res call({
 int ordersToday, int salesTodayBdt, int ordersToShip, int listingsWaiting, int openReports, int openDisputes, List<SearchCount> topSearches, List<RequestCount> topRequested
});




}
/// @nodoc
class __$AdminDashboardCopyWithImpl<$Res>
    implements _$AdminDashboardCopyWith<$Res> {
  __$AdminDashboardCopyWithImpl(this._self, this._then);

  final _AdminDashboard _self;
  final $Res Function(_AdminDashboard) _then;

/// Create a copy of AdminDashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ordersToday = null,Object? salesTodayBdt = null,Object? ordersToShip = null,Object? listingsWaiting = null,Object? openReports = null,Object? openDisputes = null,Object? topSearches = null,Object? topRequested = null,}) {
  return _then(_AdminDashboard(
ordersToday: null == ordersToday ? _self.ordersToday : ordersToday // ignore: cast_nullable_to_non_nullable
as int,salesTodayBdt: null == salesTodayBdt ? _self.salesTodayBdt : salesTodayBdt // ignore: cast_nullable_to_non_nullable
as int,ordersToShip: null == ordersToShip ? _self.ordersToShip : ordersToShip // ignore: cast_nullable_to_non_nullable
as int,listingsWaiting: null == listingsWaiting ? _self.listingsWaiting : listingsWaiting // ignore: cast_nullable_to_non_nullable
as int,openReports: null == openReports ? _self.openReports : openReports // ignore: cast_nullable_to_non_nullable
as int,openDisputes: null == openDisputes ? _self.openDisputes : openDisputes // ignore: cast_nullable_to_non_nullable
as int,topSearches: null == topSearches ? _self._topSearches : topSearches // ignore: cast_nullable_to_non_nullable
as List<SearchCount>,topRequested: null == topRequested ? _self._topRequested : topRequested // ignore: cast_nullable_to_non_nullable
as List<RequestCount>,
  ));
}


}

// dart format on
