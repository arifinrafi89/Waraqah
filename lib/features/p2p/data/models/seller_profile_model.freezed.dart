// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SellerReviewModel {

 String get fromName; int get stars; DateTime get at; String? get comment;
/// Create a copy of SellerReviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerReviewModelCopyWith<SellerReviewModel> get copyWith => _$SellerReviewModelCopyWithImpl<SellerReviewModel>(this as SellerReviewModel, _$identity);

  /// Serializes this SellerReviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SellerReviewModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerReviewModel&&(identical(other.fromName, _this.fromName) || other.fromName == _this.fromName)&&(identical(other.stars, _this.stars) || other.stars == _this.stars)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.comment, _this.comment) || other.comment == _this.comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SellerReviewModel;
  return Object.hash(runtimeType,_this.fromName,_this.stars,_this.at,_this.comment);
}

@override
String toString() {
  final _this = this as SellerReviewModel;
  return 'SellerReviewModel(fromName: ${_this.fromName}, stars: ${_this.stars}, at: ${_this.at}, comment: ${_this.comment})';
}


}

/// @nodoc
abstract mixin class $SellerReviewModelCopyWith<$Res>  {
  factory $SellerReviewModelCopyWith(SellerReviewModel value, $Res Function(SellerReviewModel) _then) = _$SellerReviewModelCopyWithImpl;
@useResult
$Res call({
 String fromName, int stars, DateTime at, String? comment
});




}
/// @nodoc
class _$SellerReviewModelCopyWithImpl<$Res>
    implements $SellerReviewModelCopyWith<$Res> {
  _$SellerReviewModelCopyWithImpl(this._self, this._then);

  final SellerReviewModel _self;
  final $Res Function(SellerReviewModel) _then;

/// Create a copy of SellerReviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromName = null,Object? stars = null,Object? at = null,Object? comment = freezed,}) {
  return _then(SellerReviewModel(
fromName: null == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerReviewModel].
extension SellerReviewModelPatterns on SellerReviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerReviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerReviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerReviewModel value)  $default,){
final _that = this;
switch (_that) {
case _SellerReviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerReviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _SellerReviewModel() when $default != null:
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
case _SellerReviewModel() when $default != null:
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
case _SellerReviewModel():
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
case _SellerReviewModel() when $default != null:
return $default(_that.fromName,_that.stars,_that.at,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerReviewModel implements SellerReviewModel {
  const _SellerReviewModel({required this.fromName, required this.stars, required this.at, this.comment});
  factory _SellerReviewModel.fromJson(Map<String, dynamic> json) => _$SellerReviewModelFromJson(json);

@override final  String fromName;
@override final  int stars;
@override final  DateTime at;
@override final  String? comment;

/// Create a copy of SellerReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerReviewModelCopyWith<_SellerReviewModel> get copyWith => __$SellerReviewModelCopyWithImpl<_SellerReviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerReviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerReviewModel&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.at, at) || other.at == at)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fromName,stars,at,comment);
}

@override
String toString() {
    return 'SellerReviewModel(fromName: $fromName, stars: $stars, at: $at, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$SellerReviewModelCopyWith<$Res> implements $SellerReviewModelCopyWith<$Res> {
  factory _$SellerReviewModelCopyWith(_SellerReviewModel value, $Res Function(_SellerReviewModel) _then) = __$SellerReviewModelCopyWithImpl;
@override @useResult
$Res call({
 String fromName, int stars, DateTime at, String? comment
});




}
/// @nodoc
class __$SellerReviewModelCopyWithImpl<$Res>
    implements _$SellerReviewModelCopyWith<$Res> {
  __$SellerReviewModelCopyWithImpl(this._self, this._then);

  final _SellerReviewModel _self;
  final $Res Function(_SellerReviewModel) _then;

/// Create a copy of SellerReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromName = null,Object? stars = null,Object? at = null,Object? comment = freezed,}) {
  return _then(_SellerReviewModel(
fromName: null == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SellerProfileModel {

 String get id; String get name; String get area; String get district; DateTime get memberSince; int get booksSold; int get ratingCount; double? get ratingAverage; List<SellerReviewModel> get reviews; List<P2pListingModel> get listings;
/// Create a copy of SellerProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerProfileModelCopyWith<SellerProfileModel> get copyWith => _$SellerProfileModelCopyWithImpl<SellerProfileModel>(this as SellerProfileModel, _$identity);

  /// Serializes this SellerProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SellerProfileModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerProfileModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.district, _this.district) || other.district == _this.district)&&(identical(other.memberSince, _this.memberSince) || other.memberSince == _this.memberSince)&&(identical(other.booksSold, _this.booksSold) || other.booksSold == _this.booksSold)&&(identical(other.ratingCount, _this.ratingCount) || other.ratingCount == _this.ratingCount)&&(identical(other.ratingAverage, _this.ratingAverage) || other.ratingAverage == _this.ratingAverage)&&const DeepCollectionEquality().equals(other.reviews, _this.reviews)&&const DeepCollectionEquality().equals(other.listings, _this.listings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SellerProfileModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.area,_this.district,_this.memberSince,_this.booksSold,_this.ratingCount,_this.ratingAverage,const DeepCollectionEquality().hash(_this.reviews),const DeepCollectionEquality().hash(_this.listings));
}

@override
String toString() {
  final _this = this as SellerProfileModel;
  return 'SellerProfileModel(id: ${_this.id}, name: ${_this.name}, area: ${_this.area}, district: ${_this.district}, memberSince: ${_this.memberSince}, booksSold: ${_this.booksSold}, ratingCount: ${_this.ratingCount}, ratingAverage: ${_this.ratingAverage}, reviews: ${_this.reviews}, listings: ${_this.listings})';
}


}

/// @nodoc
abstract mixin class $SellerProfileModelCopyWith<$Res>  {
  factory $SellerProfileModelCopyWith(SellerProfileModel value, $Res Function(SellerProfileModel) _then) = _$SellerProfileModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String area, String district, DateTime memberSince, int booksSold, int ratingCount, double? ratingAverage, List<SellerReviewModel> reviews, List<P2pListingModel> listings
});




}
/// @nodoc
class _$SellerProfileModelCopyWithImpl<$Res>
    implements $SellerProfileModelCopyWith<$Res> {
  _$SellerProfileModelCopyWithImpl(this._self, this._then);

  final SellerProfileModel _self;
  final $Res Function(SellerProfileModel) _then;

/// Create a copy of SellerProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? area = null,Object? district = null,Object? memberSince = null,Object? booksSold = null,Object? ratingCount = null,Object? ratingAverage = freezed,Object? reviews = null,Object? listings = null,}) {
  return _then(SellerProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,memberSince: null == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime,booksSold: null == booksSold ? _self.booksSold : booksSold // ignore: cast_nullable_to_non_nullable
as int,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,ratingAverage: freezed == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double?,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<SellerReviewModel>,listings: null == listings ? _self.listings : listings // ignore: cast_nullable_to_non_nullable
as List<P2pListingModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerProfileModel].
extension SellerProfileModelPatterns on SellerProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _SellerProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _SellerProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String area,  String district,  DateTime memberSince,  int booksSold,  int ratingCount,  double? ratingAverage,  List<SellerReviewModel> reviews,  List<P2pListingModel> listings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerProfileModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String area,  String district,  DateTime memberSince,  int booksSold,  int ratingCount,  double? ratingAverage,  List<SellerReviewModel> reviews,  List<P2pListingModel> listings)  $default,) {final _that = this;
switch (_that) {
case _SellerProfileModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String area,  String district,  DateTime memberSince,  int booksSold,  int ratingCount,  double? ratingAverage,  List<SellerReviewModel> reviews,  List<P2pListingModel> listings)?  $default,) {final _that = this;
switch (_that) {
case _SellerProfileModel() when $default != null:
return $default(_that.id,_that.name,_that.area,_that.district,_that.memberSince,_that.booksSold,_that.ratingCount,_that.ratingAverage,_that.reviews,_that.listings);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SellerProfileModel implements SellerProfileModel {
  const _SellerProfileModel({required this.id, required this.name, required this.area, required this.district, required this.memberSince, this.booksSold = 0, this.ratingCount = 0, this.ratingAverage,  List<SellerReviewModel> reviews = const <SellerReviewModel>[],  List<P2pListingModel> listings = const <P2pListingModel>[]}): _reviews = reviews,_listings = listings;
  factory _SellerProfileModel.fromJson(Map<String, dynamic> json) => _$SellerProfileModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String area;
@override final  String district;
@override final  DateTime memberSince;
@override@JsonKey() final  int booksSold;
@override@JsonKey() final  int ratingCount;
@override final  double? ratingAverage;
 final  List<SellerReviewModel> _reviews;
@override@JsonKey() List<SellerReviewModel> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

 final  List<P2pListingModel> _listings;
@override@JsonKey() List<P2pListingModel> get listings {
  if (_listings is EqualUnmodifiableListView) return _listings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listings);
}


/// Create a copy of SellerProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerProfileModelCopyWith<_SellerProfileModel> get copyWith => __$SellerProfileModelCopyWithImpl<_SellerProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.area, area) || other.area == area)&&(identical(other.district, district) || other.district == district)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.booksSold, booksSold) || other.booksSold == booksSold)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.ratingAverage, ratingAverage) || other.ratingAverage == ratingAverage)&&const DeepCollectionEquality().equals(other.reviews, _reviews)&&const DeepCollectionEquality().equals(other.listings, _listings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,area,district,memberSince,booksSold,ratingCount,ratingAverage,const DeepCollectionEquality().hash(_reviews),const DeepCollectionEquality().hash(_listings));
}

@override
String toString() {
    return 'SellerProfileModel(id: $id, name: $name, area: $area, district: $district, memberSince: $memberSince, booksSold: $booksSold, ratingCount: $ratingCount, ratingAverage: $ratingAverage, reviews: $reviews, listings: $listings)';
}


}

/// @nodoc
abstract mixin class _$SellerProfileModelCopyWith<$Res> implements $SellerProfileModelCopyWith<$Res> {
  factory _$SellerProfileModelCopyWith(_SellerProfileModel value, $Res Function(_SellerProfileModel) _then) = __$SellerProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String area, String district, DateTime memberSince, int booksSold, int ratingCount, double? ratingAverage, List<SellerReviewModel> reviews, List<P2pListingModel> listings
});




}
/// @nodoc
class __$SellerProfileModelCopyWithImpl<$Res>
    implements _$SellerProfileModelCopyWith<$Res> {
  __$SellerProfileModelCopyWithImpl(this._self, this._then);

  final _SellerProfileModel _self;
  final $Res Function(_SellerProfileModel) _then;

/// Create a copy of SellerProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? area = null,Object? district = null,Object? memberSince = null,Object? booksSold = null,Object? ratingCount = null,Object? ratingAverage = freezed,Object? reviews = null,Object? listings = null,}) {
  return _then(_SellerProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,memberSince: null == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime,booksSold: null == booksSold ? _self.booksSold : booksSold // ignore: cast_nullable_to_non_nullable
as int,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,ratingAverage: freezed == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double?,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<SellerReviewModel>,listings: null == listings ? _self._listings : listings // ignore: cast_nullable_to_non_nullable
as List<P2pListingModel>,
  ));
}


}

// dart format on
