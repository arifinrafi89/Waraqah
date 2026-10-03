// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assistant_reply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssistantReplyModel {

 String get id; String get text; List<String> get bookIds; AssistantBasketModel? get basket;
/// Create a copy of AssistantReplyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssistantReplyModelCopyWith<AssistantReplyModel> get copyWith => _$AssistantReplyModelCopyWithImpl<AssistantReplyModel>(this as AssistantReplyModel, _$identity);

  /// Serializes this AssistantReplyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AssistantReplyModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssistantReplyModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.text, _this.text) || other.text == _this.text)&&const DeepCollectionEquality().equals(other.bookIds, _this.bookIds)&&(identical(other.basket, _this.basket) || other.basket == _this.basket));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AssistantReplyModel;
  return Object.hash(runtimeType,_this.id,_this.text,const DeepCollectionEquality().hash(_this.bookIds),_this.basket);
}

@override
String toString() {
  final _this = this as AssistantReplyModel;
  return 'AssistantReplyModel(id: ${_this.id}, text: ${_this.text}, bookIds: ${_this.bookIds}, basket: ${_this.basket})';
}


}

/// @nodoc
abstract mixin class $AssistantReplyModelCopyWith<$Res>  {
  factory $AssistantReplyModelCopyWith(AssistantReplyModel value, $Res Function(AssistantReplyModel) _then) = _$AssistantReplyModelCopyWithImpl;
@useResult
$Res call({
 String id, String text, List<String> bookIds, AssistantBasketModel? basket
});


$AssistantBasketModelCopyWith<$Res>? get basket;

}
/// @nodoc
class _$AssistantReplyModelCopyWithImpl<$Res>
    implements $AssistantReplyModelCopyWith<$Res> {
  _$AssistantReplyModelCopyWithImpl(this._self, this._then);

  final AssistantReplyModel _self;
  final $Res Function(AssistantReplyModel) _then;

/// Create a copy of AssistantReplyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? bookIds = null,Object? basket = freezed,}) {
  return _then(AssistantReplyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,bookIds: null == bookIds ? _self.bookIds : bookIds // ignore: cast_nullable_to_non_nullable
as List<String>,basket: freezed == basket ? _self.basket : basket // ignore: cast_nullable_to_non_nullable
as AssistantBasketModel?,
  ));
}
/// Create a copy of AssistantReplyModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssistantBasketModelCopyWith<$Res>? get basket {
    if (_self.basket == null) {
    return null;
  }

  return $AssistantBasketModelCopyWith<$Res>(_self.basket!, (value) {
    return _then(_self.copyWith(basket: value));
  });
}
}


/// Adds pattern-matching-related methods to [AssistantReplyModel].
extension AssistantReplyModelPatterns on AssistantReplyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssistantReplyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssistantReplyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssistantReplyModel value)  $default,){
final _that = this;
switch (_that) {
case _AssistantReplyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssistantReplyModel value)?  $default,){
final _that = this;
switch (_that) {
case _AssistantReplyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  List<String> bookIds,  AssistantBasketModel? basket)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssistantReplyModel() when $default != null:
return $default(_that.id,_that.text,_that.bookIds,_that.basket);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  List<String> bookIds,  AssistantBasketModel? basket)  $default,) {final _that = this;
switch (_that) {
case _AssistantReplyModel():
return $default(_that.id,_that.text,_that.bookIds,_that.basket);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  List<String> bookIds,  AssistantBasketModel? basket)?  $default,) {final _that = this;
switch (_that) {
case _AssistantReplyModel() when $default != null:
return $default(_that.id,_that.text,_that.bookIds,_that.basket);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _AssistantReplyModel implements AssistantReplyModel {
  const _AssistantReplyModel({required this.id, required this.text,  List<String> bookIds = const <String>[], this.basket}): _bookIds = bookIds;
  factory _AssistantReplyModel.fromJson(Map<String, dynamic> json) => _$AssistantReplyModelFromJson(json);

@override final  String id;
@override final  String text;
 final  List<String> _bookIds;
@override@JsonKey() List<String> get bookIds {
  if (_bookIds is EqualUnmodifiableListView) return _bookIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookIds);
}

@override final  AssistantBasketModel? basket;

/// Create a copy of AssistantReplyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssistantReplyModelCopyWith<_AssistantReplyModel> get copyWith => __$AssistantReplyModelCopyWithImpl<_AssistantReplyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssistantReplyModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssistantReplyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.bookIds, _bookIds)&&(identical(other.basket, basket) || other.basket == basket));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,text,const DeepCollectionEquality().hash(_bookIds),basket);
}

@override
String toString() {
    return 'AssistantReplyModel(id: $id, text: $text, bookIds: $bookIds, basket: $basket)';
}


}

/// @nodoc
abstract mixin class _$AssistantReplyModelCopyWith<$Res> implements $AssistantReplyModelCopyWith<$Res> {
  factory _$AssistantReplyModelCopyWith(_AssistantReplyModel value, $Res Function(_AssistantReplyModel) _then) = __$AssistantReplyModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, List<String> bookIds, AssistantBasketModel? basket
});


@override $AssistantBasketModelCopyWith<$Res>? get basket;

}
/// @nodoc
class __$AssistantReplyModelCopyWithImpl<$Res>
    implements _$AssistantReplyModelCopyWith<$Res> {
  __$AssistantReplyModelCopyWithImpl(this._self, this._then);

  final _AssistantReplyModel _self;
  final $Res Function(_AssistantReplyModel) _then;

/// Create a copy of AssistantReplyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? bookIds = null,Object? basket = freezed,}) {
  return _then(_AssistantReplyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,bookIds: null == bookIds ? _self._bookIds : bookIds // ignore: cast_nullable_to_non_nullable
as List<String>,basket: freezed == basket ? _self.basket : basket // ignore: cast_nullable_to_non_nullable
as AssistantBasketModel?,
  ));
}

/// Create a copy of AssistantReplyModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssistantBasketModelCopyWith<$Res>? get basket {
    if (_self.basket == null) {
    return null;
  }

  return $AssistantBasketModelCopyWith<$Res>(_self.basket!, (value) {
    return _then(_self.copyWith(basket: value));
  });
}
}


/// @nodoc
mixin _$AssistantBasketModel {

 List<String> get editionIds; int get totalBdt;
/// Create a copy of AssistantBasketModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssistantBasketModelCopyWith<AssistantBasketModel> get copyWith => _$AssistantBasketModelCopyWithImpl<AssistantBasketModel>(this as AssistantBasketModel, _$identity);

  /// Serializes this AssistantBasketModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AssistantBasketModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssistantBasketModel&&const DeepCollectionEquality().equals(other.editionIds, _this.editionIds)&&(identical(other.totalBdt, _this.totalBdt) || other.totalBdt == _this.totalBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AssistantBasketModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.editionIds),_this.totalBdt);
}

@override
String toString() {
  final _this = this as AssistantBasketModel;
  return 'AssistantBasketModel(editionIds: ${_this.editionIds}, totalBdt: ${_this.totalBdt})';
}


}

/// @nodoc
abstract mixin class $AssistantBasketModelCopyWith<$Res>  {
  factory $AssistantBasketModelCopyWith(AssistantBasketModel value, $Res Function(AssistantBasketModel) _then) = _$AssistantBasketModelCopyWithImpl;
@useResult
$Res call({
 List<String> editionIds, int totalBdt
});




}
/// @nodoc
class _$AssistantBasketModelCopyWithImpl<$Res>
    implements $AssistantBasketModelCopyWith<$Res> {
  _$AssistantBasketModelCopyWithImpl(this._self, this._then);

  final AssistantBasketModel _self;
  final $Res Function(AssistantBasketModel) _then;

/// Create a copy of AssistantBasketModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? editionIds = null,Object? totalBdt = null,}) {
  return _then(AssistantBasketModel(
editionIds: null == editionIds ? _self.editionIds : editionIds // ignore: cast_nullable_to_non_nullable
as List<String>,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AssistantBasketModel].
extension AssistantBasketModelPatterns on AssistantBasketModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssistantBasketModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssistantBasketModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssistantBasketModel value)  $default,){
final _that = this;
switch (_that) {
case _AssistantBasketModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssistantBasketModel value)?  $default,){
final _that = this;
switch (_that) {
case _AssistantBasketModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> editionIds,  int totalBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssistantBasketModel() when $default != null:
return $default(_that.editionIds,_that.totalBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> editionIds,  int totalBdt)  $default,) {final _that = this;
switch (_that) {
case _AssistantBasketModel():
return $default(_that.editionIds,_that.totalBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> editionIds,  int totalBdt)?  $default,) {final _that = this;
switch (_that) {
case _AssistantBasketModel() when $default != null:
return $default(_that.editionIds,_that.totalBdt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssistantBasketModel implements AssistantBasketModel {
  const _AssistantBasketModel({required  List<String> editionIds, required this.totalBdt}): _editionIds = editionIds;
  factory _AssistantBasketModel.fromJson(Map<String, dynamic> json) => _$AssistantBasketModelFromJson(json);

 final  List<String> _editionIds;
@override List<String> get editionIds {
  if (_editionIds is EqualUnmodifiableListView) return _editionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_editionIds);
}

@override final  int totalBdt;

/// Create a copy of AssistantBasketModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssistantBasketModelCopyWith<_AssistantBasketModel> get copyWith => __$AssistantBasketModelCopyWithImpl<_AssistantBasketModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssistantBasketModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssistantBasketModel&&const DeepCollectionEquality().equals(other.editionIds, _editionIds)&&(identical(other.totalBdt, totalBdt) || other.totalBdt == totalBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_editionIds),totalBdt);
}

@override
String toString() {
    return 'AssistantBasketModel(editionIds: $editionIds, totalBdt: $totalBdt)';
}


}

/// @nodoc
abstract mixin class _$AssistantBasketModelCopyWith<$Res> implements $AssistantBasketModelCopyWith<$Res> {
  factory _$AssistantBasketModelCopyWith(_AssistantBasketModel value, $Res Function(_AssistantBasketModel) _then) = __$AssistantBasketModelCopyWithImpl;
@override @useResult
$Res call({
 List<String> editionIds, int totalBdt
});




}
/// @nodoc
class __$AssistantBasketModelCopyWithImpl<$Res>
    implements _$AssistantBasketModelCopyWith<$Res> {
  __$AssistantBasketModelCopyWithImpl(this._self, this._then);

  final _AssistantBasketModel _self;
  final $Res Function(_AssistantBasketModel) _then;

/// Create a copy of AssistantBasketModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? editionIds = null,Object? totalBdt = null,}) {
  return _then(_AssistantBasketModel(
editionIds: null == editionIds ? _self._editionIds : editionIds // ignore: cast_nullable_to_non_nullable
as List<String>,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
