// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportTarget {

 ReportTargetKind get kind; String get id;
/// Create a copy of ReportTarget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportTargetCopyWith<ReportTarget> get copyWith => _$ReportTargetCopyWithImpl<ReportTarget>(this as ReportTarget, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReportTarget;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportTarget&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.id, _this.id) || other.id == _this.id));
}


@override
int get hashCode {
  final _this = this as ReportTarget;
  return Object.hash(runtimeType,_this.kind,_this.id);
}

@override
String toString() {
  final _this = this as ReportTarget;
  return 'ReportTarget(kind: ${_this.kind}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $ReportTargetCopyWith<$Res>  {
  factory $ReportTargetCopyWith(ReportTarget value, $Res Function(ReportTarget) _then) = _$ReportTargetCopyWithImpl;
@useResult
$Res call({
 ReportTargetKind kind, String id
});




}
/// @nodoc
class _$ReportTargetCopyWithImpl<$Res>
    implements $ReportTargetCopyWith<$Res> {
  _$ReportTargetCopyWithImpl(this._self, this._then);

  final ReportTarget _self;
  final $Res Function(ReportTarget) _then;

/// Create a copy of ReportTarget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? id = null,}) {
  return _then(ReportTarget(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ReportTargetKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportTarget].
extension ReportTargetPatterns on ReportTarget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportTarget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportTarget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportTarget value)  $default,){
final _that = this;
switch (_that) {
case _ReportTarget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportTarget value)?  $default,){
final _that = this;
switch (_that) {
case _ReportTarget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReportTargetKind kind,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportTarget() when $default != null:
return $default(_that.kind,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReportTargetKind kind,  String id)  $default,) {final _that = this;
switch (_that) {
case _ReportTarget():
return $default(_that.kind,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReportTargetKind kind,  String id)?  $default,) {final _that = this;
switch (_that) {
case _ReportTarget() when $default != null:
return $default(_that.kind,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _ReportTarget implements ReportTarget {
  const _ReportTarget({required this.kind, required this.id});
  

@override final  ReportTargetKind kind;
@override final  String id;

/// Create a copy of ReportTarget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportTargetCopyWith<_ReportTarget> get copyWith => __$ReportTargetCopyWithImpl<_ReportTarget>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportTarget&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kind,id);
}

@override
String toString() {
    return 'ReportTarget(kind: $kind, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ReportTargetCopyWith<$Res> implements $ReportTargetCopyWith<$Res> {
  factory _$ReportTargetCopyWith(_ReportTarget value, $Res Function(_ReportTarget) _then) = __$ReportTargetCopyWithImpl;
@override @useResult
$Res call({
 ReportTargetKind kind, String id
});




}
/// @nodoc
class __$ReportTargetCopyWithImpl<$Res>
    implements _$ReportTargetCopyWith<$Res> {
  __$ReportTargetCopyWithImpl(this._self, this._then);

  final _ReportTarget _self;
  final $Res Function(_ReportTarget) _then;

/// Create a copy of ReportTarget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? id = null,}) {
  return _then(_ReportTarget(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ReportTargetKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ReportRequest {

 ReportTarget get target; ReportReason get reason; String? get note;
/// Create a copy of ReportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportRequestCopyWith<ReportRequest> get copyWith => _$ReportRequestCopyWithImpl<ReportRequest>(this as ReportRequest, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReportRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportRequest&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as ReportRequest;
  return Object.hash(runtimeType,_this.target,_this.reason,_this.note);
}

@override
String toString() {
  final _this = this as ReportRequest;
  return 'ReportRequest(target: ${_this.target}, reason: ${_this.reason}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ReportRequestCopyWith<$Res>  {
  factory $ReportRequestCopyWith(ReportRequest value, $Res Function(ReportRequest) _then) = _$ReportRequestCopyWithImpl;
@useResult
$Res call({
 ReportTarget target, ReportReason reason, String? note
});


$ReportTargetCopyWith<$Res> get target;

}
/// @nodoc
class _$ReportRequestCopyWithImpl<$Res>
    implements $ReportRequestCopyWith<$Res> {
  _$ReportRequestCopyWithImpl(this._self, this._then);

  final ReportRequest _self;
  final $Res Function(ReportRequest) _then;

/// Create a copy of ReportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? target = null,Object? reason = null,Object? note = freezed,}) {
  return _then(ReportRequest(
target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as ReportTarget,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReportReason,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ReportRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportTargetCopyWith<$Res> get target {
  
  return $ReportTargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportRequest].
extension ReportRequestPatterns on ReportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportRequest value)  $default,){
final _that = this;
switch (_that) {
case _ReportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ReportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReportTarget target,  ReportReason reason,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportRequest() when $default != null:
return $default(_that.target,_that.reason,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReportTarget target,  ReportReason reason,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ReportRequest():
return $default(_that.target,_that.reason,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReportTarget target,  ReportReason reason,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ReportRequest() when $default != null:
return $default(_that.target,_that.reason,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _ReportRequest implements ReportRequest {
  const _ReportRequest({required this.target, required this.reason, this.note});
  

@override final  ReportTarget target;
@override final  ReportReason reason;
@override final  String? note;

/// Create a copy of ReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportRequestCopyWith<_ReportRequest> get copyWith => __$ReportRequestCopyWithImpl<_ReportRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportRequest&&(identical(other.target, target) || other.target == target)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,target,reason,note);
}

@override
String toString() {
    return 'ReportRequest(target: $target, reason: $reason, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ReportRequestCopyWith<$Res> implements $ReportRequestCopyWith<$Res> {
  factory _$ReportRequestCopyWith(_ReportRequest value, $Res Function(_ReportRequest) _then) = __$ReportRequestCopyWithImpl;
@override @useResult
$Res call({
 ReportTarget target, ReportReason reason, String? note
});


@override $ReportTargetCopyWith<$Res> get target;

}
/// @nodoc
class __$ReportRequestCopyWithImpl<$Res>
    implements _$ReportRequestCopyWith<$Res> {
  __$ReportRequestCopyWithImpl(this._self, this._then);

  final _ReportRequest _self;
  final $Res Function(_ReportRequest) _then;

/// Create a copy of ReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? target = null,Object? reason = null,Object? note = freezed,}) {
  return _then(_ReportRequest(
target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as ReportTarget,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReportReason,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ReportRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportTargetCopyWith<$Res> get target {
  
  return $ReportTargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}

/// @nodoc
mixin _$ContentReport {

 String get id; ReportTarget get target; ReportReason get reason; DateTime get createdAt; ReportStatus get status; String? get note;
/// Create a copy of ContentReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentReportCopyWith<ContentReport> get copyWith => _$ContentReportCopyWithImpl<ContentReport>(this as ContentReport, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ContentReport;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentReport&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as ContentReport;
  return Object.hash(runtimeType,_this.id,_this.target,_this.reason,_this.createdAt,_this.status,_this.note);
}

@override
String toString() {
  final _this = this as ContentReport;
  return 'ContentReport(id: ${_this.id}, target: ${_this.target}, reason: ${_this.reason}, createdAt: ${_this.createdAt}, status: ${_this.status}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ContentReportCopyWith<$Res>  {
  factory $ContentReportCopyWith(ContentReport value, $Res Function(ContentReport) _then) = _$ContentReportCopyWithImpl;
@useResult
$Res call({
 String id, ReportTarget target, ReportReason reason, DateTime createdAt, ReportStatus status, String? note
});


$ReportTargetCopyWith<$Res> get target;

}
/// @nodoc
class _$ContentReportCopyWithImpl<$Res>
    implements $ContentReportCopyWith<$Res> {
  _$ContentReportCopyWithImpl(this._self, this._then);

  final ContentReport _self;
  final $Res Function(ContentReport) _then;

/// Create a copy of ContentReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? target = null,Object? reason = null,Object? createdAt = null,Object? status = null,Object? note = freezed,}) {
  return _then(ContentReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as ReportTarget,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReportReason,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ContentReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportTargetCopyWith<$Res> get target {
  
  return $ReportTargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContentReport].
extension ContentReportPatterns on ContentReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentReport value)  $default,){
final _that = this;
switch (_that) {
case _ContentReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentReport value)?  $default,){
final _that = this;
switch (_that) {
case _ContentReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ReportTarget target,  ReportReason reason,  DateTime createdAt,  ReportStatus status,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentReport() when $default != null:
return $default(_that.id,_that.target,_that.reason,_that.createdAt,_that.status,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ReportTarget target,  ReportReason reason,  DateTime createdAt,  ReportStatus status,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ContentReport():
return $default(_that.id,_that.target,_that.reason,_that.createdAt,_that.status,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ReportTarget target,  ReportReason reason,  DateTime createdAt,  ReportStatus status,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ContentReport() when $default != null:
return $default(_that.id,_that.target,_that.reason,_that.createdAt,_that.status,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _ContentReport implements ContentReport {
  const _ContentReport({required this.id, required this.target, required this.reason, required this.createdAt, this.status = ReportStatus.open, this.note});
  

@override final  String id;
@override final  ReportTarget target;
@override final  ReportReason reason;
@override final  DateTime createdAt;
@override@JsonKey() final  ReportStatus status;
@override final  String? note;

/// Create a copy of ContentReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentReportCopyWith<_ContentReport> get copyWith => __$ContentReportCopyWithImpl<_ContentReport>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentReport&&(identical(other.id, id) || other.id == id)&&(identical(other.target, target) || other.target == target)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,target,reason,createdAt,status,note);
}

@override
String toString() {
    return 'ContentReport(id: $id, target: $target, reason: $reason, createdAt: $createdAt, status: $status, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ContentReportCopyWith<$Res> implements $ContentReportCopyWith<$Res> {
  factory _$ContentReportCopyWith(_ContentReport value, $Res Function(_ContentReport) _then) = __$ContentReportCopyWithImpl;
@override @useResult
$Res call({
 String id, ReportTarget target, ReportReason reason, DateTime createdAt, ReportStatus status, String? note
});


@override $ReportTargetCopyWith<$Res> get target;

}
/// @nodoc
class __$ContentReportCopyWithImpl<$Res>
    implements _$ContentReportCopyWith<$Res> {
  __$ContentReportCopyWithImpl(this._self, this._then);

  final _ContentReport _self;
  final $Res Function(_ContentReport) _then;

/// Create a copy of ContentReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? target = null,Object? reason = null,Object? createdAt = null,Object? status = null,Object? note = freezed,}) {
  return _then(_ContentReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as ReportTarget,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReportReason,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ContentReport
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
