// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_thread.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThreadListing {

 String get id; String get title; int get priceBdt; P2pListingStatus get status; int get coverSeed; bool get isNegotiable; HandoverMethod get handover;
/// Create a copy of ThreadListing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadListingCopyWith<ThreadListing> get copyWith => _$ThreadListingCopyWithImpl<ThreadListing>(this as ThreadListing, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ThreadListing;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadListing&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.isNegotiable, _this.isNegotiable) || other.isNegotiable == _this.isNegotiable)&&(identical(other.handover, _this.handover) || other.handover == _this.handover));
}


@override
int get hashCode {
  final _this = this as ThreadListing;
  return Object.hash(runtimeType,_this.id,_this.title,_this.priceBdt,_this.status,_this.coverSeed,_this.isNegotiable,_this.handover);
}

@override
String toString() {
  final _this = this as ThreadListing;
  return 'ThreadListing(id: ${_this.id}, title: ${_this.title}, priceBdt: ${_this.priceBdt}, status: ${_this.status}, coverSeed: ${_this.coverSeed}, isNegotiable: ${_this.isNegotiable}, handover: ${_this.handover})';
}


}

/// @nodoc
abstract mixin class $ThreadListingCopyWith<$Res>  {
  factory $ThreadListingCopyWith(ThreadListing value, $Res Function(ThreadListing) _then) = _$ThreadListingCopyWithImpl;
@useResult
$Res call({
 String id, String title, int priceBdt, P2pListingStatus status, int coverSeed, bool isNegotiable, HandoverMethod handover
});




}
/// @nodoc
class _$ThreadListingCopyWithImpl<$Res>
    implements $ThreadListingCopyWith<$Res> {
  _$ThreadListingCopyWithImpl(this._self, this._then);

  final ThreadListing _self;
  final $Res Function(ThreadListing) _then;

/// Create a copy of ThreadListing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? priceBdt = null,Object? status = null,Object? coverSeed = null,Object? isNegotiable = null,Object? handover = null,}) {
  return _then(ThreadListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as P2pListingStatus,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,handover: null == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as HandoverMethod,
  ));
}

}


/// Adds pattern-matching-related methods to [ThreadListing].
extension ThreadListingPatterns on ThreadListing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThreadListing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThreadListing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThreadListing value)  $default,){
final _that = this;
switch (_that) {
case _ThreadListing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThreadListing value)?  $default,){
final _that = this;
switch (_that) {
case _ThreadListing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int priceBdt,  P2pListingStatus status,  int coverSeed,  bool isNegotiable,  HandoverMethod handover)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThreadListing() when $default != null:
return $default(_that.id,_that.title,_that.priceBdt,_that.status,_that.coverSeed,_that.isNegotiable,_that.handover);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int priceBdt,  P2pListingStatus status,  int coverSeed,  bool isNegotiable,  HandoverMethod handover)  $default,) {final _that = this;
switch (_that) {
case _ThreadListing():
return $default(_that.id,_that.title,_that.priceBdt,_that.status,_that.coverSeed,_that.isNegotiable,_that.handover);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int priceBdt,  P2pListingStatus status,  int coverSeed,  bool isNegotiable,  HandoverMethod handover)?  $default,) {final _that = this;
switch (_that) {
case _ThreadListing() when $default != null:
return $default(_that.id,_that.title,_that.priceBdt,_that.status,_that.coverSeed,_that.isNegotiable,_that.handover);case _:
  return null;

}
}

}

/// @nodoc


class _ThreadListing implements ThreadListing {
  const _ThreadListing({required this.id, required this.title, required this.priceBdt, required this.status, this.coverSeed = 0, this.isNegotiable = false, this.handover = HandoverMethod.meetInPerson});
  

@override final  String id;
@override final  String title;
@override final  int priceBdt;
@override final  P2pListingStatus status;
@override@JsonKey() final  int coverSeed;
@override@JsonKey() final  bool isNegotiable;
@override@JsonKey() final  HandoverMethod handover;

/// Create a copy of ThreadListing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadListingCopyWith<_ThreadListing> get copyWith => __$ThreadListingCopyWithImpl<_ThreadListing>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadListing&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.status, status) || other.status == status)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable)&&(identical(other.handover, handover) || other.handover == handover));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,priceBdt,status,coverSeed,isNegotiable,handover);
}

@override
String toString() {
    return 'ThreadListing(id: $id, title: $title, priceBdt: $priceBdt, status: $status, coverSeed: $coverSeed, isNegotiable: $isNegotiable, handover: $handover)';
}


}

/// @nodoc
abstract mixin class _$ThreadListingCopyWith<$Res> implements $ThreadListingCopyWith<$Res> {
  factory _$ThreadListingCopyWith(_ThreadListing value, $Res Function(_ThreadListing) _then) = __$ThreadListingCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int priceBdt, P2pListingStatus status, int coverSeed, bool isNegotiable, HandoverMethod handover
});




}
/// @nodoc
class __$ThreadListingCopyWithImpl<$Res>
    implements _$ThreadListingCopyWith<$Res> {
  __$ThreadListingCopyWithImpl(this._self, this._then);

  final _ThreadListing _self;
  final $Res Function(_ThreadListing) _then;

/// Create a copy of ThreadListing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? priceBdt = null,Object? status = null,Object? coverSeed = null,Object? isNegotiable = null,Object? handover = null,}) {
  return _then(_ThreadListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as P2pListingStatus,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,handover: null == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as HandoverMethod,
  ));
}


}

/// @nodoc
mixin _$InboxThread {

 String get id; ThreadRole get role; String get otherId; String get otherName; ThreadListing get listing;/// The listing is reserved for, or sold to, this thread's buyer.
 bool get dealHere;/// Offers and messages from the other person not read yet.
 int get unread;/// Oldest first. The inbox list only carries the latest one.
 List<InboxMessage> get messages;/// Stars the reader gave the other person after the sale.
 int? get myRating;/// Stars the other person gave the reader.
 int? get theirRating;
/// Create a copy of InboxThread
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxThreadCopyWith<InboxThread> get copyWith => _$InboxThreadCopyWithImpl<InboxThread>(this as InboxThread, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as InboxThread;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxThread&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.otherId, _this.otherId) || other.otherId == _this.otherId)&&(identical(other.otherName, _this.otherName) || other.otherName == _this.otherName)&&(identical(other.listing, _this.listing) || other.listing == _this.listing)&&(identical(other.dealHere, _this.dealHere) || other.dealHere == _this.dealHere)&&(identical(other.unread, _this.unread) || other.unread == _this.unread)&&const DeepCollectionEquality().equals(other.messages, _this.messages)&&(identical(other.myRating, _this.myRating) || other.myRating == _this.myRating)&&(identical(other.theirRating, _this.theirRating) || other.theirRating == _this.theirRating));
}


@override
int get hashCode {
  final _this = this as InboxThread;
  return Object.hash(runtimeType,_this.id,_this.role,_this.otherId,_this.otherName,_this.listing,_this.dealHere,_this.unread,const DeepCollectionEquality().hash(_this.messages),_this.myRating,_this.theirRating);
}

@override
String toString() {
  final _this = this as InboxThread;
  return 'InboxThread(id: ${_this.id}, role: ${_this.role}, otherId: ${_this.otherId}, otherName: ${_this.otherName}, listing: ${_this.listing}, dealHere: ${_this.dealHere}, unread: ${_this.unread}, messages: ${_this.messages}, myRating: ${_this.myRating}, theirRating: ${_this.theirRating})';
}


}

/// @nodoc
abstract mixin class $InboxThreadCopyWith<$Res>  {
  factory $InboxThreadCopyWith(InboxThread value, $Res Function(InboxThread) _then) = _$InboxThreadCopyWithImpl;
@useResult
$Res call({
 String id, ThreadRole role, String otherId, String otherName, ThreadListing listing, bool dealHere, int unread, List<InboxMessage> messages, int? myRating, int? theirRating
});


$ThreadListingCopyWith<$Res> get listing;

}
/// @nodoc
class _$InboxThreadCopyWithImpl<$Res>
    implements $InboxThreadCopyWith<$Res> {
  _$InboxThreadCopyWithImpl(this._self, this._then);

  final InboxThread _self;
  final $Res Function(InboxThread) _then;

/// Create a copy of InboxThread
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? otherId = null,Object? otherName = null,Object? listing = null,Object? dealHere = null,Object? unread = null,Object? messages = null,Object? myRating = freezed,Object? theirRating = freezed,}) {
  return _then(InboxThread(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ThreadRole,otherId: null == otherId ? _self.otherId : otherId // ignore: cast_nullable_to_non_nullable
as String,otherName: null == otherName ? _self.otherName : otherName // ignore: cast_nullable_to_non_nullable
as String,listing: null == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as ThreadListing,dealHere: null == dealHere ? _self.dealHere : dealHere // ignore: cast_nullable_to_non_nullable
as bool,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<InboxMessage>,myRating: freezed == myRating ? _self.myRating : myRating // ignore: cast_nullable_to_non_nullable
as int?,theirRating: freezed == theirRating ? _self.theirRating : theirRating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of InboxThread
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThreadListingCopyWith<$Res> get listing {
  
  return $ThreadListingCopyWith<$Res>(_self.listing, (value) {
    return _then(_self.copyWith(listing: value));
  });
}
}


/// Adds pattern-matching-related methods to [InboxThread].
extension InboxThreadPatterns on InboxThread {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxThread value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxThread() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxThread value)  $default,){
final _that = this;
switch (_that) {
case _InboxThread():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxThread value)?  $default,){
final _that = this;
switch (_that) {
case _InboxThread() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ThreadRole role,  String otherId,  String otherName,  ThreadListing listing,  bool dealHere,  int unread,  List<InboxMessage> messages,  int? myRating,  int? theirRating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxThread() when $default != null:
return $default(_that.id,_that.role,_that.otherId,_that.otherName,_that.listing,_that.dealHere,_that.unread,_that.messages,_that.myRating,_that.theirRating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ThreadRole role,  String otherId,  String otherName,  ThreadListing listing,  bool dealHere,  int unread,  List<InboxMessage> messages,  int? myRating,  int? theirRating)  $default,) {final _that = this;
switch (_that) {
case _InboxThread():
return $default(_that.id,_that.role,_that.otherId,_that.otherName,_that.listing,_that.dealHere,_that.unread,_that.messages,_that.myRating,_that.theirRating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ThreadRole role,  String otherId,  String otherName,  ThreadListing listing,  bool dealHere,  int unread,  List<InboxMessage> messages,  int? myRating,  int? theirRating)?  $default,) {final _that = this;
switch (_that) {
case _InboxThread() when $default != null:
return $default(_that.id,_that.role,_that.otherId,_that.otherName,_that.listing,_that.dealHere,_that.unread,_that.messages,_that.myRating,_that.theirRating);case _:
  return null;

}
}

}

/// @nodoc


class _InboxThread implements InboxThread {
  const _InboxThread({required this.id, required this.role, required this.otherId, required this.otherName, required this.listing, this.dealHere = false, this.unread = 0,  List<InboxMessage> messages = const <InboxMessage>[], this.myRating, this.theirRating}): _messages = messages;
  

@override final  String id;
@override final  ThreadRole role;
@override final  String otherId;
@override final  String otherName;
@override final  ThreadListing listing;
/// The listing is reserved for, or sold to, this thread's buyer.
@override@JsonKey() final  bool dealHere;
/// Offers and messages from the other person not read yet.
@override@JsonKey() final  int unread;
/// Oldest first. The inbox list only carries the latest one.
 final  List<InboxMessage> _messages;
/// Oldest first. The inbox list only carries the latest one.
@override@JsonKey() List<InboxMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

/// Stars the reader gave the other person after the sale.
@override final  int? myRating;
/// Stars the other person gave the reader.
@override final  int? theirRating;

/// Create a copy of InboxThread
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxThreadCopyWith<_InboxThread> get copyWith => __$InboxThreadCopyWithImpl<_InboxThread>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxThread&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.otherId, otherId) || other.otherId == otherId)&&(identical(other.otherName, otherName) || other.otherName == otherName)&&(identical(other.listing, listing) || other.listing == listing)&&(identical(other.dealHere, dealHere) || other.dealHere == dealHere)&&(identical(other.unread, unread) || other.unread == unread)&&const DeepCollectionEquality().equals(other.messages, _messages)&&(identical(other.myRating, myRating) || other.myRating == myRating)&&(identical(other.theirRating, theirRating) || other.theirRating == theirRating));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,role,otherId,otherName,listing,dealHere,unread,const DeepCollectionEquality().hash(_messages),myRating,theirRating);
}

@override
String toString() {
    return 'InboxThread(id: $id, role: $role, otherId: $otherId, otherName: $otherName, listing: $listing, dealHere: $dealHere, unread: $unread, messages: $messages, myRating: $myRating, theirRating: $theirRating)';
}


}

/// @nodoc
abstract mixin class _$InboxThreadCopyWith<$Res> implements $InboxThreadCopyWith<$Res> {
  factory _$InboxThreadCopyWith(_InboxThread value, $Res Function(_InboxThread) _then) = __$InboxThreadCopyWithImpl;
@override @useResult
$Res call({
 String id, ThreadRole role, String otherId, String otherName, ThreadListing listing, bool dealHere, int unread, List<InboxMessage> messages, int? myRating, int? theirRating
});


@override $ThreadListingCopyWith<$Res> get listing;

}
/// @nodoc
class __$InboxThreadCopyWithImpl<$Res>
    implements _$InboxThreadCopyWith<$Res> {
  __$InboxThreadCopyWithImpl(this._self, this._then);

  final _InboxThread _self;
  final $Res Function(_InboxThread) _then;

/// Create a copy of InboxThread
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? otherId = null,Object? otherName = null,Object? listing = null,Object? dealHere = null,Object? unread = null,Object? messages = null,Object? myRating = freezed,Object? theirRating = freezed,}) {
  return _then(_InboxThread(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ThreadRole,otherId: null == otherId ? _self.otherId : otherId // ignore: cast_nullable_to_non_nullable
as String,otherName: null == otherName ? _self.otherName : otherName // ignore: cast_nullable_to_non_nullable
as String,listing: null == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as ThreadListing,dealHere: null == dealHere ? _self.dealHere : dealHere // ignore: cast_nullable_to_non_nullable
as bool,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<InboxMessage>,myRating: freezed == myRating ? _self.myRating : myRating // ignore: cast_nullable_to_non_nullable
as int?,theirRating: freezed == theirRating ? _self.theirRating : theirRating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of InboxThread
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThreadListingCopyWith<$Res> get listing {
  
  return $ThreadListingCopyWith<$Res>(_self.listing, (value) {
    return _then(_self.copyWith(listing: value));
  });
}
}

// dart format on
