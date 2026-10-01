// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'handled_sale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HandledSale {

 String get id; String get listingId; String get title; SaleRole get role; String get otherName; int get priceBdt; int get deliveryBdt; int get feeBdt; SaleStatus get status; PaymentMethod get method; DateTime get createdAt; int get coverSeed; DisputeReason? get disputeReason; String? get disputeNote; List<Uint8List> get disputePhotos;
/// Create a copy of HandledSale
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HandledSaleCopyWith<HandledSale> get copyWith => _$HandledSaleCopyWithImpl<HandledSale>(this as HandledSale, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HandledSale;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HandledSale&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.listingId, _this.listingId) || other.listingId == _this.listingId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.otherName, _this.otherName) || other.otherName == _this.otherName)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.deliveryBdt, _this.deliveryBdt) || other.deliveryBdt == _this.deliveryBdt)&&(identical(other.feeBdt, _this.feeBdt) || other.feeBdt == _this.feeBdt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.disputeReason, _this.disputeReason) || other.disputeReason == _this.disputeReason)&&(identical(other.disputeNote, _this.disputeNote) || other.disputeNote == _this.disputeNote)&&const DeepCollectionEquality().equals(other.disputePhotos, _this.disputePhotos));
}


@override
int get hashCode {
  final _this = this as HandledSale;
  return Object.hash(runtimeType,_this.id,_this.listingId,_this.title,_this.role,_this.otherName,_this.priceBdt,_this.deliveryBdt,_this.feeBdt,_this.status,_this.method,_this.createdAt,_this.coverSeed,_this.disputeReason,_this.disputeNote,const DeepCollectionEquality().hash(_this.disputePhotos));
}

@override
String toString() {
  final _this = this as HandledSale;
  return 'HandledSale(id: ${_this.id}, listingId: ${_this.listingId}, title: ${_this.title}, role: ${_this.role}, otherName: ${_this.otherName}, priceBdt: ${_this.priceBdt}, deliveryBdt: ${_this.deliveryBdt}, feeBdt: ${_this.feeBdt}, status: ${_this.status}, method: ${_this.method}, createdAt: ${_this.createdAt}, coverSeed: ${_this.coverSeed}, disputeReason: ${_this.disputeReason}, disputeNote: ${_this.disputeNote}, disputePhotos: ${_this.disputePhotos})';
}


}

/// @nodoc
abstract mixin class $HandledSaleCopyWith<$Res>  {
  factory $HandledSaleCopyWith(HandledSale value, $Res Function(HandledSale) _then) = _$HandledSaleCopyWithImpl;
@useResult
$Res call({
 String id, String listingId, String title, SaleRole role, String otherName, int priceBdt, int deliveryBdt, int feeBdt, SaleStatus status, PaymentMethod method, DateTime createdAt, int coverSeed, DisputeReason? disputeReason, String? disputeNote, List<Uint8List> disputePhotos
});




}
/// @nodoc
class _$HandledSaleCopyWithImpl<$Res>
    implements $HandledSaleCopyWith<$Res> {
  _$HandledSaleCopyWithImpl(this._self, this._then);

  final HandledSale _self;
  final $Res Function(HandledSale) _then;

/// Create a copy of HandledSale
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? listingId = null,Object? title = null,Object? role = null,Object? otherName = null,Object? priceBdt = null,Object? deliveryBdt = null,Object? feeBdt = null,Object? status = null,Object? method = null,Object? createdAt = null,Object? coverSeed = null,Object? disputeReason = freezed,Object? disputeNote = freezed,Object? disputePhotos = null,}) {
  return _then(HandledSale(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as SaleRole,otherName: null == otherName ? _self.otherName : otherName // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,deliveryBdt: null == deliveryBdt ? _self.deliveryBdt : deliveryBdt // ignore: cast_nullable_to_non_nullable
as int,feeBdt: null == feeBdt ? _self.feeBdt : feeBdt // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SaleStatus,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,disputeReason: freezed == disputeReason ? _self.disputeReason : disputeReason // ignore: cast_nullable_to_non_nullable
as DisputeReason?,disputeNote: freezed == disputeNote ? _self.disputeNote : disputeNote // ignore: cast_nullable_to_non_nullable
as String?,disputePhotos: null == disputePhotos ? _self.disputePhotos : disputePhotos // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}

}


/// Adds pattern-matching-related methods to [HandledSale].
extension HandledSalePatterns on HandledSale {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HandledSale value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HandledSale() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HandledSale value)  $default,){
final _that = this;
switch (_that) {
case _HandledSale():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HandledSale value)?  $default,){
final _that = this;
switch (_that) {
case _HandledSale() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String listingId,  String title,  SaleRole role,  String otherName,  int priceBdt,  int deliveryBdt,  int feeBdt,  SaleStatus status,  PaymentMethod method,  DateTime createdAt,  int coverSeed,  DisputeReason? disputeReason,  String? disputeNote,  List<Uint8List> disputePhotos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HandledSale() when $default != null:
return $default(_that.id,_that.listingId,_that.title,_that.role,_that.otherName,_that.priceBdt,_that.deliveryBdt,_that.feeBdt,_that.status,_that.method,_that.createdAt,_that.coverSeed,_that.disputeReason,_that.disputeNote,_that.disputePhotos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String listingId,  String title,  SaleRole role,  String otherName,  int priceBdt,  int deliveryBdt,  int feeBdt,  SaleStatus status,  PaymentMethod method,  DateTime createdAt,  int coverSeed,  DisputeReason? disputeReason,  String? disputeNote,  List<Uint8List> disputePhotos)  $default,) {final _that = this;
switch (_that) {
case _HandledSale():
return $default(_that.id,_that.listingId,_that.title,_that.role,_that.otherName,_that.priceBdt,_that.deliveryBdt,_that.feeBdt,_that.status,_that.method,_that.createdAt,_that.coverSeed,_that.disputeReason,_that.disputeNote,_that.disputePhotos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String listingId,  String title,  SaleRole role,  String otherName,  int priceBdt,  int deliveryBdt,  int feeBdt,  SaleStatus status,  PaymentMethod method,  DateTime createdAt,  int coverSeed,  DisputeReason? disputeReason,  String? disputeNote,  List<Uint8List> disputePhotos)?  $default,) {final _that = this;
switch (_that) {
case _HandledSale() when $default != null:
return $default(_that.id,_that.listingId,_that.title,_that.role,_that.otherName,_that.priceBdt,_that.deliveryBdt,_that.feeBdt,_that.status,_that.method,_that.createdAt,_that.coverSeed,_that.disputeReason,_that.disputeNote,_that.disputePhotos);case _:
  return null;

}
}

}

/// @nodoc


class _HandledSale implements HandledSale {
  const _HandledSale({required this.id, required this.listingId, required this.title, required this.role, required this.otherName, required this.priceBdt, required this.deliveryBdt, required this.feeBdt, required this.status, required this.method, required this.createdAt, this.coverSeed = 0, this.disputeReason, this.disputeNote,  List<Uint8List> disputePhotos = const <Uint8List>[]}): _disputePhotos = disputePhotos;
  

@override final  String id;
@override final  String listingId;
@override final  String title;
@override final  SaleRole role;
@override final  String otherName;
@override final  int priceBdt;
@override final  int deliveryBdt;
@override final  int feeBdt;
@override final  SaleStatus status;
@override final  PaymentMethod method;
@override final  DateTime createdAt;
@override@JsonKey() final  int coverSeed;
@override final  DisputeReason? disputeReason;
@override final  String? disputeNote;
 final  List<Uint8List> _disputePhotos;
@override@JsonKey() List<Uint8List> get disputePhotos {
  if (_disputePhotos is EqualUnmodifiableListView) return _disputePhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_disputePhotos);
}


/// Create a copy of HandledSale
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HandledSaleCopyWith<_HandledSale> get copyWith => __$HandledSaleCopyWithImpl<_HandledSale>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HandledSale&&(identical(other.id, id) || other.id == id)&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.title, title) || other.title == title)&&(identical(other.role, role) || other.role == role)&&(identical(other.otherName, otherName) || other.otherName == otherName)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.deliveryBdt, deliveryBdt) || other.deliveryBdt == deliveryBdt)&&(identical(other.feeBdt, feeBdt) || other.feeBdt == feeBdt)&&(identical(other.status, status) || other.status == status)&&(identical(other.method, method) || other.method == method)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.disputeReason, disputeReason) || other.disputeReason == disputeReason)&&(identical(other.disputeNote, disputeNote) || other.disputeNote == disputeNote)&&const DeepCollectionEquality().equals(other.disputePhotos, _disputePhotos));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,listingId,title,role,otherName,priceBdt,deliveryBdt,feeBdt,status,method,createdAt,coverSeed,disputeReason,disputeNote,const DeepCollectionEquality().hash(_disputePhotos));
}

@override
String toString() {
    return 'HandledSale(id: $id, listingId: $listingId, title: $title, role: $role, otherName: $otherName, priceBdt: $priceBdt, deliveryBdt: $deliveryBdt, feeBdt: $feeBdt, status: $status, method: $method, createdAt: $createdAt, coverSeed: $coverSeed, disputeReason: $disputeReason, disputeNote: $disputeNote, disputePhotos: $disputePhotos)';
}


}

/// @nodoc
abstract mixin class _$HandledSaleCopyWith<$Res> implements $HandledSaleCopyWith<$Res> {
  factory _$HandledSaleCopyWith(_HandledSale value, $Res Function(_HandledSale) _then) = __$HandledSaleCopyWithImpl;
@override @useResult
$Res call({
 String id, String listingId, String title, SaleRole role, String otherName, int priceBdt, int deliveryBdt, int feeBdt, SaleStatus status, PaymentMethod method, DateTime createdAt, int coverSeed, DisputeReason? disputeReason, String? disputeNote, List<Uint8List> disputePhotos
});




}
/// @nodoc
class __$HandledSaleCopyWithImpl<$Res>
    implements _$HandledSaleCopyWith<$Res> {
  __$HandledSaleCopyWithImpl(this._self, this._then);

  final _HandledSale _self;
  final $Res Function(_HandledSale) _then;

/// Create a copy of HandledSale
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? listingId = null,Object? title = null,Object? role = null,Object? otherName = null,Object? priceBdt = null,Object? deliveryBdt = null,Object? feeBdt = null,Object? status = null,Object? method = null,Object? createdAt = null,Object? coverSeed = null,Object? disputeReason = freezed,Object? disputeNote = freezed,Object? disputePhotos = null,}) {
  return _then(_HandledSale(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as SaleRole,otherName: null == otherName ? _self.otherName : otherName // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,deliveryBdt: null == deliveryBdt ? _self.deliveryBdt : deliveryBdt // ignore: cast_nullable_to_non_nullable
as int,feeBdt: null == feeBdt ? _self.feeBdt : feeBdt // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SaleStatus,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,disputeReason: freezed == disputeReason ? _self.disputeReason : disputeReason // ignore: cast_nullable_to_non_nullable
as DisputeReason?,disputeNote: freezed == disputeNote ? _self.disputeNote : disputeNote // ignore: cast_nullable_to_non_nullable
as String?,disputePhotos: null == disputePhotos ? _self._disputePhotos : disputePhotos // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

/// @nodoc
mixin _$DisputeDraft {

 String get saleId; DisputeReason get reason; String? get note; List<Uint8List> get photos;
/// Create a copy of DisputeDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisputeDraftCopyWith<DisputeDraft> get copyWith => _$DisputeDraftCopyWithImpl<DisputeDraft>(this as DisputeDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DisputeDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisputeDraft&&(identical(other.saleId, _this.saleId) || other.saleId == _this.saleId)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.note, _this.note) || other.note == _this.note)&&const DeepCollectionEquality().equals(other.photos, _this.photos));
}


@override
int get hashCode {
  final _this = this as DisputeDraft;
  return Object.hash(runtimeType,_this.saleId,_this.reason,_this.note,const DeepCollectionEquality().hash(_this.photos));
}

@override
String toString() {
  final _this = this as DisputeDraft;
  return 'DisputeDraft(saleId: ${_this.saleId}, reason: ${_this.reason}, note: ${_this.note}, photos: ${_this.photos})';
}


}

/// @nodoc
abstract mixin class $DisputeDraftCopyWith<$Res>  {
  factory $DisputeDraftCopyWith(DisputeDraft value, $Res Function(DisputeDraft) _then) = _$DisputeDraftCopyWithImpl;
@useResult
$Res call({
 String saleId, DisputeReason reason, String? note, List<Uint8List> photos
});




}
/// @nodoc
class _$DisputeDraftCopyWithImpl<$Res>
    implements $DisputeDraftCopyWith<$Res> {
  _$DisputeDraftCopyWithImpl(this._self, this._then);

  final DisputeDraft _self;
  final $Res Function(DisputeDraft) _then;

/// Create a copy of DisputeDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? saleId = null,Object? reason = null,Object? note = freezed,Object? photos = null,}) {
  return _then(DisputeDraft(
saleId: null == saleId ? _self.saleId : saleId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as DisputeReason,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}

}


/// Adds pattern-matching-related methods to [DisputeDraft].
extension DisputeDraftPatterns on DisputeDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DisputeDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DisputeDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DisputeDraft value)  $default,){
final _that = this;
switch (_that) {
case _DisputeDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DisputeDraft value)?  $default,){
final _that = this;
switch (_that) {
case _DisputeDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String saleId,  DisputeReason reason,  String? note,  List<Uint8List> photos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DisputeDraft() when $default != null:
return $default(_that.saleId,_that.reason,_that.note,_that.photos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String saleId,  DisputeReason reason,  String? note,  List<Uint8List> photos)  $default,) {final _that = this;
switch (_that) {
case _DisputeDraft():
return $default(_that.saleId,_that.reason,_that.note,_that.photos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String saleId,  DisputeReason reason,  String? note,  List<Uint8List> photos)?  $default,) {final _that = this;
switch (_that) {
case _DisputeDraft() when $default != null:
return $default(_that.saleId,_that.reason,_that.note,_that.photos);case _:
  return null;

}
}

}

/// @nodoc


class _DisputeDraft implements DisputeDraft {
  const _DisputeDraft({required this.saleId, required this.reason, this.note,  List<Uint8List> photos = const <Uint8List>[]}): _photos = photos;
  

@override final  String saleId;
@override final  DisputeReason reason;
@override final  String? note;
 final  List<Uint8List> _photos;
@override@JsonKey() List<Uint8List> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}


/// Create a copy of DisputeDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisputeDraftCopyWith<_DisputeDraft> get copyWith => __$DisputeDraftCopyWithImpl<_DisputeDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisputeDraft&&(identical(other.saleId, saleId) || other.saleId == saleId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.photos, _photos));
}


@override
int get hashCode {
    return Object.hash(runtimeType,saleId,reason,note,const DeepCollectionEquality().hash(_photos));
}

@override
String toString() {
    return 'DisputeDraft(saleId: $saleId, reason: $reason, note: $note, photos: $photos)';
}


}

/// @nodoc
abstract mixin class _$DisputeDraftCopyWith<$Res> implements $DisputeDraftCopyWith<$Res> {
  factory _$DisputeDraftCopyWith(_DisputeDraft value, $Res Function(_DisputeDraft) _then) = __$DisputeDraftCopyWithImpl;
@override @useResult
$Res call({
 String saleId, DisputeReason reason, String? note, List<Uint8List> photos
});




}
/// @nodoc
class __$DisputeDraftCopyWithImpl<$Res>
    implements _$DisputeDraftCopyWith<$Res> {
  __$DisputeDraftCopyWithImpl(this._self, this._then);

  final _DisputeDraft _self;
  final $Res Function(_DisputeDraft) _then;

/// Create a copy of DisputeDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? saleId = null,Object? reason = null,Object? note = freezed,Object? photos = null,}) {
  return _then(_DisputeDraft(
saleId: null == saleId ? _self.saleId : saleId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as DisputeReason,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

// dart format on
