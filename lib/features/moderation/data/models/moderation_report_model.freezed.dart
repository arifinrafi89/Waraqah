// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moderation_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModerationReportModel {

 String get id; ReportTargetKind get kind; String get targetId; ReportReason get reason; DateTime get createdAt; String get preview; String get ownerId; String get ownerName; int get reportCount; int get ownerStrikes; bool get ownerBanned; String? get note;
/// Create a copy of ModerationReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModerationReportModelCopyWith<ModerationReportModel> get copyWith => _$ModerationReportModelCopyWithImpl<ModerationReportModel>(this as ModerationReportModel, _$identity);

  /// Serializes this ModerationReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ModerationReportModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModerationReportModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.targetId, _this.targetId) || other.targetId == _this.targetId)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.preview, _this.preview) || other.preview == _this.preview)&&(identical(other.ownerId, _this.ownerId) || other.ownerId == _this.ownerId)&&(identical(other.ownerName, _this.ownerName) || other.ownerName == _this.ownerName)&&(identical(other.reportCount, _this.reportCount) || other.reportCount == _this.reportCount)&&(identical(other.ownerStrikes, _this.ownerStrikes) || other.ownerStrikes == _this.ownerStrikes)&&(identical(other.ownerBanned, _this.ownerBanned) || other.ownerBanned == _this.ownerBanned)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ModerationReportModel;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.targetId,_this.reason,_this.createdAt,_this.preview,_this.ownerId,_this.ownerName,_this.reportCount,_this.ownerStrikes,_this.ownerBanned,_this.note);
}

@override
String toString() {
  final _this = this as ModerationReportModel;
  return 'ModerationReportModel(id: ${_this.id}, kind: ${_this.kind}, targetId: ${_this.targetId}, reason: ${_this.reason}, createdAt: ${_this.createdAt}, preview: ${_this.preview}, ownerId: ${_this.ownerId}, ownerName: ${_this.ownerName}, reportCount: ${_this.reportCount}, ownerStrikes: ${_this.ownerStrikes}, ownerBanned: ${_this.ownerBanned}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ModerationReportModelCopyWith<$Res>  {
  factory $ModerationReportModelCopyWith(ModerationReportModel value, $Res Function(ModerationReportModel) _then) = _$ModerationReportModelCopyWithImpl;
@useResult
$Res call({
 String id, ReportTargetKind kind, String targetId, ReportReason reason, DateTime createdAt, String preview, String ownerId, String ownerName, int reportCount, int ownerStrikes, bool ownerBanned, String? note
});




}
/// @nodoc
class _$ModerationReportModelCopyWithImpl<$Res>
    implements $ModerationReportModelCopyWith<$Res> {
  _$ModerationReportModelCopyWithImpl(this._self, this._then);

  final ModerationReportModel _self;
  final $Res Function(ModerationReportModel) _then;

/// Create a copy of ModerationReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? targetId = null,Object? reason = null,Object? createdAt = null,Object? preview = null,Object? ownerId = null,Object? ownerName = null,Object? reportCount = null,Object? ownerStrikes = null,Object? ownerBanned = null,Object? note = freezed,}) {
  return _then(ModerationReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ReportTargetKind,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
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

}


/// Adds pattern-matching-related methods to [ModerationReportModel].
extension ModerationReportModelPatterns on ModerationReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModerationReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModerationReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModerationReportModel value)  $default,){
final _that = this;
switch (_that) {
case _ModerationReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModerationReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _ModerationReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ReportTargetKind kind,  String targetId,  ReportReason reason,  DateTime createdAt,  String preview,  String ownerId,  String ownerName,  int reportCount,  int ownerStrikes,  bool ownerBanned,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModerationReportModel() when $default != null:
return $default(_that.id,_that.kind,_that.targetId,_that.reason,_that.createdAt,_that.preview,_that.ownerId,_that.ownerName,_that.reportCount,_that.ownerStrikes,_that.ownerBanned,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ReportTargetKind kind,  String targetId,  ReportReason reason,  DateTime createdAt,  String preview,  String ownerId,  String ownerName,  int reportCount,  int ownerStrikes,  bool ownerBanned,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ModerationReportModel():
return $default(_that.id,_that.kind,_that.targetId,_that.reason,_that.createdAt,_that.preview,_that.ownerId,_that.ownerName,_that.reportCount,_that.ownerStrikes,_that.ownerBanned,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ReportTargetKind kind,  String targetId,  ReportReason reason,  DateTime createdAt,  String preview,  String ownerId,  String ownerName,  int reportCount,  int ownerStrikes,  bool ownerBanned,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ModerationReportModel() when $default != null:
return $default(_that.id,_that.kind,_that.targetId,_that.reason,_that.createdAt,_that.preview,_that.ownerId,_that.ownerName,_that.reportCount,_that.ownerStrikes,_that.ownerBanned,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModerationReportModel implements ModerationReportModel {
  const _ModerationReportModel({required this.id, required this.kind, required this.targetId, required this.reason, required this.createdAt, required this.preview, required this.ownerId, required this.ownerName, this.reportCount = 1, this.ownerStrikes = 0, this.ownerBanned = false, this.note});
  factory _ModerationReportModel.fromJson(Map<String, dynamic> json) => _$ModerationReportModelFromJson(json);

@override final  String id;
@override final  ReportTargetKind kind;
@override final  String targetId;
@override final  ReportReason reason;
@override final  DateTime createdAt;
@override final  String preview;
@override final  String ownerId;
@override final  String ownerName;
@override@JsonKey() final  int reportCount;
@override@JsonKey() final  int ownerStrikes;
@override@JsonKey() final  bool ownerBanned;
@override final  String? note;

/// Create a copy of ModerationReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModerationReportModelCopyWith<_ModerationReportModel> get copyWith => __$ModerationReportModelCopyWithImpl<_ModerationReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModerationReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModerationReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.ownerStrikes, ownerStrikes) || other.ownerStrikes == ownerStrikes)&&(identical(other.ownerBanned, ownerBanned) || other.ownerBanned == ownerBanned)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,targetId,reason,createdAt,preview,ownerId,ownerName,reportCount,ownerStrikes,ownerBanned,note);
}

@override
String toString() {
    return 'ModerationReportModel(id: $id, kind: $kind, targetId: $targetId, reason: $reason, createdAt: $createdAt, preview: $preview, ownerId: $ownerId, ownerName: $ownerName, reportCount: $reportCount, ownerStrikes: $ownerStrikes, ownerBanned: $ownerBanned, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ModerationReportModelCopyWith<$Res> implements $ModerationReportModelCopyWith<$Res> {
  factory _$ModerationReportModelCopyWith(_ModerationReportModel value, $Res Function(_ModerationReportModel) _then) = __$ModerationReportModelCopyWithImpl;
@override @useResult
$Res call({
 String id, ReportTargetKind kind, String targetId, ReportReason reason, DateTime createdAt, String preview, String ownerId, String ownerName, int reportCount, int ownerStrikes, bool ownerBanned, String? note
});




}
/// @nodoc
class __$ModerationReportModelCopyWithImpl<$Res>
    implements _$ModerationReportModelCopyWith<$Res> {
  __$ModerationReportModelCopyWithImpl(this._self, this._then);

  final _ModerationReportModel _self;
  final $Res Function(_ModerationReportModel) _then;

/// Create a copy of ModerationReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? targetId = null,Object? reason = null,Object? createdAt = null,Object? preview = null,Object? ownerId = null,Object? ownerName = null,Object? reportCount = null,Object? ownerStrikes = null,Object? ownerBanned = null,Object? note = freezed,}) {
  return _then(_ModerationReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ReportTargetKind,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
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


}

// dart format on
