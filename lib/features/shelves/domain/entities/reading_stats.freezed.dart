// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReadingStats {

 int get year; int? get goal; int get finishedThisYear; int get streakDays; bool get readToday;/// Books finished in each month of [year], January first.
 List<int> get perMonth; List<CategoryCount> get topCategories;
/// Create a copy of ReadingStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingStatsCopyWith<ReadingStats> get copyWith => _$ReadingStatsCopyWithImpl<ReadingStats>(this as ReadingStats, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReadingStats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingStats&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.goal, _this.goal) || other.goal == _this.goal)&&(identical(other.finishedThisYear, _this.finishedThisYear) || other.finishedThisYear == _this.finishedThisYear)&&(identical(other.streakDays, _this.streakDays) || other.streakDays == _this.streakDays)&&(identical(other.readToday, _this.readToday) || other.readToday == _this.readToday)&&const DeepCollectionEquality().equals(other.perMonth, _this.perMonth)&&const DeepCollectionEquality().equals(other.topCategories, _this.topCategories));
}


@override
int get hashCode {
  final _this = this as ReadingStats;
  return Object.hash(runtimeType,_this.year,_this.goal,_this.finishedThisYear,_this.streakDays,_this.readToday,const DeepCollectionEquality().hash(_this.perMonth),const DeepCollectionEquality().hash(_this.topCategories));
}

@override
String toString() {
  final _this = this as ReadingStats;
  return 'ReadingStats(year: ${_this.year}, goal: ${_this.goal}, finishedThisYear: ${_this.finishedThisYear}, streakDays: ${_this.streakDays}, readToday: ${_this.readToday}, perMonth: ${_this.perMonth}, topCategories: ${_this.topCategories})';
}


}

/// @nodoc
abstract mixin class $ReadingStatsCopyWith<$Res>  {
  factory $ReadingStatsCopyWith(ReadingStats value, $Res Function(ReadingStats) _then) = _$ReadingStatsCopyWithImpl;
@useResult
$Res call({
 int year, int? goal, int finishedThisYear, int streakDays, bool readToday, List<int> perMonth, List<CategoryCount> topCategories
});




}
/// @nodoc
class _$ReadingStatsCopyWithImpl<$Res>
    implements $ReadingStatsCopyWith<$Res> {
  _$ReadingStatsCopyWithImpl(this._self, this._then);

  final ReadingStats _self;
  final $Res Function(ReadingStats) _then;

/// Create a copy of ReadingStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = null,Object? goal = freezed,Object? finishedThisYear = null,Object? streakDays = null,Object? readToday = null,Object? perMonth = null,Object? topCategories = null,}) {
  return _then(ReadingStats(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int?,finishedThisYear: null == finishedThisYear ? _self.finishedThisYear : finishedThisYear // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,readToday: null == readToday ? _self.readToday : readToday // ignore: cast_nullable_to_non_nullable
as bool,perMonth: null == perMonth ? _self.perMonth : perMonth // ignore: cast_nullable_to_non_nullable
as List<int>,topCategories: null == topCategories ? _self.topCategories : topCategories // ignore: cast_nullable_to_non_nullable
as List<CategoryCount>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadingStats].
extension ReadingStatsPatterns on ReadingStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadingStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadingStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadingStats value)  $default,){
final _that = this;
switch (_that) {
case _ReadingStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadingStats value)?  $default,){
final _that = this;
switch (_that) {
case _ReadingStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int year,  int? goal,  int finishedThisYear,  int streakDays,  bool readToday,  List<int> perMonth,  List<CategoryCount> topCategories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadingStats() when $default != null:
return $default(_that.year,_that.goal,_that.finishedThisYear,_that.streakDays,_that.readToday,_that.perMonth,_that.topCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int year,  int? goal,  int finishedThisYear,  int streakDays,  bool readToday,  List<int> perMonth,  List<CategoryCount> topCategories)  $default,) {final _that = this;
switch (_that) {
case _ReadingStats():
return $default(_that.year,_that.goal,_that.finishedThisYear,_that.streakDays,_that.readToday,_that.perMonth,_that.topCategories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int year,  int? goal,  int finishedThisYear,  int streakDays,  bool readToday,  List<int> perMonth,  List<CategoryCount> topCategories)?  $default,) {final _that = this;
switch (_that) {
case _ReadingStats() when $default != null:
return $default(_that.year,_that.goal,_that.finishedThisYear,_that.streakDays,_that.readToday,_that.perMonth,_that.topCategories);case _:
  return null;

}
}

}

/// @nodoc


class _ReadingStats implements ReadingStats {
  const _ReadingStats({required this.year, this.goal, required this.finishedThisYear, required this.streakDays, required this.readToday, required  List<int> perMonth, required  List<CategoryCount> topCategories}): _perMonth = perMonth,_topCategories = topCategories;
  

@override final  int year;
@override final  int? goal;
@override final  int finishedThisYear;
@override final  int streakDays;
@override final  bool readToday;
/// Books finished in each month of [year], January first.
 final  List<int> _perMonth;
/// Books finished in each month of [year], January first.
@override List<int> get perMonth {
  if (_perMonth is EqualUnmodifiableListView) return _perMonth;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_perMonth);
}

 final  List<CategoryCount> _topCategories;
@override List<CategoryCount> get topCategories {
  if (_topCategories is EqualUnmodifiableListView) return _topCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topCategories);
}


/// Create a copy of ReadingStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadingStatsCopyWith<_ReadingStats> get copyWith => __$ReadingStatsCopyWithImpl<_ReadingStats>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadingStats&&(identical(other.year, year) || other.year == year)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.finishedThisYear, finishedThisYear) || other.finishedThisYear == finishedThisYear)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.readToday, readToday) || other.readToday == readToday)&&const DeepCollectionEquality().equals(other.perMonth, _perMonth)&&const DeepCollectionEquality().equals(other.topCategories, _topCategories));
}


@override
int get hashCode {
    return Object.hash(runtimeType,year,goal,finishedThisYear,streakDays,readToday,const DeepCollectionEquality().hash(_perMonth),const DeepCollectionEquality().hash(_topCategories));
}

@override
String toString() {
    return 'ReadingStats(year: $year, goal: $goal, finishedThisYear: $finishedThisYear, streakDays: $streakDays, readToday: $readToday, perMonth: $perMonth, topCategories: $topCategories)';
}


}

/// @nodoc
abstract mixin class _$ReadingStatsCopyWith<$Res> implements $ReadingStatsCopyWith<$Res> {
  factory _$ReadingStatsCopyWith(_ReadingStats value, $Res Function(_ReadingStats) _then) = __$ReadingStatsCopyWithImpl;
@override @useResult
$Res call({
 int year, int? goal, int finishedThisYear, int streakDays, bool readToday, List<int> perMonth, List<CategoryCount> topCategories
});




}
/// @nodoc
class __$ReadingStatsCopyWithImpl<$Res>
    implements _$ReadingStatsCopyWith<$Res> {
  __$ReadingStatsCopyWithImpl(this._self, this._then);

  final _ReadingStats _self;
  final $Res Function(_ReadingStats) _then;

/// Create a copy of ReadingStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = null,Object? goal = freezed,Object? finishedThisYear = null,Object? streakDays = null,Object? readToday = null,Object? perMonth = null,Object? topCategories = null,}) {
  return _then(_ReadingStats(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int?,finishedThisYear: null == finishedThisYear ? _self.finishedThisYear : finishedThisYear // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,readToday: null == readToday ? _self.readToday : readToday // ignore: cast_nullable_to_non_nullable
as bool,perMonth: null == perMonth ? _self._perMonth : perMonth // ignore: cast_nullable_to_non_nullable
as List<int>,topCategories: null == topCategories ? _self._topCategories : topCategories // ignore: cast_nullable_to_non_nullable
as List<CategoryCount>,
  ));
}


}

/// @nodoc
mixin _$CategoryCount {

 String get nameEn; String get nameBn; int get count;
/// Create a copy of CategoryCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCountCopyWith<CategoryCount> get copyWith => _$CategoryCountCopyWithImpl<CategoryCount>(this as CategoryCount, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CategoryCount;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryCount&&(identical(other.nameEn, _this.nameEn) || other.nameEn == _this.nameEn)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn)&&(identical(other.count, _this.count) || other.count == _this.count));
}


@override
int get hashCode {
  final _this = this as CategoryCount;
  return Object.hash(runtimeType,_this.nameEn,_this.nameBn,_this.count);
}

@override
String toString() {
  final _this = this as CategoryCount;
  return 'CategoryCount(nameEn: ${_this.nameEn}, nameBn: ${_this.nameBn}, count: ${_this.count})';
}


}

/// @nodoc
abstract mixin class $CategoryCountCopyWith<$Res>  {
  factory $CategoryCountCopyWith(CategoryCount value, $Res Function(CategoryCount) _then) = _$CategoryCountCopyWithImpl;
@useResult
$Res call({
 String nameEn, String nameBn, int count
});




}
/// @nodoc
class _$CategoryCountCopyWithImpl<$Res>
    implements $CategoryCountCopyWith<$Res> {
  _$CategoryCountCopyWithImpl(this._self, this._then);

  final CategoryCount _self;
  final $Res Function(CategoryCount) _then;

/// Create a copy of CategoryCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nameEn = null,Object? nameBn = null,Object? count = null,}) {
  return _then(CategoryCount(
nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryCount].
extension CategoryCountPatterns on CategoryCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryCount value)  $default,){
final _that = this;
switch (_that) {
case _CategoryCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryCount value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nameEn,  String nameBn,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryCount() when $default != null:
return $default(_that.nameEn,_that.nameBn,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nameEn,  String nameBn,  int count)  $default,) {final _that = this;
switch (_that) {
case _CategoryCount():
return $default(_that.nameEn,_that.nameBn,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nameEn,  String nameBn,  int count)?  $default,) {final _that = this;
switch (_that) {
case _CategoryCount() when $default != null:
return $default(_that.nameEn,_that.nameBn,_that.count);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryCount implements CategoryCount {
  const _CategoryCount({required this.nameEn, required this.nameBn, required this.count});
  

@override final  String nameEn;
@override final  String nameBn;
@override final  int count;

/// Create a copy of CategoryCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCountCopyWith<_CategoryCount> get copyWith => __$CategoryCountCopyWithImpl<_CategoryCount>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryCount&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nameEn,nameBn,count);
}

@override
String toString() {
    return 'CategoryCount(nameEn: $nameEn, nameBn: $nameBn, count: $count)';
}


}

/// @nodoc
abstract mixin class _$CategoryCountCopyWith<$Res> implements $CategoryCountCopyWith<$Res> {
  factory _$CategoryCountCopyWith(_CategoryCount value, $Res Function(_CategoryCount) _then) = __$CategoryCountCopyWithImpl;
@override @useResult
$Res call({
 String nameEn, String nameBn, int count
});




}
/// @nodoc
class __$CategoryCountCopyWithImpl<$Res>
    implements _$CategoryCountCopyWith<$Res> {
  __$CategoryCountCopyWithImpl(this._self, this._then);

  final _CategoryCount _self;
  final $Res Function(_CategoryCount) _then;

/// Create a copy of CategoryCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nameEn = null,Object? nameBn = null,Object? count = null,}) {
  return _then(_CategoryCount(
nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
