// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_thread_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThreadListingModel {

 String get id; String get title; int get priceBdt; P2pListingStatus get status; int get coverSeed; bool get isNegotiable; HandoverMethod get handover;
/// Create a copy of ThreadListingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadListingModelCopyWith<ThreadListingModel> get copyWith => _$ThreadListingModelCopyWithImpl<ThreadListingModel>(this as ThreadListingModel, _$identity);

  /// Serializes this ThreadListingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ThreadListingModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadListingModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.isNegotiable, _this.isNegotiable) || other.isNegotiable == _this.isNegotiable)&&(identical(other.handover, _this.handover) || other.handover == _this.handover));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ThreadListingModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.priceBdt,_this.status,_this.coverSeed,_this.isNegotiable,_this.handover);
}

@override
String toString() {
  final _this = this as ThreadListingModel;
  return 'ThreadListingModel(id: ${_this.id}, title: ${_this.title}, priceBdt: ${_this.priceBdt}, status: ${_this.status}, coverSeed: ${_this.coverSeed}, isNegotiable: ${_this.isNegotiable}, handover: ${_this.handover})';
}


}

/// @nodoc
abstract mixin class $ThreadListingModelCopyWith<$Res>  {
  factory $ThreadListingModelCopyWith(ThreadListingModel value, $Res Function(ThreadListingModel) _then) = _$ThreadListingModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, int priceBdt, P2pListingStatus status, int coverSeed, bool isNegotiable, HandoverMethod handover
});




}
/// @nodoc
class _$ThreadListingModelCopyWithImpl<$Res>
    implements $ThreadListingModelCopyWith<$Res> {
  _$ThreadListingModelCopyWithImpl(this._self, this._then);

  final ThreadListingModel _self;
  final $Res Function(ThreadListingModel) _then;

/// Create a copy of ThreadListingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? priceBdt = null,Object? status = null,Object? coverSeed = null,Object? isNegotiable = null,Object? handover = null,}) {
  return _then(ThreadListingModel(
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


/// Adds pattern-matching-related methods to [ThreadListingModel].
extension ThreadListingModelPatterns on ThreadListingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThreadListingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThreadListingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThreadListingModel value)  $default,){
final _that = this;
switch (_that) {
case _ThreadListingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThreadListingModel value)?  $default,){
final _that = this;
switch (_that) {
case _ThreadListingModel() when $default != null:
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
case _ThreadListingModel() when $default != null:
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
case _ThreadListingModel():
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
case _ThreadListingModel() when $default != null:
return $default(_that.id,_that.title,_that.priceBdt,_that.status,_that.coverSeed,_that.isNegotiable,_that.handover);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThreadListingModel implements ThreadListingModel {
  const _ThreadListingModel({required this.id, required this.title, required this.priceBdt, required this.status, this.coverSeed = 0, this.isNegotiable = false, this.handover = HandoverMethod.meetInPerson});
  factory _ThreadListingModel.fromJson(Map<String, dynamic> json) => _$ThreadListingModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  int priceBdt;
@override final  P2pListingStatus status;
@override@JsonKey() final  int coverSeed;
@override@JsonKey() final  bool isNegotiable;
@override@JsonKey() final  HandoverMethod handover;

/// Create a copy of ThreadListingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadListingModelCopyWith<_ThreadListingModel> get copyWith => __$ThreadListingModelCopyWithImpl<_ThreadListingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThreadListingModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadListingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.status, status) || other.status == status)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable)&&(identical(other.handover, handover) || other.handover == handover));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,priceBdt,status,coverSeed,isNegotiable,handover);
}

@override
String toString() {
    return 'ThreadListingModel(id: $id, title: $title, priceBdt: $priceBdt, status: $status, coverSeed: $coverSeed, isNegotiable: $isNegotiable, handover: $handover)';
}


}

/// @nodoc
abstract mixin class _$ThreadListingModelCopyWith<$Res> implements $ThreadListingModelCopyWith<$Res> {
  factory _$ThreadListingModelCopyWith(_ThreadListingModel value, $Res Function(_ThreadListingModel) _then) = __$ThreadListingModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int priceBdt, P2pListingStatus status, int coverSeed, bool isNegotiable, HandoverMethod handover
});




}
/// @nodoc
class __$ThreadListingModelCopyWithImpl<$Res>
    implements _$ThreadListingModelCopyWith<$Res> {
  __$ThreadListingModelCopyWithImpl(this._self, this._then);

  final _ThreadListingModel _self;
  final $Res Function(_ThreadListingModel) _then;

/// Create a copy of ThreadListingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? priceBdt = null,Object? status = null,Object? coverSeed = null,Object? isNegotiable = null,Object? handover = null,}) {
  return _then(_ThreadListingModel(
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
mixin _$InboxThreadModel {

 String get id; ThreadRole get role; String get otherId; String get otherName; ThreadListingModel get listing; bool get dealHere; int get unread; List<InboxMessageModel> get messages;
/// Create a copy of InboxThreadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxThreadModelCopyWith<InboxThreadModel> get copyWith => _$InboxThreadModelCopyWithImpl<InboxThreadModel>(this as InboxThreadModel, _$identity);

  /// Serializes this InboxThreadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InboxThreadModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxThreadModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.otherId, _this.otherId) || other.otherId == _this.otherId)&&(identical(other.otherName, _this.otherName) || other.otherName == _this.otherName)&&(identical(other.listing, _this.listing) || other.listing == _this.listing)&&(identical(other.dealHere, _this.dealHere) || other.dealHere == _this.dealHere)&&(identical(other.unread, _this.unread) || other.unread == _this.unread)&&const DeepCollectionEquality().equals(other.messages, _this.messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InboxThreadModel;
  return Object.hash(runtimeType,_this.id,_this.role,_this.otherId,_this.otherName,_this.listing,_this.dealHere,_this.unread,const DeepCollectionEquality().hash(_this.messages));
}

@override
String toString() {
  final _this = this as InboxThreadModel;
  return 'InboxThreadModel(id: ${_this.id}, role: ${_this.role}, otherId: ${_this.otherId}, otherName: ${_this.otherName}, listing: ${_this.listing}, dealHere: ${_this.dealHere}, unread: ${_this.unread}, messages: ${_this.messages})';
}


}

/// @nodoc
abstract mixin class $InboxThreadModelCopyWith<$Res>  {
  factory $InboxThreadModelCopyWith(InboxThreadModel value, $Res Function(InboxThreadModel) _then) = _$InboxThreadModelCopyWithImpl;
@useResult
$Res call({
 String id, ThreadRole role, String otherId, String otherName, ThreadListingModel listing, bool dealHere, int unread, List<InboxMessageModel> messages
});


$ThreadListingModelCopyWith<$Res> get listing;

}
/// @nodoc
class _$InboxThreadModelCopyWithImpl<$Res>
    implements $InboxThreadModelCopyWith<$Res> {
  _$InboxThreadModelCopyWithImpl(this._self, this._then);

  final InboxThreadModel _self;
  final $Res Function(InboxThreadModel) _then;

/// Create a copy of InboxThreadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? otherId = null,Object? otherName = null,Object? listing = null,Object? dealHere = null,Object? unread = null,Object? messages = null,}) {
  return _then(InboxThreadModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ThreadRole,otherId: null == otherId ? _self.otherId : otherId // ignore: cast_nullable_to_non_nullable
as String,otherName: null == otherName ? _self.otherName : otherName // ignore: cast_nullable_to_non_nullable
as String,listing: null == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as ThreadListingModel,dealHere: null == dealHere ? _self.dealHere : dealHere // ignore: cast_nullable_to_non_nullable
as bool,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<InboxMessageModel>,
  ));
}
/// Create a copy of InboxThreadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThreadListingModelCopyWith<$Res> get listing {
  
  return $ThreadListingModelCopyWith<$Res>(_self.listing, (value) {
    return _then(_self.copyWith(listing: value));
  });
}
}


/// Adds pattern-matching-related methods to [InboxThreadModel].
extension InboxThreadModelPatterns on InboxThreadModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxThreadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxThreadModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxThreadModel value)  $default,){
final _that = this;
switch (_that) {
case _InboxThreadModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxThreadModel value)?  $default,){
final _that = this;
switch (_that) {
case _InboxThreadModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ThreadRole role,  String otherId,  String otherName,  ThreadListingModel listing,  bool dealHere,  int unread,  List<InboxMessageModel> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxThreadModel() when $default != null:
return $default(_that.id,_that.role,_that.otherId,_that.otherName,_that.listing,_that.dealHere,_that.unread,_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ThreadRole role,  String otherId,  String otherName,  ThreadListingModel listing,  bool dealHere,  int unread,  List<InboxMessageModel> messages)  $default,) {final _that = this;
switch (_that) {
case _InboxThreadModel():
return $default(_that.id,_that.role,_that.otherId,_that.otherName,_that.listing,_that.dealHere,_that.unread,_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ThreadRole role,  String otherId,  String otherName,  ThreadListingModel listing,  bool dealHere,  int unread,  List<InboxMessageModel> messages)?  $default,) {final _that = this;
switch (_that) {
case _InboxThreadModel() when $default != null:
return $default(_that.id,_that.role,_that.otherId,_that.otherName,_that.listing,_that.dealHere,_that.unread,_that.messages);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InboxThreadModel implements InboxThreadModel {
  const _InboxThreadModel({required this.id, required this.role, required this.otherId, required this.otherName, required this.listing, this.dealHere = false, this.unread = 0,  List<InboxMessageModel> messages = const <InboxMessageModel>[]}): _messages = messages;
  factory _InboxThreadModel.fromJson(Map<String, dynamic> json) => _$InboxThreadModelFromJson(json);

@override final  String id;
@override final  ThreadRole role;
@override final  String otherId;
@override final  String otherName;
@override final  ThreadListingModel listing;
@override@JsonKey() final  bool dealHere;
@override@JsonKey() final  int unread;
 final  List<InboxMessageModel> _messages;
@override@JsonKey() List<InboxMessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of InboxThreadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxThreadModelCopyWith<_InboxThreadModel> get copyWith => __$InboxThreadModelCopyWithImpl<_InboxThreadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InboxThreadModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxThreadModel&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.otherId, otherId) || other.otherId == otherId)&&(identical(other.otherName, otherName) || other.otherName == otherName)&&(identical(other.listing, listing) || other.listing == listing)&&(identical(other.dealHere, dealHere) || other.dealHere == dealHere)&&(identical(other.unread, unread) || other.unread == unread)&&const DeepCollectionEquality().equals(other.messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,role,otherId,otherName,listing,dealHere,unread,const DeepCollectionEquality().hash(_messages));
}

@override
String toString() {
    return 'InboxThreadModel(id: $id, role: $role, otherId: $otherId, otherName: $otherName, listing: $listing, dealHere: $dealHere, unread: $unread, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$InboxThreadModelCopyWith<$Res> implements $InboxThreadModelCopyWith<$Res> {
  factory _$InboxThreadModelCopyWith(_InboxThreadModel value, $Res Function(_InboxThreadModel) _then) = __$InboxThreadModelCopyWithImpl;
@override @useResult
$Res call({
 String id, ThreadRole role, String otherId, String otherName, ThreadListingModel listing, bool dealHere, int unread, List<InboxMessageModel> messages
});


@override $ThreadListingModelCopyWith<$Res> get listing;

}
/// @nodoc
class __$InboxThreadModelCopyWithImpl<$Res>
    implements _$InboxThreadModelCopyWith<$Res> {
  __$InboxThreadModelCopyWithImpl(this._self, this._then);

  final _InboxThreadModel _self;
  final $Res Function(_InboxThreadModel) _then;

/// Create a copy of InboxThreadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? otherId = null,Object? otherName = null,Object? listing = null,Object? dealHere = null,Object? unread = null,Object? messages = null,}) {
  return _then(_InboxThreadModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ThreadRole,otherId: null == otherId ? _self.otherId : otherId // ignore: cast_nullable_to_non_nullable
as String,otherName: null == otherName ? _self.otherName : otherName // ignore: cast_nullable_to_non_nullable
as String,listing: null == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as ThreadListingModel,dealHere: null == dealHere ? _self.dealHere : dealHere // ignore: cast_nullable_to_non_nullable
as bool,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<InboxMessageModel>,
  ));
}

/// Create a copy of InboxThreadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThreadListingModelCopyWith<$Res> get listing {
  
  return $ThreadListingModelCopyWith<$Res>(_self.listing, (value) {
    return _then(_self.copyWith(listing: value));
  });
}
}


/// @nodoc
mixin _$InboxChangeModel {

 int get seq; String get threadId; String get listingId;
/// Create a copy of InboxChangeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxChangeModelCopyWith<InboxChangeModel> get copyWith => _$InboxChangeModelCopyWithImpl<InboxChangeModel>(this as InboxChangeModel, _$identity);

  /// Serializes this InboxChangeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InboxChangeModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxChangeModel&&(identical(other.seq, _this.seq) || other.seq == _this.seq)&&(identical(other.threadId, _this.threadId) || other.threadId == _this.threadId)&&(identical(other.listingId, _this.listingId) || other.listingId == _this.listingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InboxChangeModel;
  return Object.hash(runtimeType,_this.seq,_this.threadId,_this.listingId);
}

@override
String toString() {
  final _this = this as InboxChangeModel;
  return 'InboxChangeModel(seq: ${_this.seq}, threadId: ${_this.threadId}, listingId: ${_this.listingId})';
}


}

/// @nodoc
abstract mixin class $InboxChangeModelCopyWith<$Res>  {
  factory $InboxChangeModelCopyWith(InboxChangeModel value, $Res Function(InboxChangeModel) _then) = _$InboxChangeModelCopyWithImpl;
@useResult
$Res call({
 int seq, String threadId, String listingId
});




}
/// @nodoc
class _$InboxChangeModelCopyWithImpl<$Res>
    implements $InboxChangeModelCopyWith<$Res> {
  _$InboxChangeModelCopyWithImpl(this._self, this._then);

  final InboxChangeModel _self;
  final $Res Function(InboxChangeModel) _then;

/// Create a copy of InboxChangeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seq = null,Object? threadId = null,Object? listingId = null,}) {
  return _then(InboxChangeModel(
seq: null == seq ? _self.seq : seq // ignore: cast_nullable_to_non_nullable
as int,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InboxChangeModel].
extension InboxChangeModelPatterns on InboxChangeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxChangeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxChangeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxChangeModel value)  $default,){
final _that = this;
switch (_that) {
case _InboxChangeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxChangeModel value)?  $default,){
final _that = this;
switch (_that) {
case _InboxChangeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int seq,  String threadId,  String listingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxChangeModel() when $default != null:
return $default(_that.seq,_that.threadId,_that.listingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int seq,  String threadId,  String listingId)  $default,) {final _that = this;
switch (_that) {
case _InboxChangeModel():
return $default(_that.seq,_that.threadId,_that.listingId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int seq,  String threadId,  String listingId)?  $default,) {final _that = this;
switch (_that) {
case _InboxChangeModel() when $default != null:
return $default(_that.seq,_that.threadId,_that.listingId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InboxChangeModel implements InboxChangeModel {
  const _InboxChangeModel({required this.seq, required this.threadId, required this.listingId});
  factory _InboxChangeModel.fromJson(Map<String, dynamic> json) => _$InboxChangeModelFromJson(json);

@override final  int seq;
@override final  String threadId;
@override final  String listingId;

/// Create a copy of InboxChangeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxChangeModelCopyWith<_InboxChangeModel> get copyWith => __$InboxChangeModelCopyWithImpl<_InboxChangeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InboxChangeModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxChangeModel&&(identical(other.seq, seq) || other.seq == seq)&&(identical(other.threadId, threadId) || other.threadId == threadId)&&(identical(other.listingId, listingId) || other.listingId == listingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,seq,threadId,listingId);
}

@override
String toString() {
    return 'InboxChangeModel(seq: $seq, threadId: $threadId, listingId: $listingId)';
}


}

/// @nodoc
abstract mixin class _$InboxChangeModelCopyWith<$Res> implements $InboxChangeModelCopyWith<$Res> {
  factory _$InboxChangeModelCopyWith(_InboxChangeModel value, $Res Function(_InboxChangeModel) _then) = __$InboxChangeModelCopyWithImpl;
@override @useResult
$Res call({
 int seq, String threadId, String listingId
});




}
/// @nodoc
class __$InboxChangeModelCopyWithImpl<$Res>
    implements _$InboxChangeModelCopyWith<$Res> {
  __$InboxChangeModelCopyWithImpl(this._self, this._then);

  final _InboxChangeModel _self;
  final $Res Function(_InboxChangeModel) _then;

/// Create a copy of InboxChangeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seq = null,Object? threadId = null,Object? listingId = null,}) {
  return _then(_InboxChangeModel(
seq: null == seq ? _self.seq : seq // ignore: cast_nullable_to_non_nullable
as int,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
