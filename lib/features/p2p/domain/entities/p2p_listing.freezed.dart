// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'p2p_listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$P2pListing {

 String get id; String get title; String get sellerId; String get sellerName; int get priceBdt; BookCondition get condition; List<String> get flags; List<String> get photos; bool get isNegotiable; HandoverMethod get handover; P2pListingStatus get status;/// The signed-in reader is the seller. The server works this out.
 bool get isMine;/// Reserved for, or sold to, the signed-in reader.
 bool get isMyDeal; String? get rejectionReason; String? get bookId; int get coverSeed; String? get district; String? get area; String? get category; int? get newPriceBdt;/// The seller's own words about the copy.
 String? get note;
/// Create a copy of P2pListing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$P2pListingCopyWith<P2pListing> get copyWith => _$P2pListingCopyWithImpl<P2pListing>(this as P2pListing, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as P2pListing;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is P2pListing&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.sellerId, _this.sellerId) || other.sellerId == _this.sellerId)&&(identical(other.sellerName, _this.sellerName) || other.sellerName == _this.sellerName)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.condition, _this.condition) || other.condition == _this.condition)&&const DeepCollectionEquality().equals(other.flags, _this.flags)&&const DeepCollectionEquality().equals(other.photos, _this.photos)&&(identical(other.isNegotiable, _this.isNegotiable) || other.isNegotiable == _this.isNegotiable)&&(identical(other.handover, _this.handover) || other.handover == _this.handover)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.isMine, _this.isMine) || other.isMine == _this.isMine)&&(identical(other.isMyDeal, _this.isMyDeal) || other.isMyDeal == _this.isMyDeal)&&(identical(other.rejectionReason, _this.rejectionReason) || other.rejectionReason == _this.rejectionReason)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.district, _this.district) || other.district == _this.district)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.newPriceBdt, _this.newPriceBdt) || other.newPriceBdt == _this.newPriceBdt)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as P2pListing;
  return Object.hashAll([runtimeType,_this.id,_this.title,_this.sellerId,_this.sellerName,_this.priceBdt,_this.condition,const DeepCollectionEquality().hash(_this.flags),const DeepCollectionEquality().hash(_this.photos),_this.isNegotiable,_this.handover,_this.status,_this.isMine,_this.isMyDeal,_this.rejectionReason,_this.bookId,_this.coverSeed,_this.district,_this.area,_this.category,_this.newPriceBdt,_this.note]);
}

@override
String toString() {
  final _this = this as P2pListing;
  return 'P2pListing(id: ${_this.id}, title: ${_this.title}, sellerId: ${_this.sellerId}, sellerName: ${_this.sellerName}, priceBdt: ${_this.priceBdt}, condition: ${_this.condition}, flags: ${_this.flags}, photos: ${_this.photos}, isNegotiable: ${_this.isNegotiable}, handover: ${_this.handover}, status: ${_this.status}, isMine: ${_this.isMine}, isMyDeal: ${_this.isMyDeal}, rejectionReason: ${_this.rejectionReason}, bookId: ${_this.bookId}, coverSeed: ${_this.coverSeed}, district: ${_this.district}, area: ${_this.area}, category: ${_this.category}, newPriceBdt: ${_this.newPriceBdt}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $P2pListingCopyWith<$Res>  {
  factory $P2pListingCopyWith(P2pListing value, $Res Function(P2pListing) _then) = _$P2pListingCopyWithImpl;
@useResult
$Res call({
 String id, String title, String sellerId, String sellerName, int priceBdt, BookCondition condition, List<String> flags, List<String> photos, bool isNegotiable, HandoverMethod handover, P2pListingStatus status, bool isMine, bool isMyDeal, String? rejectionReason, String? bookId, int coverSeed, String? district, String? area, String? category, int? newPriceBdt, String? note
});




}
/// @nodoc
class _$P2pListingCopyWithImpl<$Res>
    implements $P2pListingCopyWith<$Res> {
  _$P2pListingCopyWithImpl(this._self, this._then);

  final P2pListing _self;
  final $Res Function(P2pListing) _then;

/// Create a copy of P2pListing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? sellerId = null,Object? sellerName = null,Object? priceBdt = null,Object? condition = null,Object? flags = null,Object? photos = null,Object? isNegotiable = null,Object? handover = null,Object? status = null,Object? isMine = null,Object? isMyDeal = null,Object? rejectionReason = freezed,Object? bookId = freezed,Object? coverSeed = null,Object? district = freezed,Object? area = freezed,Object? category = freezed,Object? newPriceBdt = freezed,Object? note = freezed,}) {
  return _then(P2pListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,handover: null == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as HandoverMethod,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as P2pListingStatus,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,isMyDeal: null == isMyDeal ? _self.isMyDeal : isMyDeal // ignore: cast_nullable_to_non_nullable
as bool,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,newPriceBdt: freezed == newPriceBdt ? _self.newPriceBdt : newPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [P2pListing].
extension P2pListingPatterns on P2pListing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _P2pListing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _P2pListing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _P2pListing value)  $default,){
final _that = this;
switch (_that) {
case _P2pListing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _P2pListing value)?  $default,){
final _that = this;
switch (_that) {
case _P2pListing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String sellerId,  String sellerName,  int priceBdt,  BookCondition condition,  List<String> flags,  List<String> photos,  bool isNegotiable,  HandoverMethod handover,  P2pListingStatus status,  bool isMine,  bool isMyDeal,  String? rejectionReason,  String? bookId,  int coverSeed,  String? district,  String? area,  String? category,  int? newPriceBdt,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _P2pListing() when $default != null:
return $default(_that.id,_that.title,_that.sellerId,_that.sellerName,_that.priceBdt,_that.condition,_that.flags,_that.photos,_that.isNegotiable,_that.handover,_that.status,_that.isMine,_that.isMyDeal,_that.rejectionReason,_that.bookId,_that.coverSeed,_that.district,_that.area,_that.category,_that.newPriceBdt,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String sellerId,  String sellerName,  int priceBdt,  BookCondition condition,  List<String> flags,  List<String> photos,  bool isNegotiable,  HandoverMethod handover,  P2pListingStatus status,  bool isMine,  bool isMyDeal,  String? rejectionReason,  String? bookId,  int coverSeed,  String? district,  String? area,  String? category,  int? newPriceBdt,  String? note)  $default,) {final _that = this;
switch (_that) {
case _P2pListing():
return $default(_that.id,_that.title,_that.sellerId,_that.sellerName,_that.priceBdt,_that.condition,_that.flags,_that.photos,_that.isNegotiable,_that.handover,_that.status,_that.isMine,_that.isMyDeal,_that.rejectionReason,_that.bookId,_that.coverSeed,_that.district,_that.area,_that.category,_that.newPriceBdt,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String sellerId,  String sellerName,  int priceBdt,  BookCondition condition,  List<String> flags,  List<String> photos,  bool isNegotiable,  HandoverMethod handover,  P2pListingStatus status,  bool isMine,  bool isMyDeal,  String? rejectionReason,  String? bookId,  int coverSeed,  String? district,  String? area,  String? category,  int? newPriceBdt,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _P2pListing() when $default != null:
return $default(_that.id,_that.title,_that.sellerId,_that.sellerName,_that.priceBdt,_that.condition,_that.flags,_that.photos,_that.isNegotiable,_that.handover,_that.status,_that.isMine,_that.isMyDeal,_that.rejectionReason,_that.bookId,_that.coverSeed,_that.district,_that.area,_that.category,_that.newPriceBdt,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _P2pListing implements P2pListing {
  const _P2pListing({required this.id, required this.title, required this.sellerId, required this.sellerName, required this.priceBdt, this.condition = BookCondition.good,  List<String> flags = const <String>[],  List<String> photos = const <String>[], this.isNegotiable = false, this.handover = HandoverMethod.meetInPerson, this.status = P2pListingStatus.live, this.isMine = false, this.isMyDeal = false, this.rejectionReason, this.bookId, this.coverSeed = 0, this.district, this.area, this.category, this.newPriceBdt, this.note}): _flags = flags,_photos = photos;
  

@override final  String id;
@override final  String title;
@override final  String sellerId;
@override final  String sellerName;
@override final  int priceBdt;
@override@JsonKey() final  BookCondition condition;
 final  List<String> _flags;
@override@JsonKey() List<String> get flags {
  if (_flags is EqualUnmodifiableListView) return _flags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flags);
}

 final  List<String> _photos;
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override@JsonKey() final  bool isNegotiable;
@override@JsonKey() final  HandoverMethod handover;
@override@JsonKey() final  P2pListingStatus status;
/// The signed-in reader is the seller. The server works this out.
@override@JsonKey() final  bool isMine;
/// Reserved for, or sold to, the signed-in reader.
@override@JsonKey() final  bool isMyDeal;
@override final  String? rejectionReason;
@override final  String? bookId;
@override@JsonKey() final  int coverSeed;
@override final  String? district;
@override final  String? area;
@override final  String? category;
@override final  int? newPriceBdt;
/// The seller's own words about the copy.
@override final  String? note;

/// Create a copy of P2pListing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$P2pListingCopyWith<_P2pListing> get copyWith => __$P2pListingCopyWithImpl<_P2pListing>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _P2pListing&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.condition, condition) || other.condition == condition)&&const DeepCollectionEquality().equals(other.flags, _flags)&&const DeepCollectionEquality().equals(other.photos, _photos)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable)&&(identical(other.handover, handover) || other.handover == handover)&&(identical(other.status, status) || other.status == status)&&(identical(other.isMine, isMine) || other.isMine == isMine)&&(identical(other.isMyDeal, isMyDeal) || other.isMyDeal == isMyDeal)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.district, district) || other.district == district)&&(identical(other.area, area) || other.area == area)&&(identical(other.category, category) || other.category == category)&&(identical(other.newPriceBdt, newPriceBdt) || other.newPriceBdt == newPriceBdt)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hashAll([runtimeType,id,title,sellerId,sellerName,priceBdt,condition,const DeepCollectionEquality().hash(_flags),const DeepCollectionEquality().hash(_photos),isNegotiable,handover,status,isMine,isMyDeal,rejectionReason,bookId,coverSeed,district,area,category,newPriceBdt,note]);
}

@override
String toString() {
    return 'P2pListing(id: $id, title: $title, sellerId: $sellerId, sellerName: $sellerName, priceBdt: $priceBdt, condition: $condition, flags: $flags, photos: $photos, isNegotiable: $isNegotiable, handover: $handover, status: $status, isMine: $isMine, isMyDeal: $isMyDeal, rejectionReason: $rejectionReason, bookId: $bookId, coverSeed: $coverSeed, district: $district, area: $area, category: $category, newPriceBdt: $newPriceBdt, note: $note)';
}


}

/// @nodoc
abstract mixin class _$P2pListingCopyWith<$Res> implements $P2pListingCopyWith<$Res> {
  factory _$P2pListingCopyWith(_P2pListing value, $Res Function(_P2pListing) _then) = __$P2pListingCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String sellerId, String sellerName, int priceBdt, BookCondition condition, List<String> flags, List<String> photos, bool isNegotiable, HandoverMethod handover, P2pListingStatus status, bool isMine, bool isMyDeal, String? rejectionReason, String? bookId, int coverSeed, String? district, String? area, String? category, int? newPriceBdt, String? note
});




}
/// @nodoc
class __$P2pListingCopyWithImpl<$Res>
    implements _$P2pListingCopyWith<$Res> {
  __$P2pListingCopyWithImpl(this._self, this._then);

  final _P2pListing _self;
  final $Res Function(_P2pListing) _then;

/// Create a copy of P2pListing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? sellerId = null,Object? sellerName = null,Object? priceBdt = null,Object? condition = null,Object? flags = null,Object? photos = null,Object? isNegotiable = null,Object? handover = null,Object? status = null,Object? isMine = null,Object? isMyDeal = null,Object? rejectionReason = freezed,Object? bookId = freezed,Object? coverSeed = null,Object? district = freezed,Object? area = freezed,Object? category = freezed,Object? newPriceBdt = freezed,Object? note = freezed,}) {
  return _then(_P2pListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,flags: null == flags ? _self._flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,handover: null == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as HandoverMethod,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as P2pListingStatus,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,isMyDeal: null == isMyDeal ? _self.isMyDeal : isMyDeal // ignore: cast_nullable_to_non_nullable
as bool,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,newPriceBdt: freezed == newPriceBdt ? _self.newPriceBdt : newPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
