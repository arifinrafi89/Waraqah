// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queued_listing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueuedListingModel {

 String get id; String get title; String get sellerId; String get sellerName; int get priceBdt; BookCondition get condition; List<String> get flags; List<String> get photos; int get coverSeed; int get sellerStrikes; int? get newPriceBdt; String? get note;
/// Create a copy of QueuedListingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueuedListingModelCopyWith<QueuedListingModel> get copyWith => _$QueuedListingModelCopyWithImpl<QueuedListingModel>(this as QueuedListingModel, _$identity);

  /// Serializes this QueuedListingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QueuedListingModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueuedListingModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.sellerId, _this.sellerId) || other.sellerId == _this.sellerId)&&(identical(other.sellerName, _this.sellerName) || other.sellerName == _this.sellerName)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.condition, _this.condition) || other.condition == _this.condition)&&const DeepCollectionEquality().equals(other.flags, _this.flags)&&const DeepCollectionEquality().equals(other.photos, _this.photos)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed)&&(identical(other.sellerStrikes, _this.sellerStrikes) || other.sellerStrikes == _this.sellerStrikes)&&(identical(other.newPriceBdt, _this.newPriceBdt) || other.newPriceBdt == _this.newPriceBdt)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QueuedListingModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.sellerId,_this.sellerName,_this.priceBdt,_this.condition,const DeepCollectionEquality().hash(_this.flags),const DeepCollectionEquality().hash(_this.photos),_this.coverSeed,_this.sellerStrikes,_this.newPriceBdt,_this.note);
}

@override
String toString() {
  final _this = this as QueuedListingModel;
  return 'QueuedListingModel(id: ${_this.id}, title: ${_this.title}, sellerId: ${_this.sellerId}, sellerName: ${_this.sellerName}, priceBdt: ${_this.priceBdt}, condition: ${_this.condition}, flags: ${_this.flags}, photos: ${_this.photos}, coverSeed: ${_this.coverSeed}, sellerStrikes: ${_this.sellerStrikes}, newPriceBdt: ${_this.newPriceBdt}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $QueuedListingModelCopyWith<$Res>  {
  factory $QueuedListingModelCopyWith(QueuedListingModel value, $Res Function(QueuedListingModel) _then) = _$QueuedListingModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String sellerId, String sellerName, int priceBdt, BookCondition condition, List<String> flags, List<String> photos, int coverSeed, int sellerStrikes, int? newPriceBdt, String? note
});




}
/// @nodoc
class _$QueuedListingModelCopyWithImpl<$Res>
    implements $QueuedListingModelCopyWith<$Res> {
  _$QueuedListingModelCopyWithImpl(this._self, this._then);

  final QueuedListingModel _self;
  final $Res Function(QueuedListingModel) _then;

/// Create a copy of QueuedListingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? sellerId = null,Object? sellerName = null,Object? priceBdt = null,Object? condition = null,Object? flags = null,Object? photos = null,Object? coverSeed = null,Object? sellerStrikes = null,Object? newPriceBdt = freezed,Object? note = freezed,}) {
  return _then(QueuedListingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,sellerStrikes: null == sellerStrikes ? _self.sellerStrikes : sellerStrikes // ignore: cast_nullable_to_non_nullable
as int,newPriceBdt: freezed == newPriceBdt ? _self.newPriceBdt : newPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueuedListingModel].
extension QueuedListingModelPatterns on QueuedListingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueuedListingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueuedListingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueuedListingModel value)  $default,){
final _that = this;
switch (_that) {
case _QueuedListingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueuedListingModel value)?  $default,){
final _that = this;
switch (_that) {
case _QueuedListingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String sellerId,  String sellerName,  int priceBdt,  BookCondition condition,  List<String> flags,  List<String> photos,  int coverSeed,  int sellerStrikes,  int? newPriceBdt,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueuedListingModel() when $default != null:
return $default(_that.id,_that.title,_that.sellerId,_that.sellerName,_that.priceBdt,_that.condition,_that.flags,_that.photos,_that.coverSeed,_that.sellerStrikes,_that.newPriceBdt,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String sellerId,  String sellerName,  int priceBdt,  BookCondition condition,  List<String> flags,  List<String> photos,  int coverSeed,  int sellerStrikes,  int? newPriceBdt,  String? note)  $default,) {final _that = this;
switch (_that) {
case _QueuedListingModel():
return $default(_that.id,_that.title,_that.sellerId,_that.sellerName,_that.priceBdt,_that.condition,_that.flags,_that.photos,_that.coverSeed,_that.sellerStrikes,_that.newPriceBdt,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String sellerId,  String sellerName,  int priceBdt,  BookCondition condition,  List<String> flags,  List<String> photos,  int coverSeed,  int sellerStrikes,  int? newPriceBdt,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _QueuedListingModel() when $default != null:
return $default(_that.id,_that.title,_that.sellerId,_that.sellerName,_that.priceBdt,_that.condition,_that.flags,_that.photos,_that.coverSeed,_that.sellerStrikes,_that.newPriceBdt,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueuedListingModel implements QueuedListingModel {
  const _QueuedListingModel({required this.id, required this.title, required this.sellerId, required this.sellerName, required this.priceBdt, required this.condition,  List<String> flags = const <String>[],  List<String> photos = const <String>[], this.coverSeed = 0, this.sellerStrikes = 0, this.newPriceBdt, this.note}): _flags = flags,_photos = photos;
  factory _QueuedListingModel.fromJson(Map<String, dynamic> json) => _$QueuedListingModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String sellerId;
@override final  String sellerName;
@override final  int priceBdt;
@override final  BookCondition condition;
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

@override@JsonKey() final  int coverSeed;
@override@JsonKey() final  int sellerStrikes;
@override final  int? newPriceBdt;
@override final  String? note;

/// Create a copy of QueuedListingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueuedListingModelCopyWith<_QueuedListingModel> get copyWith => __$QueuedListingModelCopyWithImpl<_QueuedListingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueuedListingModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueuedListingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.condition, condition) || other.condition == condition)&&const DeepCollectionEquality().equals(other.flags, _flags)&&const DeepCollectionEquality().equals(other.photos, _photos)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed)&&(identical(other.sellerStrikes, sellerStrikes) || other.sellerStrikes == sellerStrikes)&&(identical(other.newPriceBdt, newPriceBdt) || other.newPriceBdt == newPriceBdt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,sellerId,sellerName,priceBdt,condition,const DeepCollectionEquality().hash(_flags),const DeepCollectionEquality().hash(_photos),coverSeed,sellerStrikes,newPriceBdt,note);
}

@override
String toString() {
    return 'QueuedListingModel(id: $id, title: $title, sellerId: $sellerId, sellerName: $sellerName, priceBdt: $priceBdt, condition: $condition, flags: $flags, photos: $photos, coverSeed: $coverSeed, sellerStrikes: $sellerStrikes, newPriceBdt: $newPriceBdt, note: $note)';
}


}

/// @nodoc
abstract mixin class _$QueuedListingModelCopyWith<$Res> implements $QueuedListingModelCopyWith<$Res> {
  factory _$QueuedListingModelCopyWith(_QueuedListingModel value, $Res Function(_QueuedListingModel) _then) = __$QueuedListingModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String sellerId, String sellerName, int priceBdt, BookCondition condition, List<String> flags, List<String> photos, int coverSeed, int sellerStrikes, int? newPriceBdt, String? note
});




}
/// @nodoc
class __$QueuedListingModelCopyWithImpl<$Res>
    implements _$QueuedListingModelCopyWith<$Res> {
  __$QueuedListingModelCopyWithImpl(this._self, this._then);

  final _QueuedListingModel _self;
  final $Res Function(_QueuedListingModel) _then;

/// Create a copy of QueuedListingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? sellerId = null,Object? sellerName = null,Object? priceBdt = null,Object? condition = null,Object? flags = null,Object? photos = null,Object? coverSeed = null,Object? sellerStrikes = null,Object? newPriceBdt = freezed,Object? note = freezed,}) {
  return _then(_QueuedListingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as BookCondition,flags: null == flags ? _self._flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,sellerStrikes: null == sellerStrikes ? _self.sellerStrikes : sellerStrikes // ignore: cast_nullable_to_non_nullable
as int,newPriceBdt: freezed == newPriceBdt ? _self.newPriceBdt : newPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
