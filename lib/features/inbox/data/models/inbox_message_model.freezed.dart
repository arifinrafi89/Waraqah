// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfferModel {

 String get id; int get amountBdt; OfferHandover get handover; OfferStatus get status;
/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferModelCopyWith<OfferModel> get copyWith => _$OfferModelCopyWithImpl<OfferModel>(this as OfferModel, _$identity);

  /// Serializes this OfferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OfferModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.amountBdt, _this.amountBdt) || other.amountBdt == _this.amountBdt)&&(identical(other.handover, _this.handover) || other.handover == _this.handover)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OfferModel;
  return Object.hash(runtimeType,_this.id,_this.amountBdt,_this.handover,_this.status);
}

@override
String toString() {
  final _this = this as OfferModel;
  return 'OfferModel(id: ${_this.id}, amountBdt: ${_this.amountBdt}, handover: ${_this.handover}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $OfferModelCopyWith<$Res>  {
  factory $OfferModelCopyWith(OfferModel value, $Res Function(OfferModel) _then) = _$OfferModelCopyWithImpl;
@useResult
$Res call({
 String id, int amountBdt, OfferHandover handover, OfferStatus status
});




}
/// @nodoc
class _$OfferModelCopyWithImpl<$Res>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._self, this._then);

  final OfferModel _self;
  final $Res Function(OfferModel) _then;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amountBdt = null,Object? handover = null,Object? status = null,}) {
  return _then(OfferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountBdt: null == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int,handover: null == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as OfferHandover,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OfferStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferModel].
extension OfferModelPatterns on OfferModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferModel value)  $default,){
final _that = this;
switch (_that) {
case _OfferModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferModel value)?  $default,){
final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int amountBdt,  OfferHandover handover,  OfferStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
return $default(_that.id,_that.amountBdt,_that.handover,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int amountBdt,  OfferHandover handover,  OfferStatus status)  $default,) {final _that = this;
switch (_that) {
case _OfferModel():
return $default(_that.id,_that.amountBdt,_that.handover,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int amountBdt,  OfferHandover handover,  OfferStatus status)?  $default,) {final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
return $default(_that.id,_that.amountBdt,_that.handover,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferModel implements OfferModel {
  const _OfferModel({required this.id, required this.amountBdt, required this.handover, this.status = OfferStatus.pending});
  factory _OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);

@override final  String id;
@override final  int amountBdt;
@override final  OfferHandover handover;
@override@JsonKey() final  OfferStatus status;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferModelCopyWith<_OfferModel> get copyWith => __$OfferModelCopyWithImpl<_OfferModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amountBdt, amountBdt) || other.amountBdt == amountBdt)&&(identical(other.handover, handover) || other.handover == handover)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,amountBdt,handover,status);
}

@override
String toString() {
    return 'OfferModel(id: $id, amountBdt: $amountBdt, handover: $handover, status: $status)';
}


}

/// @nodoc
abstract mixin class _$OfferModelCopyWith<$Res> implements $OfferModelCopyWith<$Res> {
  factory _$OfferModelCopyWith(_OfferModel value, $Res Function(_OfferModel) _then) = __$OfferModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int amountBdt, OfferHandover handover, OfferStatus status
});




}
/// @nodoc
class __$OfferModelCopyWithImpl<$Res>
    implements _$OfferModelCopyWith<$Res> {
  __$OfferModelCopyWithImpl(this._self, this._then);

  final _OfferModel _self;
  final $Res Function(_OfferModel) _then;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amountBdt = null,Object? handover = null,Object? status = null,}) {
  return _then(_OfferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountBdt: null == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int,handover: null == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as OfferHandover,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OfferStatus,
  ));
}


}


/// @nodoc
mixin _$InboxMessageModel {

 String get id; MessageFrom get from; DateTime get at; String? get text; OfferModel? get offer; ThreadEvent? get event; int? get amountBdt;
/// Create a copy of InboxMessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxMessageModelCopyWith<InboxMessageModel> get copyWith => _$InboxMessageModelCopyWithImpl<InboxMessageModel>(this as InboxMessageModel, _$identity);

  /// Serializes this InboxMessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InboxMessageModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxMessageModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.offer, _this.offer) || other.offer == _this.offer)&&(identical(other.event, _this.event) || other.event == _this.event)&&(identical(other.amountBdt, _this.amountBdt) || other.amountBdt == _this.amountBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InboxMessageModel;
  return Object.hash(runtimeType,_this.id,_this.from,_this.at,_this.text,_this.offer,_this.event,_this.amountBdt);
}

@override
String toString() {
  final _this = this as InboxMessageModel;
  return 'InboxMessageModel(id: ${_this.id}, from: ${_this.from}, at: ${_this.at}, text: ${_this.text}, offer: ${_this.offer}, event: ${_this.event}, amountBdt: ${_this.amountBdt})';
}


}

/// @nodoc
abstract mixin class $InboxMessageModelCopyWith<$Res>  {
  factory $InboxMessageModelCopyWith(InboxMessageModel value, $Res Function(InboxMessageModel) _then) = _$InboxMessageModelCopyWithImpl;
@useResult
$Res call({
 String id, MessageFrom from, DateTime at, String? text, OfferModel? offer, ThreadEvent? event, int? amountBdt
});


$OfferModelCopyWith<$Res>? get offer;

}
/// @nodoc
class _$InboxMessageModelCopyWithImpl<$Res>
    implements $InboxMessageModelCopyWith<$Res> {
  _$InboxMessageModelCopyWithImpl(this._self, this._then);

  final InboxMessageModel _self;
  final $Res Function(InboxMessageModel) _then;

/// Create a copy of InboxMessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? from = null,Object? at = null,Object? text = freezed,Object? offer = freezed,Object? event = freezed,Object? amountBdt = freezed,}) {
  return _then(InboxMessageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as MessageFrom,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as OfferModel?,event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ThreadEvent?,amountBdt: freezed == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of InboxMessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferModelCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $OfferModelCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}
}


/// Adds pattern-matching-related methods to [InboxMessageModel].
extension InboxMessageModelPatterns on InboxMessageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxMessageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxMessageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxMessageModel value)  $default,){
final _that = this;
switch (_that) {
case _InboxMessageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxMessageModel value)?  $default,){
final _that = this;
switch (_that) {
case _InboxMessageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MessageFrom from,  DateTime at,  String? text,  OfferModel? offer,  ThreadEvent? event,  int? amountBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxMessageModel() when $default != null:
return $default(_that.id,_that.from,_that.at,_that.text,_that.offer,_that.event,_that.amountBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MessageFrom from,  DateTime at,  String? text,  OfferModel? offer,  ThreadEvent? event,  int? amountBdt)  $default,) {final _that = this;
switch (_that) {
case _InboxMessageModel():
return $default(_that.id,_that.from,_that.at,_that.text,_that.offer,_that.event,_that.amountBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MessageFrom from,  DateTime at,  String? text,  OfferModel? offer,  ThreadEvent? event,  int? amountBdt)?  $default,) {final _that = this;
switch (_that) {
case _InboxMessageModel() when $default != null:
return $default(_that.id,_that.from,_that.at,_that.text,_that.offer,_that.event,_that.amountBdt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _InboxMessageModel implements InboxMessageModel {
  const _InboxMessageModel({required this.id, required this.from, required this.at, this.text, this.offer, this.event, this.amountBdt});
  factory _InboxMessageModel.fromJson(Map<String, dynamic> json) => _$InboxMessageModelFromJson(json);

@override final  String id;
@override final  MessageFrom from;
@override final  DateTime at;
@override final  String? text;
@override final  OfferModel? offer;
@override final  ThreadEvent? event;
@override final  int? amountBdt;

/// Create a copy of InboxMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxMessageModelCopyWith<_InboxMessageModel> get copyWith => __$InboxMessageModelCopyWithImpl<_InboxMessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InboxMessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxMessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.from, from) || other.from == from)&&(identical(other.at, at) || other.at == at)&&(identical(other.text, text) || other.text == text)&&(identical(other.offer, offer) || other.offer == offer)&&(identical(other.event, event) || other.event == event)&&(identical(other.amountBdt, amountBdt) || other.amountBdt == amountBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,from,at,text,offer,event,amountBdt);
}

@override
String toString() {
    return 'InboxMessageModel(id: $id, from: $from, at: $at, text: $text, offer: $offer, event: $event, amountBdt: $amountBdt)';
}


}

/// @nodoc
abstract mixin class _$InboxMessageModelCopyWith<$Res> implements $InboxMessageModelCopyWith<$Res> {
  factory _$InboxMessageModelCopyWith(_InboxMessageModel value, $Res Function(_InboxMessageModel) _then) = __$InboxMessageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, MessageFrom from, DateTime at, String? text, OfferModel? offer, ThreadEvent? event, int? amountBdt
});


@override $OfferModelCopyWith<$Res>? get offer;

}
/// @nodoc
class __$InboxMessageModelCopyWithImpl<$Res>
    implements _$InboxMessageModelCopyWith<$Res> {
  __$InboxMessageModelCopyWithImpl(this._self, this._then);

  final _InboxMessageModel _self;
  final $Res Function(_InboxMessageModel) _then;

/// Create a copy of InboxMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? from = null,Object? at = null,Object? text = freezed,Object? offer = freezed,Object? event = freezed,Object? amountBdt = freezed,}) {
  return _then(_InboxMessageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as MessageFrom,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as OfferModel?,event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ThreadEvent?,amountBdt: freezed == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of InboxMessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferModelCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $OfferModelCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}
}

// dart format on
