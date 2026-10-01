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

 String get id; String get title; String get sellerName; String get sellerBatch; int get priceBdt; BookCondition get condition; List<String> get flags; List<String> get photos; bool get isNegotiable; HandoverMethod get handover; P2pListingStatus get status; String? get rejectionReason; String? get bookId; int get coverSeed; String? get district; String? get area; String? get category; int? get newPriceBdt;
/// Create a copy of P2pListing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$P2pListingCopyWith<P2pListing> get copyWith => _$P2pListingCopyWithImpl<P2pListing>(this as P2pListing, _$identity);

  /// Serializes this P2pListing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as P2pListing;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is P2pListing&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.sellerName, _this.sellerName) || other.sellerName == _this.sellerName)&&(identical(other.sellerBatch, _this.sellerBatch) || other.sellerBatch == _this.sellerBatch)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.condition, _this.condition) || other.condition == _this.condition)&&const DeepCollectionEquality().equals(other.flags, _this.flags)&&const DeepCollectionEquality().equals(other.photos, _this.photos)&&(identical(other.isNegotiable, _this.isNegotiable) || other.isNegotiable == _this.isNegotiable)&&(identical(other.handover, _this.handover) || other.handover == _this.handover)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.rejectionReason, _this.rejectionReason) || other.rejectionReason == _this.rejectionReason)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.district, _this.district) || other.district == _this.district)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.newPriceBdt, _this.newPriceBdt) || other.newPriceBdt == _this.newPriceBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as P2pListing;
  return Object.hash(runtimeType,_this.id,_this.title,_this.sellerName,_this.sellerBatch,_this.priceBdt,_this.condition,const DeepCollectionEquality().hash(_this.flags),const DeepCollectionEquality().hash(_this.photos),_this.isNegotiable,_this.handover,_this.status,_this.rejectionReason,_this.bookId,_this.coverSeed,_this.district,_this.area,_this.category,_this.newPriceBdt);
}

@override
String toString() {
  final _this = this as P2pListing;
  return 'P2pListing(id: ${_this.id}, title: ${_this.title}, sellerName: ${_this.sellerName}, sellerBatch: ${_this.sellerBatch}, priceBdt: ${_this.priceBdt}, condition: ${_this.condition}, flags: ${_this.flags}, photos: ${_this.photos}, isNegotiable: ${_this.isNegotiable}, handover: ${_this.handover}, status: ${_this.status}, rejectionReason: ${_this.rejectionReason}, bookId: ${_this.bookId}, coverSeed: ${_this.coverSeed}, district: ${_this.district}, area: ${_this.area}, category: ${_this.category}, newPriceBdt: ${_this.newPriceBdt})';
}


}

/// @nodoc
abstract mixin class $P2pListingCopyWith<$Res>  {
  factory $P2pListingCopyWith(P2pListing value, $Res Function(P2pListing) _then) = _$P2pListingCopyWithImpl;
@useResult
$Res call({
 String id, String title, String sellerName, String sellerBatch, int priceBdt, BookCondition condition, List<String> flags, List<String> photos, bool isNegotiable, HandoverMethod handover, P2pListingStatus status, String? rejectionReason, String? bookId, int coverSeed, String? district, String? area, String? category, int? newPriceBdt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? sellerName = null,Object? sellerBatch = null,Object? priceBdt = null,Object? condition = null,Object? flags = null,Object? photos = null,Object? isNegotiable = null,Object? handover = null,Object? status = null,Object? rejectionReason = freezed,Object? bookId = freezed,Object? coverSeed = null,Object? district = freezed,Object? area = freezed,Object? category = freezed,Object? newPriceBdt = freezed,}) {
  return _then(P2pListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,sellerBatch: null == sellerBatch ? _self.sellerBatch : sellerBatch // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,handover: null == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as HandoverMethod,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as P2pListingStatus,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,newPriceBdt: freezed == newPriceBdt ? _self.newPriceBdt : newPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String sellerName,  String sellerBatch,  int priceBdt,  BookCondition condition,  List<String> flags,  List<String> photos,  bool isNegotiable,  HandoverMethod handover,  P2pListingStatus status,  String? rejectionReason,  String? bookId,  int coverSeed,  String? district,  String? area,  String? category,  int? newPriceBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _P2pListing() when $default != null:
return $default(_that.id,_that.title,_that.sellerName,_that.sellerBatch,_that.priceBdt,_that.condition,_that.flags,_that.photos,_that.isNegotiable,_that.handover,_that.status,_that.rejectionReason,_that.bookId,_that.coverSeed,_that.district,_that.area,_that.category,_that.newPriceBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String sellerName,  String sellerBatch,  int priceBdt,  BookCondition condition,  List<String> flags,  List<String> photos,  bool isNegotiable,  HandoverMethod handover,  P2pListingStatus status,  String? rejectionReason,  String? bookId,  int coverSeed,  String? district,  String? area,  String? category,  int? newPriceBdt)  $default,) {final _that = this;
switch (_that) {
case _P2pListing():
return $default(_that.id,_that.title,_that.sellerName,_that.sellerBatch,_that.priceBdt,_that.condition,_that.flags,_that.photos,_that.isNegotiable,_that.handover,_that.status,_that.rejectionReason,_that.bookId,_that.coverSeed,_that.district,_that.area,_that.category,_that.newPriceBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String sellerName,  String sellerBatch,  int priceBdt,  BookCondition condition,  List<String> flags,  List<String> photos,  bool isNegotiable,  HandoverMethod handover,  P2pListingStatus status,  String? rejectionReason,  String? bookId,  int coverSeed,  String? district,  String? area,  String? category,  int? newPriceBdt)?  $default,) {final _that = this;
switch (_that) {
case _P2pListing() when $default != null:
return $default(_that.id,_that.title,_that.sellerName,_that.sellerBatch,_that.priceBdt,_that.condition,_that.flags,_that.photos,_that.isNegotiable,_that.handover,_that.status,_that.rejectionReason,_that.bookId,_that.coverSeed,_that.district,_that.area,_that.category,_that.newPriceBdt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _P2pListing implements P2pListing {
  const _P2pListing({required this.id, required this.title, required this.sellerName, required this.sellerBatch, required this.priceBdt, this.condition = BookCondition.good,  List<String> flags = const [],  List<String> photos = const [], this.isNegotiable = false, this.handover = HandoverMethod.meetInPerson, this.status = P2pListingStatus.live, this.rejectionReason, this.bookId, this.coverSeed = 0, this.district, this.area, this.category, this.newPriceBdt}): _flags = flags,_photos = photos;
  factory _P2pListing.fromJson(Map<String, dynamic> json) => _$P2pListingFromJson(json);

@override final  String id;
@override final  String title;
@override final  String sellerName;
@override final  String sellerBatch;
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
@override final  String? rejectionReason;
@override final  String? bookId;
@override@JsonKey() final  int coverSeed;
@override final  String? district;
@override final  String? area;
@override final  String? category;
@override final  int? newPriceBdt;

/// Create a copy of P2pListing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$P2pListingCopyWith<_P2pListing> get copyWith => __$P2pListingCopyWithImpl<_P2pListing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$P2pListingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _P2pListing&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.sellerBatch, sellerBatch) || other.sellerBatch == sellerBatch)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.condition, condition) || other.condition == condition)&&const DeepCollectionEquality().equals(other.flags, _flags)&&const DeepCollectionEquality().equals(other.photos, _photos)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable)&&(identical(other.handover, handover) || other.handover == handover)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.district, district) || other.district == district)&&(identical(other.area, area) || other.area == area)&&(identical(other.category, category) || other.category == category)&&(identical(other.newPriceBdt, newPriceBdt) || other.newPriceBdt == newPriceBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,sellerName,sellerBatch,priceBdt,condition,const DeepCollectionEquality().hash(_flags),const DeepCollectionEquality().hash(_photos),isNegotiable,handover,status,rejectionReason,bookId,coverSeed,district,area,category,newPriceBdt);
}

@override
String toString() {
    return 'P2pListing(id: $id, title: $title, sellerName: $sellerName, sellerBatch: $sellerBatch, priceBdt: $priceBdt, condition: $condition, flags: $flags, photos: $photos, isNegotiable: $isNegotiable, handover: $handover, status: $status, rejectionReason: $rejectionReason, bookId: $bookId, coverSeed: $coverSeed, district: $district, area: $area, category: $category, newPriceBdt: $newPriceBdt)';
}


}

/// @nodoc
abstract mixin class _$P2pListingCopyWith<$Res> implements $P2pListingCopyWith<$Res> {
  factory _$P2pListingCopyWith(_P2pListing value, $Res Function(_P2pListing) _then) = __$P2pListingCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String sellerName, String sellerBatch, int priceBdt, BookCondition condition, List<String> flags, List<String> photos, bool isNegotiable, HandoverMethod handover, P2pListingStatus status, String? rejectionReason, String? bookId, int coverSeed, String? district, String? area, String? category, int? newPriceBdt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? sellerName = null,Object? sellerBatch = null,Object? priceBdt = null,Object? condition = null,Object? flags = null,Object? photos = null,Object? isNegotiable = null,Object? handover = null,Object? status = null,Object? rejectionReason = freezed,Object? bookId = freezed,Object? coverSeed = null,Object? district = freezed,Object? area = freezed,Object? category = freezed,Object? newPriceBdt = freezed,}) {
  return _then(_P2pListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,sellerBatch: null == sellerBatch ? _self.sellerBatch : sellerBatch // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,flags: null == flags ? _self._flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,handover: null == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as HandoverMethod,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as P2pListingStatus,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,newPriceBdt: freezed == newPriceBdt ? _self.newPriceBdt : newPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
