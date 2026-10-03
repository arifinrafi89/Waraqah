// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadingStatsModel {

 int get year; int? get goal; int get finishedThisYear; int get streakDays; bool get readToday; List<int> get perMonth; List<CategoryCountModel> get topCategories;
/// Create a copy of ReadingStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingStatsModelCopyWith<ReadingStatsModel> get copyWith => _$ReadingStatsModelCopyWithImpl<ReadingStatsModel>(this as ReadingStatsModel, _$identity);

  /// Serializes this ReadingStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReadingStatsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingStatsModel&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.goal, _this.goal) || other.goal == _this.goal)&&(identical(other.finishedThisYear, _this.finishedThisYear) || other.finishedThisYear == _this.finishedThisYear)&&(identical(other.streakDays, _this.streakDays) || other.streakDays == _this.streakDays)&&(identical(other.readToday, _this.readToday) || other.readToday == _this.readToday)&&const DeepCollectionEquality().equals(other.perMonth, _this.perMonth)&&const DeepCollectionEquality().equals(other.topCategories, _this.topCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReadingStatsModel;
  return Object.hash(runtimeType,_this.year,_this.goal,_this.finishedThisYear,_this.streakDays,_this.readToday,const DeepCollectionEquality().hash(_this.perMonth),const DeepCollectionEquality().hash(_this.topCategories));
}

@override
String toString() {
  final _this = this as ReadingStatsModel;
  return 'ReadingStatsModel(year: ${_this.year}, goal: ${_this.goal}, finishedThisYear: ${_this.finishedThisYear}, streakDays: ${_this.streakDays}, readToday: ${_this.readToday}, perMonth: ${_this.perMonth}, topCategories: ${_this.topCategories})';
}


}

/// @nodoc
abstract mixin class $ReadingStatsModelCopyWith<$Res>  {
  factory $ReadingStatsModelCopyWith(ReadingStatsModel value, $Res Function(ReadingStatsModel) _then) = _$ReadingStatsModelCopyWithImpl;
@useResult
$Res call({
 int year, int? goal, int finishedThisYear, int streakDays, bool readToday, List<int> perMonth, List<CategoryCountModel> topCategories
});




}
/// @nodoc
class _$ReadingStatsModelCopyWithImpl<$Res>
    implements $ReadingStatsModelCopyWith<$Res> {
  _$ReadingStatsModelCopyWithImpl(this._self, this._then);

  final ReadingStatsModel _self;
  final $Res Function(ReadingStatsModel) _then;

/// Create a copy of ReadingStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = null,Object? goal = freezed,Object? finishedThisYear = null,Object? streakDays = null,Object? readToday = null,Object? perMonth = null,Object? topCategories = null,}) {
  return _then(ReadingStatsModel(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int?,finishedThisYear: null == finishedThisYear ? _self.finishedThisYear : finishedThisYear // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,readToday: null == readToday ? _self.readToday : readToday // ignore: cast_nullable_to_non_nullable
as bool,perMonth: null == perMonth ? _self.perMonth : perMonth // ignore: cast_nullable_to_non_nullable
as List<int>,topCategories: null == topCategories ? _self.topCategories : topCategories // ignore: cast_nullable_to_non_nullable
as List<CategoryCountModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadingStatsModel].
extension ReadingStatsModelPatterns on ReadingStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadingStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadingStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadingStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _ReadingStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadingStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReadingStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int year,  int? goal,  int finishedThisYear,  int streakDays,  bool readToday,  List<int> perMonth,  List<CategoryCountModel> topCategories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadingStatsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int year,  int? goal,  int finishedThisYear,  int streakDays,  bool readToday,  List<int> perMonth,  List<CategoryCountModel> topCategories)  $default,) {final _that = this;
switch (_that) {
case _ReadingStatsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int year,  int? goal,  int finishedThisYear,  int streakDays,  bool readToday,  List<int> perMonth,  List<CategoryCountModel> topCategories)?  $default,) {final _that = this;
switch (_that) {
case _ReadingStatsModel() when $default != null:
return $default(_that.year,_that.goal,_that.finishedThisYear,_that.streakDays,_that.readToday,_that.perMonth,_that.topCategories);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ReadingStatsModel implements ReadingStatsModel {
  const _ReadingStatsModel({required this.year, this.goal, required this.finishedThisYear, required this.streakDays, required this.readToday, required  List<int> perMonth, required  List<CategoryCountModel> topCategories}): _perMonth = perMonth,_topCategories = topCategories;
  factory _ReadingStatsModel.fromJson(Map<String, dynamic> json) => _$ReadingStatsModelFromJson(json);

@override final  int year;
@override final  int? goal;
@override final  int finishedThisYear;
@override final  int streakDays;
@override final  bool readToday;
 final  List<int> _perMonth;
@override List<int> get perMonth {
  if (_perMonth is EqualUnmodifiableListView) return _perMonth;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_perMonth);
}

 final  List<CategoryCountModel> _topCategories;
@override List<CategoryCountModel> get topCategories {
  if (_topCategories is EqualUnmodifiableListView) return _topCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topCategories);
}


/// Create a copy of ReadingStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadingStatsModelCopyWith<_ReadingStatsModel> get copyWith => __$ReadingStatsModelCopyWithImpl<_ReadingStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadingStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadingStatsModel&&(identical(other.year, year) || other.year == year)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.finishedThisYear, finishedThisYear) || other.finishedThisYear == finishedThisYear)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.readToday, readToday) || other.readToday == readToday)&&const DeepCollectionEquality().equals(other.perMonth, _perMonth)&&const DeepCollectionEquality().equals(other.topCategories, _topCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,year,goal,finishedThisYear,streakDays,readToday,const DeepCollectionEquality().hash(_perMonth),const DeepCollectionEquality().hash(_topCategories));
}

@override
String toString() {
    return 'ReadingStatsModel(year: $year, goal: $goal, finishedThisYear: $finishedThisYear, streakDays: $streakDays, readToday: $readToday, perMonth: $perMonth, topCategories: $topCategories)';
}


}

/// @nodoc
abstract mixin class _$ReadingStatsModelCopyWith<$Res> implements $ReadingStatsModelCopyWith<$Res> {
  factory _$ReadingStatsModelCopyWith(_ReadingStatsModel value, $Res Function(_ReadingStatsModel) _then) = __$ReadingStatsModelCopyWithImpl;
@override @useResult
$Res call({
 int year, int? goal, int finishedThisYear, int streakDays, bool readToday, List<int> perMonth, List<CategoryCountModel> topCategories
});




}
/// @nodoc
class __$ReadingStatsModelCopyWithImpl<$Res>
    implements _$ReadingStatsModelCopyWith<$Res> {
  __$ReadingStatsModelCopyWithImpl(this._self, this._then);

  final _ReadingStatsModel _self;
  final $Res Function(_ReadingStatsModel) _then;

/// Create a copy of ReadingStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = null,Object? goal = freezed,Object? finishedThisYear = null,Object? streakDays = null,Object? readToday = null,Object? perMonth = null,Object? topCategories = null,}) {
  return _then(_ReadingStatsModel(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int?,finishedThisYear: null == finishedThisYear ? _self.finishedThisYear : finishedThisYear // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,readToday: null == readToday ? _self.readToday : readToday // ignore: cast_nullable_to_non_nullable
as bool,perMonth: null == perMonth ? _self._perMonth : perMonth // ignore: cast_nullable_to_non_nullable
as List<int>,topCategories: null == topCategories ? _self._topCategories : topCategories // ignore: cast_nullable_to_non_nullable
as List<CategoryCountModel>,
  ));
}


}


/// @nodoc
mixin _$CategoryCountModel {

 String get nameEn; String get nameBn; int get count;
/// Create a copy of CategoryCountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCountModelCopyWith<CategoryCountModel> get copyWith => _$CategoryCountModelCopyWithImpl<CategoryCountModel>(this as CategoryCountModel, _$identity);

  /// Serializes this CategoryCountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CategoryCountModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryCountModel&&(identical(other.nameEn, _this.nameEn) || other.nameEn == _this.nameEn)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn)&&(identical(other.count, _this.count) || other.count == _this.count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CategoryCountModel;
  return Object.hash(runtimeType,_this.nameEn,_this.nameBn,_this.count);
}

@override
String toString() {
  final _this = this as CategoryCountModel;
  return 'CategoryCountModel(nameEn: ${_this.nameEn}, nameBn: ${_this.nameBn}, count: ${_this.count})';
}


}

/// @nodoc
abstract mixin class $CategoryCountModelCopyWith<$Res>  {
  factory $CategoryCountModelCopyWith(CategoryCountModel value, $Res Function(CategoryCountModel) _then) = _$CategoryCountModelCopyWithImpl;
@useResult
$Res call({
 String nameEn, String nameBn, int count
});




}
/// @nodoc
class _$CategoryCountModelCopyWithImpl<$Res>
    implements $CategoryCountModelCopyWith<$Res> {
  _$CategoryCountModelCopyWithImpl(this._self, this._then);

  final CategoryCountModel _self;
  final $Res Function(CategoryCountModel) _then;

/// Create a copy of CategoryCountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nameEn = null,Object? nameBn = null,Object? count = null,}) {
  return _then(CategoryCountModel(
nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryCountModel].
extension CategoryCountModelPatterns on CategoryCountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryCountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryCountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryCountModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryCountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryCountModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryCountModel() when $default != null:
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
case _CategoryCountModel() when $default != null:
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
case _CategoryCountModel():
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
case _CategoryCountModel() when $default != null:
return $default(_that.nameEn,_that.nameBn,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryCountModel implements CategoryCountModel {
  const _CategoryCountModel({required this.nameEn, required this.nameBn, required this.count});
  factory _CategoryCountModel.fromJson(Map<String, dynamic> json) => _$CategoryCountModelFromJson(json);

@override final  String nameEn;
@override final  String nameBn;
@override final  int count;

/// Create a copy of CategoryCountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCountModelCopyWith<_CategoryCountModel> get copyWith => __$CategoryCountModelCopyWithImpl<_CategoryCountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryCountModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryCountModel&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,nameEn,nameBn,count);
}

@override
String toString() {
    return 'CategoryCountModel(nameEn: $nameEn, nameBn: $nameBn, count: $count)';
}


}

/// @nodoc
abstract mixin class _$CategoryCountModelCopyWith<$Res> implements $CategoryCountModelCopyWith<$Res> {
  factory _$CategoryCountModelCopyWith(_CategoryCountModel value, $Res Function(_CategoryCountModel) _then) = __$CategoryCountModelCopyWithImpl;
@override @useResult
$Res call({
 String nameEn, String nameBn, int count
});




}
/// @nodoc
class __$CategoryCountModelCopyWithImpl<$Res>
    implements _$CategoryCountModelCopyWith<$Res> {
  __$CategoryCountModelCopyWithImpl(this._self, this._then);

  final _CategoryCountModel _self;
  final $Res Function(_CategoryCountModel) _then;

/// Create a copy of CategoryCountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nameEn = null,Object? nameBn = null,Object? count = null,}) {
  return _then(_CategoryCountModel(
nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
