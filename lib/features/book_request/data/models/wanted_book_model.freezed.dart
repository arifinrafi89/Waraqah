// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wanted_book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WantedBookModel {

 String get requestId; String get readerName; String get title; String get listingId; DateTime get createdAt; int? get maxPriceBdt;
/// Create a copy of WantedBookModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WantedBookModelCopyWith<WantedBookModel> get copyWith => _$WantedBookModelCopyWithImpl<WantedBookModel>(this as WantedBookModel, _$identity);

  /// Serializes this WantedBookModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WantedBookModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WantedBookModel&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.readerName, _this.readerName) || other.readerName == _this.readerName)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.listingId, _this.listingId) || other.listingId == _this.listingId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.maxPriceBdt, _this.maxPriceBdt) || other.maxPriceBdt == _this.maxPriceBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WantedBookModel;
  return Object.hash(runtimeType,_this.requestId,_this.readerName,_this.title,_this.listingId,_this.createdAt,_this.maxPriceBdt);
}

@override
String toString() {
  final _this = this as WantedBookModel;
  return 'WantedBookModel(requestId: ${_this.requestId}, readerName: ${_this.readerName}, title: ${_this.title}, listingId: ${_this.listingId}, createdAt: ${_this.createdAt}, maxPriceBdt: ${_this.maxPriceBdt})';
}


}

/// @nodoc
abstract mixin class $WantedBookModelCopyWith<$Res>  {
  factory $WantedBookModelCopyWith(WantedBookModel value, $Res Function(WantedBookModel) _then) = _$WantedBookModelCopyWithImpl;
@useResult
$Res call({
 String requestId, String readerName, String title, String listingId, DateTime createdAt, int? maxPriceBdt
});




}
/// @nodoc
class _$WantedBookModelCopyWithImpl<$Res>
    implements $WantedBookModelCopyWith<$Res> {
  _$WantedBookModelCopyWithImpl(this._self, this._then);

  final WantedBookModel _self;
  final $Res Function(WantedBookModel) _then;

/// Create a copy of WantedBookModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? readerName = null,Object? title = null,Object? listingId = null,Object? createdAt = null,Object? maxPriceBdt = freezed,}) {
  return _then(WantedBookModel(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,readerName: null == readerName ? _self.readerName : readerName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,maxPriceBdt: freezed == maxPriceBdt ? _self.maxPriceBdt : maxPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [WantedBookModel].
extension WantedBookModelPatterns on WantedBookModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WantedBookModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WantedBookModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WantedBookModel value)  $default,){
final _that = this;
switch (_that) {
case _WantedBookModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WantedBookModel value)?  $default,){
final _that = this;
switch (_that) {
case _WantedBookModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String readerName,  String title,  String listingId,  DateTime createdAt,  int? maxPriceBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WantedBookModel() when $default != null:
return $default(_that.requestId,_that.readerName,_that.title,_that.listingId,_that.createdAt,_that.maxPriceBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String readerName,  String title,  String listingId,  DateTime createdAt,  int? maxPriceBdt)  $default,) {final _that = this;
switch (_that) {
case _WantedBookModel():
return $default(_that.requestId,_that.readerName,_that.title,_that.listingId,_that.createdAt,_that.maxPriceBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String readerName,  String title,  String listingId,  DateTime createdAt,  int? maxPriceBdt)?  $default,) {final _that = this;
switch (_that) {
case _WantedBookModel() when $default != null:
return $default(_that.requestId,_that.readerName,_that.title,_that.listingId,_that.createdAt,_that.maxPriceBdt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WantedBookModel implements WantedBookModel {
  const _WantedBookModel({required this.requestId, required this.readerName, required this.title, required this.listingId, required this.createdAt, this.maxPriceBdt});
  factory _WantedBookModel.fromJson(Map<String, dynamic> json) => _$WantedBookModelFromJson(json);

@override final  String requestId;
@override final  String readerName;
@override final  String title;
@override final  String listingId;
@override final  DateTime createdAt;
@override final  int? maxPriceBdt;

/// Create a copy of WantedBookModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WantedBookModelCopyWith<_WantedBookModel> get copyWith => __$WantedBookModelCopyWithImpl<_WantedBookModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WantedBookModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WantedBookModel&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.readerName, readerName) || other.readerName == readerName)&&(identical(other.title, title) || other.title == title)&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.maxPriceBdt, maxPriceBdt) || other.maxPriceBdt == maxPriceBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,requestId,readerName,title,listingId,createdAt,maxPriceBdt);
}

@override
String toString() {
    return 'WantedBookModel(requestId: $requestId, readerName: $readerName, title: $title, listingId: $listingId, createdAt: $createdAt, maxPriceBdt: $maxPriceBdt)';
}


}

/// @nodoc
abstract mixin class _$WantedBookModelCopyWith<$Res> implements $WantedBookModelCopyWith<$Res> {
  factory _$WantedBookModelCopyWith(_WantedBookModel value, $Res Function(_WantedBookModel) _then) = __$WantedBookModelCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String readerName, String title, String listingId, DateTime createdAt, int? maxPriceBdt
});




}
/// @nodoc
class __$WantedBookModelCopyWithImpl<$Res>
    implements _$WantedBookModelCopyWith<$Res> {
  __$WantedBookModelCopyWithImpl(this._self, this._then);

  final _WantedBookModel _self;
  final $Res Function(_WantedBookModel) _then;

/// Create a copy of WantedBookModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? readerName = null,Object? title = null,Object? listingId = null,Object? createdAt = null,Object? maxPriceBdt = freezed,}) {
  return _then(_WantedBookModel(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,readerName: null == readerName ? _self.readerName : readerName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,maxPriceBdt: freezed == maxPriceBdt ? _self.maxPriceBdt : maxPriceBdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$BookDemandModel {

 String get title; int get requests;
/// Create a copy of BookDemandModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookDemandModelCopyWith<BookDemandModel> get copyWith => _$BookDemandModelCopyWithImpl<BookDemandModel>(this as BookDemandModel, _$identity);

  /// Serializes this BookDemandModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookDemandModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookDemandModel&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.requests, _this.requests) || other.requests == _this.requests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookDemandModel;
  return Object.hash(runtimeType,_this.title,_this.requests);
}

@override
String toString() {
  final _this = this as BookDemandModel;
  return 'BookDemandModel(title: ${_this.title}, requests: ${_this.requests})';
}


}

/// @nodoc
abstract mixin class $BookDemandModelCopyWith<$Res>  {
  factory $BookDemandModelCopyWith(BookDemandModel value, $Res Function(BookDemandModel) _then) = _$BookDemandModelCopyWithImpl;
@useResult
$Res call({
 String title, int requests
});




}
/// @nodoc
class _$BookDemandModelCopyWithImpl<$Res>
    implements $BookDemandModelCopyWith<$Res> {
  _$BookDemandModelCopyWithImpl(this._self, this._then);

  final BookDemandModel _self;
  final $Res Function(BookDemandModel) _then;

/// Create a copy of BookDemandModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? requests = null,}) {
  return _then(BookDemandModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BookDemandModel].
extension BookDemandModelPatterns on BookDemandModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookDemandModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookDemandModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookDemandModel value)  $default,){
final _that = this;
switch (_that) {
case _BookDemandModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookDemandModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookDemandModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  int requests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookDemandModel() when $default != null:
return $default(_that.title,_that.requests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  int requests)  $default,) {final _that = this;
switch (_that) {
case _BookDemandModel():
return $default(_that.title,_that.requests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  int requests)?  $default,) {final _that = this;
switch (_that) {
case _BookDemandModel() when $default != null:
return $default(_that.title,_that.requests);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookDemandModel implements BookDemandModel {
  const _BookDemandModel({required this.title, required this.requests});
  factory _BookDemandModel.fromJson(Map<String, dynamic> json) => _$BookDemandModelFromJson(json);

@override final  String title;
@override final  int requests;

/// Create a copy of BookDemandModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookDemandModelCopyWith<_BookDemandModel> get copyWith => __$BookDemandModelCopyWithImpl<_BookDemandModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookDemandModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookDemandModel&&(identical(other.title, title) || other.title == title)&&(identical(other.requests, requests) || other.requests == requests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,requests);
}

@override
String toString() {
    return 'BookDemandModel(title: $title, requests: $requests)';
}


}

/// @nodoc
abstract mixin class _$BookDemandModelCopyWith<$Res> implements $BookDemandModelCopyWith<$Res> {
  factory _$BookDemandModelCopyWith(_BookDemandModel value, $Res Function(_BookDemandModel) _then) = __$BookDemandModelCopyWithImpl;
@override @useResult
$Res call({
 String title, int requests
});




}
/// @nodoc
class __$BookDemandModelCopyWithImpl<$Res>
    implements _$BookDemandModelCopyWith<$Res> {
  __$BookDemandModelCopyWithImpl(this._self, this._then);

  final _BookDemandModel _self;
  final $Res Function(_BookDemandModel) _then;

/// Create a copy of BookDemandModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? requests = null,}) {
  return _then(_BookDemandModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
