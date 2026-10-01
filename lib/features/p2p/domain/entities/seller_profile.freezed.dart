// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerReview {

 String get fromName; int get stars; DateTime get at; String? get comment;
/// Create a copy of SellerReview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerReviewCopyWith<SellerReview> get copyWith => _$SellerReviewCopyWithImpl<SellerReview>(this as SellerReview, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SellerReview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerReview&&(identical(other.fromName, _this.fromName) || other.fromName == _this.fromName)&&(identical(other.stars, _this.stars) || other.stars == _this.stars)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.comment, _this.comment) || other.comment == _this.comment));
}


@override
int get hashCode {
  final _this = this as SellerReview;
  return Object.hash(runtimeType,_this.fromName,_this.stars,_this.at,_this.comment);
}

@override
String toString() {
  final _this = this as SellerReview;
  return 'SellerReview(fromName: ${_this.fromName}, stars: ${_this.stars}, at: ${_this.at}, comment: ${_this.comment})';
}


}

/// @nodoc
abstract mixin class $SellerReviewCopyWith<$Res>  {
  factory $SellerReviewCopyWith(SellerReview value, $Res Function(SellerReview) _then) = _$SellerReviewCopyWithImpl;
@useResult
$Res call({
 String fromName, int stars, DateTime at, String? comment
});




}
/// @nodoc
class _$SellerReviewCopyWithImpl<$Res>
    implements $SellerReviewCopyWith<$Res> {
  _$SellerReviewCopyWithImpl(this._self, this._then);

  final SellerReview _self;
  final $Res Function(SellerReview) _then;

/// Create a copy of SellerReview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromName = null,Object? stars = null,Object? at = null,Object? comment = freezed,}) {
  return _then(SellerReview(
fromName: null == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerReview].
extension SellerReviewPatterns on SellerReview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerReview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerReview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerReview value)  $default,){
final _that = this;
switch (_that) {
case _SellerReview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerReview value)?  $default,){
final _that = this;
switch (_that) {
case _SellerReview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromName,  int stars,  DateTime at,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerReview() when $default != null:
return $default(_that.fromName,_that.stars,_that.at,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromName,  int stars,  DateTime at,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _SellerReview():
return $default(_that.fromName,_that.stars,_that.at,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromName,  int stars,  DateTime at,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _SellerReview() when $default != null:
return $default(_that.fromName,_that.stars,_that.at,_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _SellerReview implements SellerReview {
  const _SellerReview({required this.fromName, required this.stars, required this.at, this.comment});
  

@override final  String fromName;
@override final  int stars;
@override final  DateTime at;
@override final  String? comment;

/// Create a copy of SellerReview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerReviewCopyWith<_SellerReview> get copyWith => __$SellerReviewCopyWithImpl<_SellerReview>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerReview&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.at, at) || other.at == at)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode {
    return Object.hash(runtimeType,fromName,stars,at,comment);
}

@override
String toString() {
    return 'SellerReview(fromName: $fromName, stars: $stars, at: $at, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$SellerReviewCopyWith<$Res> implements $SellerReviewCopyWith<$Res> {
  factory _$SellerReviewCopyWith(_SellerReview value, $Res Function(_SellerReview) _then) = __$SellerReviewCopyWithImpl;
@override @useResult
$Res call({
 String fromName, int stars, DateTime at, String? comment
});




}
/// @nodoc
class __$SellerReviewCopyWithImpl<$Res>
    implements _$SellerReviewCopyWith<$Res> {
  __$SellerReviewCopyWithImpl(this._self, this._then);

  final _SellerReview _self;
  final $Res Function(_SellerReview) _then;

/// Create a copy of SellerReview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromName = null,Object? stars = null,Object? at = null,Object? comment = freezed,}) {
  return _then(_SellerReview(
fromName: null == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$SellerProfile {

 String get id; String get name; String get area; String get district; DateTime get memberSince; int get booksSold; int get ratingCount;/// Average stars, `null` before anyone has rated them.
 double? get ratingAverage;/// Newest first.
 List<SellerReview> get reviews;/// On sale or reserved now.
 List<P2pListing> get listings;
/// Create a copy of SellerProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerProfileCopyWith<SellerProfile> get copyWith => _$SellerProfileCopyWithImpl<SellerProfile>(this as SellerProfile, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SellerProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerProfile&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.district, _this.district) || other.district == _this.district)&&(identical(other.memberSince, _this.memberSince) || other.memberSince == _this.memberSince)&&(identical(other.booksSold, _this.booksSold) || other.booksSold == _this.booksSold)&&(identical(other.ratingCount, _this.ratingCount) || other.ratingCount == _this.ratingCount)&&(identical(other.ratingAverage, _this.ratingAverage) || other.ratingAverage == _this.ratingAverage)&&const DeepCollectionEquality().equals(other.reviews, _this.reviews)&&const DeepCollectionEquality().equals(other.listings, _this.listings));
}


@override
int get hashCode {
  final _this = this as SellerProfile;
  return Object.hash(runtimeType,_this.id,_this.name,_this.area,_this.district,_this.memberSince,_this.booksSold,_this.ratingCount,_this.ratingAverage,const DeepCollectionEquality().hash(_this.reviews),const DeepCollectionEquality().hash(_this.listings));
}

@override
String toString() {
  final _this = this as SellerProfile;
  return 'SellerProfile(id: ${_this.id}, name: ${_this.name}, area: ${_this.area}, district: ${_this.district}, memberSince: ${_this.memberSince}, booksSold: ${_this.booksSold}, ratingCount: ${_this.ratingCount}, ratingAverage: ${_this.ratingAverage}, reviews: ${_this.reviews}, listings: ${_this.listings})';
}


}

/// @nodoc
abstract mixin class $SellerProfileCopyWith<$Res>  {
  factory $SellerProfileCopyWith(SellerProfile value, $Res Function(SellerProfile) _then) = _$SellerProfileCopyWithImpl;
@useResult
$Res call({
 String id, String name, String area, String district, DateTime memberSince, int booksSold, int ratingCount, double? ratingAverage, List<SellerReview> reviews, List<P2pListing> listings
});




}
/// @nodoc
class _$SellerProfileCopyWithImpl<$Res>
    implements $SellerProfileCopyWith<$Res> {
  _$SellerProfileCopyWithImpl(this._self, this._then);

  final SellerProfile _self;
  final $Res Function(SellerProfile) _then;

/// Create a copy of SellerProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? area = null,Object? district = null,Object? memberSince = null,Object? booksSold = null,Object? ratingCount = null,Object? ratingAverage = freezed,Object? reviews = null,Object? listings = null,}) {
  return _then(SellerProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,memberSince: null == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime,booksSold: null == booksSold ? _self.booksSold : booksSold // ignore: cast_nullable_to_non_nullable
as int,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,ratingAverage: freezed == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double?,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<SellerReview>,listings: null == listings ? _self.listings : listings // ignore: cast_nullable_to_non_nullable
as List<P2pListing>,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerProfile].
extension SellerProfilePatterns on SellerProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerProfile value)  $default,){
final _that = this;
switch (_that) {
case _SellerProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerProfile value)?  $default,){
final _that = this;
switch (_that) {
case _SellerProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String area,  String district,  DateTime memberSince,  int booksSold,  int ratingCount,  double? ratingAverage,  List<SellerReview> reviews,  List<P2pListing> listings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerProfile() when $default != null:
return $default(_that.id,_that.name,_that.area,_that.district,_that.memberSince,_that.booksSold,_that.ratingCount,_that.ratingAverage,_that.reviews,_that.listings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String area,  String district,  DateTime memberSince,  int booksSold,  int ratingCount,  double? ratingAverage,  List<SellerReview> reviews,  List<P2pListing> listings)  $default,) {final _that = this;
switch (_that) {
case _SellerProfile():
return $default(_that.id,_that.name,_that.area,_that.district,_that.memberSince,_that.booksSold,_that.ratingCount,_that.ratingAverage,_that.reviews,_that.listings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String area,  String district,  DateTime memberSince,  int booksSold,  int ratingCount,  double? ratingAverage,  List<SellerReview> reviews,  List<P2pListing> listings)?  $default,) {final _that = this;
switch (_that) {
case _SellerProfile() when $default != null:
return $default(_that.id,_that.name,_that.area,_that.district,_that.memberSince,_that.booksSold,_that.ratingCount,_that.ratingAverage,_that.reviews,_that.listings);case _:
  return null;

}
}

}

/// @nodoc


class _SellerProfile implements SellerProfile {
  const _SellerProfile({required this.id, required this.name, required this.area, required this.district, required this.memberSince, this.booksSold = 0, this.ratingCount = 0, this.ratingAverage,  List<SellerReview> reviews = const <SellerReview>[],  List<P2pListing> listings = const <P2pListing>[]}): _reviews = reviews,_listings = listings;
  

@override final  String id;
@override final  String name;
@override final  String area;
@override final  String district;
@override final  DateTime memberSince;
@override@JsonKey() final  int booksSold;
@override@JsonKey() final  int ratingCount;
/// Average stars, `null` before anyone has rated them.
@override final  double? ratingAverage;
/// Newest first.
 final  List<SellerReview> _reviews;
/// Newest first.
@override@JsonKey() List<SellerReview> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

/// On sale or reserved now.
 final  List<P2pListing> _listings;
/// On sale or reserved now.
@override@JsonKey() List<P2pListing> get listings {
  if (_listings is EqualUnmodifiableListView) return _listings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listings);
}


/// Create a copy of SellerProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerProfileCopyWith<_SellerProfile> get copyWith => __$SellerProfileCopyWithImpl<_SellerProfile>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.area, area) || other.area == area)&&(identical(other.district, district) || other.district == district)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.booksSold, booksSold) || other.booksSold == booksSold)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.ratingAverage, ratingAverage) || other.ratingAverage == ratingAverage)&&const DeepCollectionEquality().equals(other.reviews, _reviews)&&const DeepCollectionEquality().equals(other.listings, _listings));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,area,district,memberSince,booksSold,ratingCount,ratingAverage,const DeepCollectionEquality().hash(_reviews),const DeepCollectionEquality().hash(_listings));
}

@override
String toString() {
    return 'SellerProfile(id: $id, name: $name, area: $area, district: $district, memberSince: $memberSince, booksSold: $booksSold, ratingCount: $ratingCount, ratingAverage: $ratingAverage, reviews: $reviews, listings: $listings)';
}


}

/// @nodoc
abstract mixin class _$SellerProfileCopyWith<$Res> implements $SellerProfileCopyWith<$Res> {
  factory _$SellerProfileCopyWith(_SellerProfile value, $Res Function(_SellerProfile) _then) = __$SellerProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String area, String district, DateTime memberSince, int booksSold, int ratingCount, double? ratingAverage, List<SellerReview> reviews, List<P2pListing> listings
});




}
/// @nodoc
class __$SellerProfileCopyWithImpl<$Res>
    implements _$SellerProfileCopyWith<$Res> {
  __$SellerProfileCopyWithImpl(this._self, this._then);

  final _SellerProfile _self;
  final $Res Function(_SellerProfile) _then;

/// Create a copy of SellerProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? area = null,Object? district = null,Object? memberSince = null,Object? booksSold = null,Object? ratingCount = null,Object? ratingAverage = freezed,Object? reviews = null,Object? listings = null,}) {
  return _then(_SellerProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,memberSince: null == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime,booksSold: null == booksSold ? _self.booksSold : booksSold // ignore: cast_nullable_to_non_nullable
as int,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,ratingAverage: freezed == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double?,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<SellerReview>,listings: null == listings ? _self._listings : listings // ignore: cast_nullable_to_non_nullable
as List<P2pListing>,
  ));
}


}

// dart format on
