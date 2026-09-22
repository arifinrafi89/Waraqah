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

 String get id; String get title; String get sellerName; String get sellerBatch; int get priceBdt; BookCondition get condition; int get coverSeed;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is P2pListing&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.sellerName, _this.sellerName) || other.sellerName == _this.sellerName)&&(identical(other.sellerBatch, _this.sellerBatch) || other.sellerBatch == _this.sellerBatch)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.condition, _this.condition) || other.condition == _this.condition)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as P2pListing;
  return Object.hash(runtimeType,_this.id,_this.title,_this.sellerName,_this.sellerBatch,_this.priceBdt,_this.condition,_this.coverSeed);
}

@override
String toString() {
  final _this = this as P2pListing;
  return 'P2pListing(id: ${_this.id}, title: ${_this.title}, sellerName: ${_this.sellerName}, sellerBatch: ${_this.sellerBatch}, priceBdt: ${_this.priceBdt}, condition: ${_this.condition}, coverSeed: ${_this.coverSeed})';
}


}

/// @nodoc
abstract mixin class $P2pListingCopyWith<$Res>  {
  factory $P2pListingCopyWith(P2pListing value, $Res Function(P2pListing) _then) = _$P2pListingCopyWithImpl;
@useResult
$Res call({
 String id, String title, String sellerName, String sellerBatch, int priceBdt, BookCondition condition, int coverSeed
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? sellerName = null,Object? sellerBatch = null,Object? priceBdt = null,Object? condition = null,Object? coverSeed = null,}) {
  return _then(P2pListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,sellerBatch: null == sellerBatch ? _self.sellerBatch : sellerBatch // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String sellerName,  String sellerBatch,  int priceBdt,  BookCondition condition,  int coverSeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _P2pListing() when $default != null:
return $default(_that.id,_that.title,_that.sellerName,_that.sellerBatch,_that.priceBdt,_that.condition,_that.coverSeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String sellerName,  String sellerBatch,  int priceBdt,  BookCondition condition,  int coverSeed)  $default,) {final _that = this;
switch (_that) {
case _P2pListing():
return $default(_that.id,_that.title,_that.sellerName,_that.sellerBatch,_that.priceBdt,_that.condition,_that.coverSeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String sellerName,  String sellerBatch,  int priceBdt,  BookCondition condition,  int coverSeed)?  $default,) {final _that = this;
switch (_that) {
case _P2pListing() when $default != null:
return $default(_that.id,_that.title,_that.sellerName,_that.sellerBatch,_that.priceBdt,_that.condition,_that.coverSeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _P2pListing implements P2pListing {
  const _P2pListing({required this.id, required this.title, required this.sellerName, required this.sellerBatch, required this.priceBdt, this.condition = BookCondition.good, this.coverSeed = 0});
  factory _P2pListing.fromJson(Map<String, dynamic> json) => _$P2pListingFromJson(json);

@override final  String id;
@override final  String title;
@override final  String sellerName;
@override final  String sellerBatch;
@override final  int priceBdt;
@override@JsonKey() final  BookCondition condition;
@override@JsonKey() final  int coverSeed;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _P2pListing&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.sellerBatch, sellerBatch) || other.sellerBatch == sellerBatch)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,sellerName,sellerBatch,priceBdt,condition,coverSeed);
}

@override
String toString() {
    return 'P2pListing(id: $id, title: $title, sellerName: $sellerName, sellerBatch: $sellerBatch, priceBdt: $priceBdt, condition: $condition, coverSeed: $coverSeed)';
}


}

/// @nodoc
abstract mixin class _$P2pListingCopyWith<$Res> implements $P2pListingCopyWith<$Res> {
  factory _$P2pListingCopyWith(_P2pListing value, $Res Function(_P2pListing) _then) = __$P2pListingCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String sellerName, String sellerBatch, int priceBdt, BookCondition condition, int coverSeed
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? sellerName = null,Object? sellerBatch = null,Object? priceBdt = null,Object? condition = null,Object? coverSeed = null,}) {
  return _then(_P2pListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,sellerBatch: null == sellerBatch ? _self.sellerBatch : sellerBatch // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
