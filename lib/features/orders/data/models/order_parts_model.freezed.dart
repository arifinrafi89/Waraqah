// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_parts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderLineModel {

 String get bookId; String get title; String get author; int get quantity; int get unitPriceBdt; BookFormat? get format; BookLanguage? get language; int get coverSeed;
/// Create a copy of OrderLineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineModelCopyWith<OrderLineModel> get copyWith => _$OrderLineModelCopyWithImpl<OrderLineModel>(this as OrderLineModel, _$identity);

  /// Serializes this OrderLineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderLineModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLineModel&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.unitPriceBdt, _this.unitPriceBdt) || other.unitPriceBdt == _this.unitPriceBdt)&&(identical(other.format, _this.format) || other.format == _this.format)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderLineModel;
  return Object.hash(runtimeType,_this.bookId,_this.title,_this.author,_this.quantity,_this.unitPriceBdt,_this.format,_this.language,_this.coverSeed);
}

@override
String toString() {
  final _this = this as OrderLineModel;
  return 'OrderLineModel(bookId: ${_this.bookId}, title: ${_this.title}, author: ${_this.author}, quantity: ${_this.quantity}, unitPriceBdt: ${_this.unitPriceBdt}, format: ${_this.format}, language: ${_this.language}, coverSeed: ${_this.coverSeed})';
}


}

/// @nodoc
abstract mixin class $OrderLineModelCopyWith<$Res>  {
  factory $OrderLineModelCopyWith(OrderLineModel value, $Res Function(OrderLineModel) _then) = _$OrderLineModelCopyWithImpl;
@useResult
$Res call({
 String bookId, String title, String author, int quantity, int unitPriceBdt, BookFormat? format, BookLanguage? language, int coverSeed
});




}
/// @nodoc
class _$OrderLineModelCopyWithImpl<$Res>
    implements $OrderLineModelCopyWith<$Res> {
  _$OrderLineModelCopyWithImpl(this._self, this._then);

  final OrderLineModel _self;
  final $Res Function(OrderLineModel) _then;

/// Create a copy of OrderLineModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? quantity = null,Object? unitPriceBdt = null,Object? format = freezed,Object? language = freezed,Object? coverSeed = null,}) {
  return _then(OrderLineModel(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPriceBdt: null == unitPriceBdt ? _self.unitPriceBdt : unitPriceBdt // ignore: cast_nullable_to_non_nullable
as int,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookFormat?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as BookLanguage?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderLineModel].
extension OrderLineModelPatterns on OrderLineModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLineModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLineModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLineModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderLineModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLineModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLineModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookId,  String title,  String author,  int quantity,  int unitPriceBdt,  BookFormat? format,  BookLanguage? language,  int coverSeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLineModel() when $default != null:
return $default(_that.bookId,_that.title,_that.author,_that.quantity,_that.unitPriceBdt,_that.format,_that.language,_that.coverSeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookId,  String title,  String author,  int quantity,  int unitPriceBdt,  BookFormat? format,  BookLanguage? language,  int coverSeed)  $default,) {final _that = this;
switch (_that) {
case _OrderLineModel():
return $default(_that.bookId,_that.title,_that.author,_that.quantity,_that.unitPriceBdt,_that.format,_that.language,_that.coverSeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookId,  String title,  String author,  int quantity,  int unitPriceBdt,  BookFormat? format,  BookLanguage? language,  int coverSeed)?  $default,) {final _that = this;
switch (_that) {
case _OrderLineModel() when $default != null:
return $default(_that.bookId,_that.title,_that.author,_that.quantity,_that.unitPriceBdt,_that.format,_that.language,_that.coverSeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderLineModel implements OrderLineModel {
  const _OrderLineModel({required this.bookId, required this.title, required this.author, required this.quantity, required this.unitPriceBdt, this.format, this.language, this.coverSeed = 0});
  factory _OrderLineModel.fromJson(Map<String, dynamic> json) => _$OrderLineModelFromJson(json);

@override final  String bookId;
@override final  String title;
@override final  String author;
@override final  int quantity;
@override final  int unitPriceBdt;
@override final  BookFormat? format;
@override final  BookLanguage? language;
@override@JsonKey() final  int coverSeed;

/// Create a copy of OrderLineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineModelCopyWith<_OrderLineModel> get copyWith => __$OrderLineModelCopyWithImpl<_OrderLineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderLineModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLineModel&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPriceBdt, unitPriceBdt) || other.unitPriceBdt == unitPriceBdt)&&(identical(other.format, format) || other.format == format)&&(identical(other.language, language) || other.language == language)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,bookId,title,author,quantity,unitPriceBdt,format,language,coverSeed);
}

@override
String toString() {
    return 'OrderLineModel(bookId: $bookId, title: $title, author: $author, quantity: $quantity, unitPriceBdt: $unitPriceBdt, format: $format, language: $language, coverSeed: $coverSeed)';
}


}

/// @nodoc
abstract mixin class _$OrderLineModelCopyWith<$Res> implements $OrderLineModelCopyWith<$Res> {
  factory _$OrderLineModelCopyWith(_OrderLineModel value, $Res Function(_OrderLineModel) _then) = __$OrderLineModelCopyWithImpl;
@override @useResult
$Res call({
 String bookId, String title, String author, int quantity, int unitPriceBdt, BookFormat? format, BookLanguage? language, int coverSeed
});




}
/// @nodoc
class __$OrderLineModelCopyWithImpl<$Res>
    implements _$OrderLineModelCopyWith<$Res> {
  __$OrderLineModelCopyWithImpl(this._self, this._then);

  final _OrderLineModel _self;
  final $Res Function(_OrderLineModel) _then;

/// Create a copy of OrderLineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? title = null,Object? author = null,Object? quantity = null,Object? unitPriceBdt = null,Object? format = freezed,Object? language = freezed,Object? coverSeed = null,}) {
  return _then(_OrderLineModel(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPriceBdt: null == unitPriceBdt ? _self.unitPriceBdt : unitPriceBdt // ignore: cast_nullable_to_non_nullable
as int,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookFormat?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as BookLanguage?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$StatusChangeModel {

 OrderStatus get status; DateTime get at;
/// Create a copy of StatusChangeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusChangeModelCopyWith<StatusChangeModel> get copyWith => _$StatusChangeModelCopyWithImpl<StatusChangeModel>(this as StatusChangeModel, _$identity);

  /// Serializes this StatusChangeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StatusChangeModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusChangeModel&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.at, _this.at) || other.at == _this.at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StatusChangeModel;
  return Object.hash(runtimeType,_this.status,_this.at);
}

@override
String toString() {
  final _this = this as StatusChangeModel;
  return 'StatusChangeModel(status: ${_this.status}, at: ${_this.at})';
}


}

/// @nodoc
abstract mixin class $StatusChangeModelCopyWith<$Res>  {
  factory $StatusChangeModelCopyWith(StatusChangeModel value, $Res Function(StatusChangeModel) _then) = _$StatusChangeModelCopyWithImpl;
@useResult
$Res call({
 OrderStatus status, DateTime at
});




}
/// @nodoc
class _$StatusChangeModelCopyWithImpl<$Res>
    implements $StatusChangeModelCopyWith<$Res> {
  _$StatusChangeModelCopyWithImpl(this._self, this._then);

  final StatusChangeModel _self;
  final $Res Function(StatusChangeModel) _then;

/// Create a copy of StatusChangeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? at = null,}) {
  return _then(StatusChangeModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusChangeModel].
extension StatusChangeModelPatterns on StatusChangeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusChangeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusChangeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusChangeModel value)  $default,){
final _that = this;
switch (_that) {
case _StatusChangeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusChangeModel value)?  $default,){
final _that = this;
switch (_that) {
case _StatusChangeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderStatus status,  DateTime at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusChangeModel() when $default != null:
return $default(_that.status,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderStatus status,  DateTime at)  $default,) {final _that = this;
switch (_that) {
case _StatusChangeModel():
return $default(_that.status,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderStatus status,  DateTime at)?  $default,) {final _that = this;
switch (_that) {
case _StatusChangeModel() when $default != null:
return $default(_that.status,_that.at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatusChangeModel implements StatusChangeModel {
  const _StatusChangeModel({required this.status, required this.at});
  factory _StatusChangeModel.fromJson(Map<String, dynamic> json) => _$StatusChangeModelFromJson(json);

@override final  OrderStatus status;
@override final  DateTime at;

/// Create a copy of StatusChangeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusChangeModelCopyWith<_StatusChangeModel> get copyWith => __$StatusChangeModelCopyWithImpl<_StatusChangeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusChangeModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusChangeModel&&(identical(other.status, status) || other.status == status)&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,at);
}

@override
String toString() {
    return 'StatusChangeModel(status: $status, at: $at)';
}


}

/// @nodoc
abstract mixin class _$StatusChangeModelCopyWith<$Res> implements $StatusChangeModelCopyWith<$Res> {
  factory _$StatusChangeModelCopyWith(_StatusChangeModel value, $Res Function(_StatusChangeModel) _then) = __$StatusChangeModelCopyWithImpl;
@override @useResult
$Res call({
 OrderStatus status, DateTime at
});




}
/// @nodoc
class __$StatusChangeModelCopyWithImpl<$Res>
    implements _$StatusChangeModelCopyWith<$Res> {
  __$StatusChangeModelCopyWithImpl(this._self, this._then);

  final _StatusChangeModel _self;
  final $Res Function(_StatusChangeModel) _then;

/// Create a copy of StatusChangeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? at = null,}) {
  return _then(_StatusChangeModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ReturnRequestModel {

 ReturnReason get reason; ReturnStatus get status; DateTime get requestedAt; String get note;/// Base64 images for now; the Go backend will store uploads and answer
/// links instead.
 List<String> get photos;
/// Create a copy of ReturnRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnRequestModelCopyWith<ReturnRequestModel> get copyWith => _$ReturnRequestModelCopyWithImpl<ReturnRequestModel>(this as ReturnRequestModel, _$identity);

  /// Serializes this ReturnRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReturnRequestModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnRequestModel&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.requestedAt, _this.requestedAt) || other.requestedAt == _this.requestedAt)&&(identical(other.note, _this.note) || other.note == _this.note)&&const DeepCollectionEquality().equals(other.photos, _this.photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReturnRequestModel;
  return Object.hash(runtimeType,_this.reason,_this.status,_this.requestedAt,_this.note,const DeepCollectionEquality().hash(_this.photos));
}

@override
String toString() {
  final _this = this as ReturnRequestModel;
  return 'ReturnRequestModel(reason: ${_this.reason}, status: ${_this.status}, requestedAt: ${_this.requestedAt}, note: ${_this.note}, photos: ${_this.photos})';
}


}

/// @nodoc
abstract mixin class $ReturnRequestModelCopyWith<$Res>  {
  factory $ReturnRequestModelCopyWith(ReturnRequestModel value, $Res Function(ReturnRequestModel) _then) = _$ReturnRequestModelCopyWithImpl;
@useResult
$Res call({
 ReturnReason reason, ReturnStatus status, DateTime requestedAt, String note, List<String> photos
});




}
/// @nodoc
class _$ReturnRequestModelCopyWithImpl<$Res>
    implements $ReturnRequestModelCopyWith<$Res> {
  _$ReturnRequestModelCopyWithImpl(this._self, this._then);

  final ReturnRequestModel _self;
  final $Res Function(ReturnRequestModel) _then;

/// Create a copy of ReturnRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? status = null,Object? requestedAt = null,Object? note = null,Object? photos = null,}) {
  return _then(ReturnRequestModel(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReturnReason,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReturnStatus,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReturnRequestModel].
extension ReturnRequestModelPatterns on ReturnRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReturnRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReturnRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReturnRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ReturnRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReturnRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReturnRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReturnReason reason,  ReturnStatus status,  DateTime requestedAt,  String note,  List<String> photos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReturnRequestModel() when $default != null:
return $default(_that.reason,_that.status,_that.requestedAt,_that.note,_that.photos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReturnReason reason,  ReturnStatus status,  DateTime requestedAt,  String note,  List<String> photos)  $default,) {final _that = this;
switch (_that) {
case _ReturnRequestModel():
return $default(_that.reason,_that.status,_that.requestedAt,_that.note,_that.photos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReturnReason reason,  ReturnStatus status,  DateTime requestedAt,  String note,  List<String> photos)?  $default,) {final _that = this;
switch (_that) {
case _ReturnRequestModel() when $default != null:
return $default(_that.reason,_that.status,_that.requestedAt,_that.note,_that.photos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReturnRequestModel implements ReturnRequestModel {
  const _ReturnRequestModel({required this.reason, required this.status, required this.requestedAt, this.note = '',  List<String> photos = const <String>[]}): _photos = photos;
  factory _ReturnRequestModel.fromJson(Map<String, dynamic> json) => _$ReturnRequestModelFromJson(json);

@override final  ReturnReason reason;
@override final  ReturnStatus status;
@override final  DateTime requestedAt;
@override@JsonKey() final  String note;
/// Base64 images for now; the Go backend will store uploads and answer
/// links instead.
 final  List<String> _photos;
/// Base64 images for now; the Go backend will store uploads and answer
/// links instead.
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}


/// Create a copy of ReturnRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReturnRequestModelCopyWith<_ReturnRequestModel> get copyWith => __$ReturnRequestModelCopyWithImpl<_ReturnRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReturnRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReturnRequestModel&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.photos, _photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,reason,status,requestedAt,note,const DeepCollectionEquality().hash(_photos));
}

@override
String toString() {
    return 'ReturnRequestModel(reason: $reason, status: $status, requestedAt: $requestedAt, note: $note, photos: $photos)';
}


}

/// @nodoc
abstract mixin class _$ReturnRequestModelCopyWith<$Res> implements $ReturnRequestModelCopyWith<$Res> {
  factory _$ReturnRequestModelCopyWith(_ReturnRequestModel value, $Res Function(_ReturnRequestModel) _then) = __$ReturnRequestModelCopyWithImpl;
@override @useResult
$Res call({
 ReturnReason reason, ReturnStatus status, DateTime requestedAt, String note, List<String> photos
});




}
/// @nodoc
class __$ReturnRequestModelCopyWithImpl<$Res>
    implements _$ReturnRequestModelCopyWith<$Res> {
  __$ReturnRequestModelCopyWithImpl(this._self, this._then);

  final _ReturnRequestModel _self;
  final $Res Function(_ReturnRequestModel) _then;

/// Create a copy of ReturnRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? status = null,Object? requestedAt = null,Object? note = null,Object? photos = null,}) {
  return _then(_ReturnRequestModel(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReturnReason,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReturnStatus,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
