// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reader_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReaderModel {

 String get id; String get name; String get area; String get district; DateTime? get memberSince; int get followers; int get following; bool get isFollowing; bool get isMe; bool get profileVisible; int get biteCount; int get liveListingCount;
/// Create a copy of ReaderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReaderModelCopyWith<ReaderModel> get copyWith => _$ReaderModelCopyWithImpl<ReaderModel>(this as ReaderModel, _$identity);

  /// Serializes this ReaderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReaderModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReaderModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.district, _this.district) || other.district == _this.district)&&(identical(other.memberSince, _this.memberSince) || other.memberSince == _this.memberSince)&&(identical(other.followers, _this.followers) || other.followers == _this.followers)&&(identical(other.following, _this.following) || other.following == _this.following)&&(identical(other.isFollowing, _this.isFollowing) || other.isFollowing == _this.isFollowing)&&(identical(other.isMe, _this.isMe) || other.isMe == _this.isMe)&&(identical(other.profileVisible, _this.profileVisible) || other.profileVisible == _this.profileVisible)&&(identical(other.biteCount, _this.biteCount) || other.biteCount == _this.biteCount)&&(identical(other.liveListingCount, _this.liveListingCount) || other.liveListingCount == _this.liveListingCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReaderModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.area,_this.district,_this.memberSince,_this.followers,_this.following,_this.isFollowing,_this.isMe,_this.profileVisible,_this.biteCount,_this.liveListingCount);
}

@override
String toString() {
  final _this = this as ReaderModel;
  return 'ReaderModel(id: ${_this.id}, name: ${_this.name}, area: ${_this.area}, district: ${_this.district}, memberSince: ${_this.memberSince}, followers: ${_this.followers}, following: ${_this.following}, isFollowing: ${_this.isFollowing}, isMe: ${_this.isMe}, profileVisible: ${_this.profileVisible}, biteCount: ${_this.biteCount}, liveListingCount: ${_this.liveListingCount})';
}


}

/// @nodoc
abstract mixin class $ReaderModelCopyWith<$Res>  {
  factory $ReaderModelCopyWith(ReaderModel value, $Res Function(ReaderModel) _then) = _$ReaderModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String area, String district, DateTime? memberSince, int followers, int following, bool isFollowing, bool isMe, bool profileVisible, int biteCount, int liveListingCount
});




}
/// @nodoc
class _$ReaderModelCopyWithImpl<$Res>
    implements $ReaderModelCopyWith<$Res> {
  _$ReaderModelCopyWithImpl(this._self, this._then);

  final ReaderModel _self;
  final $Res Function(ReaderModel) _then;

/// Create a copy of ReaderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? area = null,Object? district = null,Object? memberSince = freezed,Object? followers = null,Object? following = null,Object? isFollowing = null,Object? isMe = null,Object? profileVisible = null,Object? biteCount = null,Object? liveListingCount = null,}) {
  return _then(ReaderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,memberSince: freezed == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime?,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as int,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,isMe: null == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool,profileVisible: null == profileVisible ? _self.profileVisible : profileVisible // ignore: cast_nullable_to_non_nullable
as bool,biteCount: null == biteCount ? _self.biteCount : biteCount // ignore: cast_nullable_to_non_nullable
as int,liveListingCount: null == liveListingCount ? _self.liveListingCount : liveListingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReaderModel].
extension ReaderModelPatterns on ReaderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReaderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReaderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReaderModel value)  $default,){
final _that = this;
switch (_that) {
case _ReaderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReaderModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReaderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String area,  String district,  DateTime? memberSince,  int followers,  int following,  bool isFollowing,  bool isMe,  bool profileVisible,  int biteCount,  int liveListingCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReaderModel() when $default != null:
return $default(_that.id,_that.name,_that.area,_that.district,_that.memberSince,_that.followers,_that.following,_that.isFollowing,_that.isMe,_that.profileVisible,_that.biteCount,_that.liveListingCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String area,  String district,  DateTime? memberSince,  int followers,  int following,  bool isFollowing,  bool isMe,  bool profileVisible,  int biteCount,  int liveListingCount)  $default,) {final _that = this;
switch (_that) {
case _ReaderModel():
return $default(_that.id,_that.name,_that.area,_that.district,_that.memberSince,_that.followers,_that.following,_that.isFollowing,_that.isMe,_that.profileVisible,_that.biteCount,_that.liveListingCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String area,  String district,  DateTime? memberSince,  int followers,  int following,  bool isFollowing,  bool isMe,  bool profileVisible,  int biteCount,  int liveListingCount)?  $default,) {final _that = this;
switch (_that) {
case _ReaderModel() when $default != null:
return $default(_that.id,_that.name,_that.area,_that.district,_that.memberSince,_that.followers,_that.following,_that.isFollowing,_that.isMe,_that.profileVisible,_that.biteCount,_that.liveListingCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReaderModel implements ReaderModel {
  const _ReaderModel({required this.id, required this.name, this.area = '', this.district = '', this.memberSince, this.followers = 0, this.following = 0, this.isFollowing = false, this.isMe = false, this.profileVisible = true, this.biteCount = 0, this.liveListingCount = 0});
  factory _ReaderModel.fromJson(Map<String, dynamic> json) => _$ReaderModelFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String area;
@override@JsonKey() final  String district;
@override final  DateTime? memberSince;
@override@JsonKey() final  int followers;
@override@JsonKey() final  int following;
@override@JsonKey() final  bool isFollowing;
@override@JsonKey() final  bool isMe;
@override@JsonKey() final  bool profileVisible;
@override@JsonKey() final  int biteCount;
@override@JsonKey() final  int liveListingCount;

/// Create a copy of ReaderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReaderModelCopyWith<_ReaderModel> get copyWith => __$ReaderModelCopyWithImpl<_ReaderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReaderModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReaderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.area, area) || other.area == area)&&(identical(other.district, district) || other.district == district)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.following, following) || other.following == following)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.isMe, isMe) || other.isMe == isMe)&&(identical(other.profileVisible, profileVisible) || other.profileVisible == profileVisible)&&(identical(other.biteCount, biteCount) || other.biteCount == biteCount)&&(identical(other.liveListingCount, liveListingCount) || other.liveListingCount == liveListingCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,area,district,memberSince,followers,following,isFollowing,isMe,profileVisible,biteCount,liveListingCount);
}

@override
String toString() {
    return 'ReaderModel(id: $id, name: $name, area: $area, district: $district, memberSince: $memberSince, followers: $followers, following: $following, isFollowing: $isFollowing, isMe: $isMe, profileVisible: $profileVisible, biteCount: $biteCount, liveListingCount: $liveListingCount)';
}


}

/// @nodoc
abstract mixin class _$ReaderModelCopyWith<$Res> implements $ReaderModelCopyWith<$Res> {
  factory _$ReaderModelCopyWith(_ReaderModel value, $Res Function(_ReaderModel) _then) = __$ReaderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String area, String district, DateTime? memberSince, int followers, int following, bool isFollowing, bool isMe, bool profileVisible, int biteCount, int liveListingCount
});




}
/// @nodoc
class __$ReaderModelCopyWithImpl<$Res>
    implements _$ReaderModelCopyWith<$Res> {
  __$ReaderModelCopyWithImpl(this._self, this._then);

  final _ReaderModel _self;
  final $Res Function(_ReaderModel) _then;

/// Create a copy of ReaderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? area = null,Object? district = null,Object? memberSince = freezed,Object? followers = null,Object? following = null,Object? isFollowing = null,Object? isMe = null,Object? profileVisible = null,Object? biteCount = null,Object? liveListingCount = null,}) {
  return _then(_ReaderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,memberSince: freezed == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime?,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as int,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,isMe: null == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool,profileVisible: null == profileVisible ? _self.profileVisible : profileVisible // ignore: cast_nullable_to_non_nullable
as bool,biteCount: null == biteCount ? _self.biteCount : biteCount // ignore: cast_nullable_to_non_nullable
as int,liveListingCount: null == liveListingCount ? _self.liveListingCount : liveListingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
