// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moderation_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModerationReport {

/// The oldest open report; acting on it ends them all.
 String get id; ReportTarget get target; ReportReason get reason; DateTime get createdAt;/// The reported words, title or name.
 String get preview; String get ownerId; String get ownerName; int get reportCount; int get ownerStrikes; bool get ownerBanned; String? get note;
/// Create a copy of ModerationReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModerationReportCopyWith<ModerationReport> get copyWith => _$ModerationReportCopyWithImpl<ModerationReport>(this as ModerationReport, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ModerationReport;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModerationReport&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.preview, _this.preview) || other.preview == _this.preview)&&(identical(other.ownerId, _this.ownerId) || other.ownerId == _this.ownerId)&&(identical(other.ownerName, _this.ownerName) || other.ownerName == _this.ownerName)&&(identical(other.reportCount, _this.reportCount) || other.reportCount == _this.reportCount)&&(identical(other.ownerStrikes, _this.ownerStrikes) || other.ownerStrikes == _this.ownerStrikes)&&(identical(other.ownerBanned, _this.ownerBanned) || other.ownerBanned == _this.ownerBanned)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as ModerationReport;
  return Object.hash(runtimeType,_this.id,_this.target,_this.reason,_this.createdAt,_this.preview,_this.ownerId,_this.ownerName,_this.reportCount,_this.ownerStrikes,_this.ownerBanned,_this.note);
}

@override
String toString() {
  final _this = this as ModerationReport;
  return 'ModerationReport(id: ${_this.id}, target: ${_this.target}, reason: ${_this.reason}, createdAt: ${_this.createdAt}, preview: ${_this.preview}, ownerId: ${_this.ownerId}, ownerName: ${_this.ownerName}, reportCount: ${_this.reportCount}, ownerStrikes: ${_this.ownerStrikes}, ownerBanned: ${_this.ownerBanned}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ModerationReportCopyWith<$Res>  {
  factory $ModerationReportCopyWith(ModerationReport value, $Res Function(ModerationReport) _then) = _$ModerationReportCopyWithImpl;
@useResult
$Res call({
 String id, ReportTarget target, ReportReason reason, DateTime createdAt, String preview, String ownerId, String ownerName, int reportCount, int ownerStrikes, bool ownerBanned, String? note
});


$ReportTargetCopyWith<$Res> get target;

}
/// @nodoc
class _$ModerationReportCopyWithImpl<$Res>
    implements $ModerationReportCopyWith<$Res> {
  _$ModerationReportCopyWithImpl(this._self, this._then);

  final ModerationReport _self;
  final $Res Function(ModerationReport) _then;

/// Create a copy of ModerationReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? target = null,Object? reason = null,Object? createdAt = null,Object? preview = null,Object? ownerId = null,Object? ownerName = null,Object? reportCount = null,Object? ownerStrikes = null,Object? ownerBanned = null,Object? note = freezed,}) {
  return _then(ModerationReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as ReportTarget,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReportReason,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,reportCount: null == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int,ownerStrikes: null == ownerStrikes ? _self.ownerStrikes : ownerStrikes // ignore: cast_nullable_to_non_nullable
as int,ownerBanned: null == ownerBanned ? _self.ownerBanned : ownerBanned // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ModerationReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportTargetCopyWith<$Res> get target {
  
  return $ReportTargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModerationReport].
extension ModerationReportPatterns on ModerationReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModerationReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModerationReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModerationReport value)  $default,){
final _that = this;
switch (_that) {
case _ModerationReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModerationReport value)?  $default,){
final _that = this;
switch (_that) {
case _ModerationReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ReportTarget target,  ReportReason reason,  DateTime createdAt,  String preview,  String ownerId,  String ownerName,  int reportCount,  int ownerStrikes,  bool ownerBanned,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModerationReport() when $default != null:
return $default(_that.id,_that.target,_that.reason,_that.createdAt,_that.preview,_that.ownerId,_that.ownerName,_that.reportCount,_that.ownerStrikes,_that.ownerBanned,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ReportTarget target,  ReportReason reason,  DateTime createdAt,  String preview,  String ownerId,  String ownerName,  int reportCount,  int ownerStrikes,  bool ownerBanned,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ModerationReport():
return $default(_that.id,_that.target,_that.reason,_that.createdAt,_that.preview,_that.ownerId,_that.ownerName,_that.reportCount,_that.ownerStrikes,_that.ownerBanned,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ReportTarget target,  ReportReason reason,  DateTime createdAt,  String preview,  String ownerId,  String ownerName,  int reportCount,  int ownerStrikes,  bool ownerBanned,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ModerationReport() when $default != null:
return $default(_that.id,_that.target,_that.reason,_that.createdAt,_that.preview,_that.ownerId,_that.ownerName,_that.reportCount,_that.ownerStrikes,_that.ownerBanned,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _ModerationReport implements ModerationReport {
  const _ModerationReport({required this.id, required this.target, required this.reason, required this.createdAt, required this.preview, required this.ownerId, required this.ownerName, this.reportCount = 1, this.ownerStrikes = 0, this.ownerBanned = false, this.note});
  

/// The oldest open report; acting on it ends them all.
@override final  String id;
@override final  ReportTarget target;
@override final  ReportReason reason;
@override final  DateTime createdAt;
/// The reported words, title or name.
@override final  String preview;
@override final  String ownerId;
@override final  String ownerName;
@override@JsonKey() final  int reportCount;
@override@JsonKey() final  int ownerStrikes;
@override@JsonKey() final  bool ownerBanned;
@override final  String? note;

/// Create a copy of ModerationReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModerationReportCopyWith<_ModerationReport> get copyWith => __$ModerationReportCopyWithImpl<_ModerationReport>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModerationReport&&(identical(other.id, id) || other.id == id)&&(identical(other.target, target) || other.target == target)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.ownerStrikes, ownerStrikes) || other.ownerStrikes == ownerStrikes)&&(identical(other.ownerBanned, ownerBanned) || other.ownerBanned == ownerBanned)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,target,reason,createdAt,preview,ownerId,ownerName,reportCount,ownerStrikes,ownerBanned,note);
}

@override
String toString() {
    return 'ModerationReport(id: $id, target: $target, reason: $reason, createdAt: $createdAt, preview: $preview, ownerId: $ownerId, ownerName: $ownerName, reportCount: $reportCount, ownerStrikes: $ownerStrikes, ownerBanned: $ownerBanned, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ModerationReportCopyWith<$Res> implements $ModerationReportCopyWith<$Res> {
  factory _$ModerationReportCopyWith(_ModerationReport value, $Res Function(_ModerationReport) _then) = __$ModerationReportCopyWithImpl;
@override @useResult
$Res call({
 String id, ReportTarget target, ReportReason reason, DateTime createdAt, String preview, String ownerId, String ownerName, int reportCount, int ownerStrikes, bool ownerBanned, String? note
});


@override $ReportTargetCopyWith<$Res> get target;

}
/// @nodoc
class __$ModerationReportCopyWithImpl<$Res>
    implements _$ModerationReportCopyWith<$Res> {
  __$ModerationReportCopyWithImpl(this._self, this._then);

  final _ModerationReport _self;
  final $Res Function(_ModerationReport) _then;

/// Create a copy of ModerationReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? target = null,Object? reason = null,Object? createdAt = null,Object? preview = null,Object? ownerId = null,Object? ownerName = null,Object? reportCount = null,Object? ownerStrikes = null,Object? ownerBanned = null,Object? note = freezed,}) {
  return _then(_ModerationReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as ReportTarget,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReportReason,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,reportCount: null == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int,ownerStrikes: null == ownerStrikes ? _self.ownerStrikes : ownerStrikes // ignore: cast_nullable_to_non_nullable
as int,ownerBanned: null == ownerBanned ? _self.ownerBanned : ownerBanned // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ModerationReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportTargetCopyWith<$Res> get target {
  
  return $ReportTargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}

// dart format on
