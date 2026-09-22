// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VendorQuote {

 String get vendor; int get priceBdt; bool get isLowest;
/// Create a copy of VendorQuote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VendorQuoteCopyWith<VendorQuote> get copyWith => _$VendorQuoteCopyWithImpl<VendorQuote>(this as VendorQuote, _$identity);

  /// Serializes this VendorQuote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VendorQuote;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VendorQuote&&(identical(other.vendor, _this.vendor) || other.vendor == _this.vendor)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.isLowest, _this.isLowest) || other.isLowest == _this.isLowest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VendorQuote;
  return Object.hash(runtimeType,_this.vendor,_this.priceBdt,_this.isLowest);
}

@override
String toString() {
  final _this = this as VendorQuote;
  return 'VendorQuote(vendor: ${_this.vendor}, priceBdt: ${_this.priceBdt}, isLowest: ${_this.isLowest})';
}


}

/// @nodoc
abstract mixin class $VendorQuoteCopyWith<$Res>  {
  factory $VendorQuoteCopyWith(VendorQuote value, $Res Function(VendorQuote) _then) = _$VendorQuoteCopyWithImpl;
@useResult
$Res call({
 String vendor, int priceBdt, bool isLowest
});




}
/// @nodoc
class _$VendorQuoteCopyWithImpl<$Res>
    implements $VendorQuoteCopyWith<$Res> {
  _$VendorQuoteCopyWithImpl(this._self, this._then);

  final VendorQuote _self;
  final $Res Function(VendorQuote) _then;

/// Create a copy of VendorQuote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vendor = null,Object? priceBdt = null,Object? isLowest = null,}) {
  return _then(VendorQuote(
vendor: null == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,isLowest: null == isLowest ? _self.isLowest : isLowest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VendorQuote].
extension VendorQuotePatterns on VendorQuote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VendorQuote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VendorQuote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VendorQuote value)  $default,){
final _that = this;
switch (_that) {
case _VendorQuote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VendorQuote value)?  $default,){
final _that = this;
switch (_that) {
case _VendorQuote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String vendor,  int priceBdt,  bool isLowest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VendorQuote() when $default != null:
return $default(_that.vendor,_that.priceBdt,_that.isLowest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String vendor,  int priceBdt,  bool isLowest)  $default,) {final _that = this;
switch (_that) {
case _VendorQuote():
return $default(_that.vendor,_that.priceBdt,_that.isLowest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String vendor,  int priceBdt,  bool isLowest)?  $default,) {final _that = this;
switch (_that) {
case _VendorQuote() when $default != null:
return $default(_that.vendor,_that.priceBdt,_that.isLowest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VendorQuote implements VendorQuote {
  const _VendorQuote({required this.vendor, required this.priceBdt, this.isLowest = false});
  factory _VendorQuote.fromJson(Map<String, dynamic> json) => _$VendorQuoteFromJson(json);

@override final  String vendor;
@override final  int priceBdt;
@override@JsonKey() final  bool isLowest;

/// Create a copy of VendorQuote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VendorQuoteCopyWith<_VendorQuote> get copyWith => __$VendorQuoteCopyWithImpl<_VendorQuote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VendorQuoteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VendorQuote&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.isLowest, isLowest) || other.isLowest == isLowest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,vendor,priceBdt,isLowest);
}

@override
String toString() {
    return 'VendorQuote(vendor: $vendor, priceBdt: $priceBdt, isLowest: $isLowest)';
}


}

/// @nodoc
abstract mixin class _$VendorQuoteCopyWith<$Res> implements $VendorQuoteCopyWith<$Res> {
  factory _$VendorQuoteCopyWith(_VendorQuote value, $Res Function(_VendorQuote) _then) = __$VendorQuoteCopyWithImpl;
@override @useResult
$Res call({
 String vendor, int priceBdt, bool isLowest
});




}
/// @nodoc
class __$VendorQuoteCopyWithImpl<$Res>
    implements _$VendorQuoteCopyWith<$Res> {
  __$VendorQuoteCopyWithImpl(this._self, this._then);

  final _VendorQuote _self;
  final $Res Function(_VendorQuote) _then;

/// Create a copy of VendorQuote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vendor = null,Object? priceBdt = null,Object? isLowest = null,}) {
  return _then(_VendorQuote(
vendor: null == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,isLowest: null == isLowest ? _self.isLowest : isLowest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ChatMessage {

 String get id; ChatRole get role; String get text; String? get recommendedBookId; List<VendorQuote> get quotes;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChatMessage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.recommendedBookId, _this.recommendedBookId) || other.recommendedBookId == _this.recommendedBookId)&&const DeepCollectionEquality().equals(other.quotes, _this.quotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChatMessage;
  return Object.hash(runtimeType,_this.id,_this.role,_this.text,_this.recommendedBookId,const DeepCollectionEquality().hash(_this.quotes));
}

@override
String toString() {
  final _this = this as ChatMessage;
  return 'ChatMessage(id: ${_this.id}, role: ${_this.role}, text: ${_this.text}, recommendedBookId: ${_this.recommendedBookId}, quotes: ${_this.quotes})';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String id, ChatRole role, String text, String? recommendedBookId, List<VendorQuote> quotes
});




}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? text = null,Object? recommendedBookId = freezed,Object? quotes = null,}) {
  return _then(ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatRole,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,recommendedBookId: freezed == recommendedBookId ? _self.recommendedBookId : recommendedBookId // ignore: cast_nullable_to_non_nullable
as String?,quotes: null == quotes ? _self.quotes : quotes // ignore: cast_nullable_to_non_nullable
as List<VendorQuote>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ChatRole role,  String text,  String? recommendedBookId,  List<VendorQuote> quotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.role,_that.text,_that.recommendedBookId,_that.quotes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ChatRole role,  String text,  String? recommendedBookId,  List<VendorQuote> quotes)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.id,_that.role,_that.text,_that.recommendedBookId,_that.quotes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ChatRole role,  String text,  String? recommendedBookId,  List<VendorQuote> quotes)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.role,_that.text,_that.recommendedBookId,_that.quotes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessage implements ChatMessage {
  const _ChatMessage({required this.id, required this.role, required this.text, this.recommendedBookId,  List<VendorQuote> quotes = const <VendorQuote>[]}): _quotes = quotes;
  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

@override final  String id;
@override final  ChatRole role;
@override final  String text;
@override final  String? recommendedBookId;
 final  List<VendorQuote> _quotes;
@override@JsonKey() List<VendorQuote> get quotes {
  if (_quotes is EqualUnmodifiableListView) return _quotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quotes);
}


/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.text, text) || other.text == text)&&(identical(other.recommendedBookId, recommendedBookId) || other.recommendedBookId == recommendedBookId)&&const DeepCollectionEquality().equals(other.quotes, _quotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,role,text,recommendedBookId,const DeepCollectionEquality().hash(_quotes));
}

@override
String toString() {
    return 'ChatMessage(id: $id, role: $role, text: $text, recommendedBookId: $recommendedBookId, quotes: $quotes)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, ChatRole role, String text, String? recommendedBookId, List<VendorQuote> quotes
});




}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? text = null,Object? recommendedBookId = freezed,Object? quotes = null,}) {
  return _then(_ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatRole,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,recommendedBookId: freezed == recommendedBookId ? _self.recommendedBookId : recommendedBookId // ignore: cast_nullable_to_non_nullable
as String?,quotes: null == quotes ? _self._quotes : quotes // ignore: cast_nullable_to_non_nullable
as List<VendorQuote>,
  ));
}


}

// dart format on
