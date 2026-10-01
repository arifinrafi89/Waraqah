// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentReportModel {

 String get id; ReportTargetKind get kind; String get targetId; ReportReason get reason; DateTime get createdAt; ReportStatus get status; String? get note;
/// Create a copy of ContentReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentReportModelCopyWith<ContentReportModel> get copyWith => _$ContentReportModelCopyWithImpl<ContentReportModel>(this as ContentReportModel, _$identity);

  /// Serializes this ContentReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ContentReportModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentReportModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.targetId, _this.targetId) || other.targetId == _this.targetId)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ContentReportModel;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.targetId,_this.reason,_this.createdAt,_this.status,_this.note);
}

@override
String toString() {
  final _this = this as ContentReportModel;
  return 'ContentReportModel(id: ${_this.id}, kind: ${_this.kind}, targetId: ${_this.targetId}, reason: ${_this.reason}, createdAt: ${_this.createdAt}, status: ${_this.status}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ContentReportModelCopyWith<$Res>  {
  factory $ContentReportModelCopyWith(ContentReportModel value, $Res Function(ContentReportModel) _then) = _$ContentReportModelCopyWithImpl;
@useResult
$Res call({
 String id, ReportTargetKind kind, String targetId, ReportReason reason, DateTime createdAt, ReportStatus status, String? note
});




}
/// @nodoc
class _$ContentReportModelCopyWithImpl<$Res>
    implements $ContentReportModelCopyWith<$Res> {
  _$ContentReportModelCopyWithImpl(this._self, this._then);

  final ContentReportModel _self;
  final $Res Function(ContentReportModel) _then;

/// Create a copy of ContentReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? targetId = null,Object? reason = null,Object? createdAt = null,Object? status = null,Object? note = freezed,}) {
  return _then(ContentReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ReportTargetKind,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReportReason,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentReportModel].
extension ContentReportModelPatterns on ContentReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentReportModel value)  $default,){
final _that = this;
switch (_that) {
case _ContentReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContentReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ReportTargetKind kind,  String targetId,  ReportReason reason,  DateTime createdAt,  ReportStatus status,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentReportModel() when $default != null:
return $default(_that.id,_that.kind,_that.targetId,_that.reason,_that.createdAt,_that.status,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ReportTargetKind kind,  String targetId,  ReportReason reason,  DateTime createdAt,  ReportStatus status,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ContentReportModel():
return $default(_that.id,_that.kind,_that.targetId,_that.reason,_that.createdAt,_that.status,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ReportTargetKind kind,  String targetId,  ReportReason reason,  DateTime createdAt,  ReportStatus status,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ContentReportModel() when $default != null:
return $default(_that.id,_that.kind,_that.targetId,_that.reason,_that.createdAt,_that.status,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentReportModel implements ContentReportModel {
  const _ContentReportModel({required this.id, required this.kind, required this.targetId, required this.reason, required this.createdAt, this.status = ReportStatus.open, this.note});
  factory _ContentReportModel.fromJson(Map<String, dynamic> json) => _$ContentReportModelFromJson(json);

@override final  String id;
@override final  ReportTargetKind kind;
@override final  String targetId;
@override final  ReportReason reason;
@override final  DateTime createdAt;
@override@JsonKey() final  ReportStatus status;
@override final  String? note;

/// Create a copy of ContentReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentReportModelCopyWith<_ContentReportModel> get copyWith => __$ContentReportModelCopyWithImpl<_ContentReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,targetId,reason,createdAt,status,note);
}

@override
String toString() {
    return 'ContentReportModel(id: $id, kind: $kind, targetId: $targetId, reason: $reason, createdAt: $createdAt, status: $status, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ContentReportModelCopyWith<$Res> implements $ContentReportModelCopyWith<$Res> {
  factory _$ContentReportModelCopyWith(_ContentReportModel value, $Res Function(_ContentReportModel) _then) = __$ContentReportModelCopyWithImpl;
@override @useResult
$Res call({
 String id, ReportTargetKind kind, String targetId, ReportReason reason, DateTime createdAt, ReportStatus status, String? note
});




}
/// @nodoc
class __$ContentReportModelCopyWithImpl<$Res>
    implements _$ContentReportModelCopyWith<$Res> {
  __$ContentReportModelCopyWithImpl(this._self, this._then);

  final _ContentReportModel _self;
  final $Res Function(_ContentReportModel) _then;

/// Create a copy of ContentReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? targetId = null,Object? reason = null,Object? createdAt = null,Object? status = null,Object? note = freezed,}) {
  return _then(_ContentReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ReportTargetKind,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReportReason,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
