// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Offer {

 String get id; int get amountBdt; OfferHandover get handover; OfferStatus get status;
/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferCopyWith<Offer> get copyWith => _$OfferCopyWithImpl<Offer>(this as Offer, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Offer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Offer&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.amountBdt, _this.amountBdt) || other.amountBdt == _this.amountBdt)&&(identical(other.handover, _this.handover) || other.handover == _this.handover)&&(identical(other.status, _this.status) || other.status == _this.status));
}


@override
int get hashCode {
  final _this = this as Offer;
  return Object.hash(runtimeType,_this.id,_this.amountBdt,_this.handover,_this.status);
}

@override
String toString() {
  final _this = this as Offer;
  return 'Offer(id: ${_this.id}, amountBdt: ${_this.amountBdt}, handover: ${_this.handover}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $OfferCopyWith<$Res>  {
  factory $OfferCopyWith(Offer value, $Res Function(Offer) _then) = _$OfferCopyWithImpl;
@useResult
$Res call({
 String id, int amountBdt, OfferHandover handover, OfferStatus status
});




}
/// @nodoc
class _$OfferCopyWithImpl<$Res>
    implements $OfferCopyWith<$Res> {
  _$OfferCopyWithImpl(this._self, this._then);

  final Offer _self;
  final $Res Function(Offer) _then;

/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amountBdt = null,Object? handover = null,Object? status = null,}) {
  return _then(Offer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountBdt: null == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int,handover: null == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as OfferHandover,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OfferStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [Offer].
extension OfferPatterns on Offer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Offer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Offer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Offer value)  $default,){
final _that = this;
switch (_that) {
case _Offer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Offer value)?  $default,){
final _that = this;
switch (_that) {
case _Offer() when $default != null:
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
case _Offer() when $default != null:
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
case _Offer():
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
case _Offer() when $default != null:
return $default(_that.id,_that.amountBdt,_that.handover,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _Offer implements Offer {
  const _Offer({required this.id, required this.amountBdt, required this.handover, this.status = OfferStatus.pending});
  

@override final  String id;
@override final  int amountBdt;
@override final  OfferHandover handover;
@override@JsonKey() final  OfferStatus status;

/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferCopyWith<_Offer> get copyWith => __$OfferCopyWithImpl<_Offer>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Offer&&(identical(other.id, id) || other.id == id)&&(identical(other.amountBdt, amountBdt) || other.amountBdt == amountBdt)&&(identical(other.handover, handover) || other.handover == handover)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,amountBdt,handover,status);
}

@override
String toString() {
    return 'Offer(id: $id, amountBdt: $amountBdt, handover: $handover, status: $status)';
}


}

/// @nodoc
abstract mixin class _$OfferCopyWith<$Res> implements $OfferCopyWith<$Res> {
  factory _$OfferCopyWith(_Offer value, $Res Function(_Offer) _then) = __$OfferCopyWithImpl;
@override @useResult
$Res call({
 String id, int amountBdt, OfferHandover handover, OfferStatus status
});




}
/// @nodoc
class __$OfferCopyWithImpl<$Res>
    implements _$OfferCopyWith<$Res> {
  __$OfferCopyWithImpl(this._self, this._then);

  final _Offer _self;
  final $Res Function(_Offer) _then;

/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amountBdt = null,Object? handover = null,Object? status = null,}) {
  return _then(_Offer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountBdt: null == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int,handover: null == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as OfferHandover,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OfferStatus,
  ));
}


}

/// @nodoc
mixin _$InboxMessage {

 String get id; MessageFrom get from; DateTime get at; String? get text; Offer? get offer; ThreadEvent? get event;/// The price an event is about, e.g. the accepted offer.
 int? get amountBdt;
/// Create a copy of InboxMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxMessageCopyWith<InboxMessage> get copyWith => _$InboxMessageCopyWithImpl<InboxMessage>(this as InboxMessage, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as InboxMessage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxMessage&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.offer, _this.offer) || other.offer == _this.offer)&&(identical(other.event, _this.event) || other.event == _this.event)&&(identical(other.amountBdt, _this.amountBdt) || other.amountBdt == _this.amountBdt));
}


@override
int get hashCode {
  final _this = this as InboxMessage;
  return Object.hash(runtimeType,_this.id,_this.from,_this.at,_this.text,_this.offer,_this.event,_this.amountBdt);
}

@override
String toString() {
  final _this = this as InboxMessage;
  return 'InboxMessage(id: ${_this.id}, from: ${_this.from}, at: ${_this.at}, text: ${_this.text}, offer: ${_this.offer}, event: ${_this.event}, amountBdt: ${_this.amountBdt})';
}


}

/// @nodoc
abstract mixin class $InboxMessageCopyWith<$Res>  {
  factory $InboxMessageCopyWith(InboxMessage value, $Res Function(InboxMessage) _then) = _$InboxMessageCopyWithImpl;
@useResult
$Res call({
 String id, MessageFrom from, DateTime at, String? text, Offer? offer, ThreadEvent? event, int? amountBdt
});


$OfferCopyWith<$Res>? get offer;

}
/// @nodoc
class _$InboxMessageCopyWithImpl<$Res>
    implements $InboxMessageCopyWith<$Res> {
  _$InboxMessageCopyWithImpl(this._self, this._then);

  final InboxMessage _self;
  final $Res Function(InboxMessage) _then;

/// Create a copy of InboxMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? from = null,Object? at = null,Object? text = freezed,Object? offer = freezed,Object? event = freezed,Object? amountBdt = freezed,}) {
  return _then(InboxMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as MessageFrom,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as Offer?,event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ThreadEvent?,amountBdt: freezed == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of InboxMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $OfferCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}
}


/// Adds pattern-matching-related methods to [InboxMessage].
extension InboxMessagePatterns on InboxMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxMessage value)  $default,){
final _that = this;
switch (_that) {
case _InboxMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxMessage value)?  $default,){
final _that = this;
switch (_that) {
case _InboxMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MessageFrom from,  DateTime at,  String? text,  Offer? offer,  ThreadEvent? event,  int? amountBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxMessage() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MessageFrom from,  DateTime at,  String? text,  Offer? offer,  ThreadEvent? event,  int? amountBdt)  $default,) {final _that = this;
switch (_that) {
case _InboxMessage():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MessageFrom from,  DateTime at,  String? text,  Offer? offer,  ThreadEvent? event,  int? amountBdt)?  $default,) {final _that = this;
switch (_that) {
case _InboxMessage() when $default != null:
return $default(_that.id,_that.from,_that.at,_that.text,_that.offer,_that.event,_that.amountBdt);case _:
  return null;

}
}

}

/// @nodoc


class _InboxMessage implements InboxMessage {
  const _InboxMessage({required this.id, required this.from, required this.at, this.text, this.offer, this.event, this.amountBdt});
  

@override final  String id;
@override final  MessageFrom from;
@override final  DateTime at;
@override final  String? text;
@override final  Offer? offer;
@override final  ThreadEvent? event;
/// The price an event is about, e.g. the accepted offer.
@override final  int? amountBdt;

/// Create a copy of InboxMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxMessageCopyWith<_InboxMessage> get copyWith => __$InboxMessageCopyWithImpl<_InboxMessage>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.from, from) || other.from == from)&&(identical(other.at, at) || other.at == at)&&(identical(other.text, text) || other.text == text)&&(identical(other.offer, offer) || other.offer == offer)&&(identical(other.event, event) || other.event == event)&&(identical(other.amountBdt, amountBdt) || other.amountBdt == amountBdt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,from,at,text,offer,event,amountBdt);
}

@override
String toString() {
    return 'InboxMessage(id: $id, from: $from, at: $at, text: $text, offer: $offer, event: $event, amountBdt: $amountBdt)';
}


}

/// @nodoc
abstract mixin class _$InboxMessageCopyWith<$Res> implements $InboxMessageCopyWith<$Res> {
  factory _$InboxMessageCopyWith(_InboxMessage value, $Res Function(_InboxMessage) _then) = __$InboxMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, MessageFrom from, DateTime at, String? text, Offer? offer, ThreadEvent? event, int? amountBdt
});


@override $OfferCopyWith<$Res>? get offer;

}
/// @nodoc
class __$InboxMessageCopyWithImpl<$Res>
    implements _$InboxMessageCopyWith<$Res> {
  __$InboxMessageCopyWithImpl(this._self, this._then);

  final _InboxMessage _self;
  final $Res Function(_InboxMessage) _then;

/// Create a copy of InboxMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? from = null,Object? at = null,Object? text = freezed,Object? offer = freezed,Object? event = freezed,Object? amountBdt = freezed,}) {
  return _then(_InboxMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as MessageFrom,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as Offer?,event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ThreadEvent?,amountBdt: freezed == amountBdt ? _self.amountBdt : amountBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of InboxMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $OfferCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}
}

// dart format on
