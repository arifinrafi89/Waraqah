// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipientModel {

 String get id; String get name; RecipientKind get kind; String get district; String get area; String get story; List<RecipientNeedModel> get needs;
/// Create a copy of RecipientModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipientModelCopyWith<RecipientModel> get copyWith => _$RecipientModelCopyWithImpl<RecipientModel>(this as RecipientModel, _$identity);

  /// Serializes this RecipientModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RecipientModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipientModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.district, _this.district) || other.district == _this.district)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.story, _this.story) || other.story == _this.story)&&const DeepCollectionEquality().equals(other.needs, _this.needs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RecipientModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.kind,_this.district,_this.area,_this.story,const DeepCollectionEquality().hash(_this.needs));
}

@override
String toString() {
  final _this = this as RecipientModel;
  return 'RecipientModel(id: ${_this.id}, name: ${_this.name}, kind: ${_this.kind}, district: ${_this.district}, area: ${_this.area}, story: ${_this.story}, needs: ${_this.needs})';
}


}

/// @nodoc
abstract mixin class $RecipientModelCopyWith<$Res>  {
  factory $RecipientModelCopyWith(RecipientModel value, $Res Function(RecipientModel) _then) = _$RecipientModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, RecipientKind kind, String district, String area, String story, List<RecipientNeedModel> needs
});




}
/// @nodoc
class _$RecipientModelCopyWithImpl<$Res>
    implements $RecipientModelCopyWith<$Res> {
  _$RecipientModelCopyWithImpl(this._self, this._then);

  final RecipientModel _self;
  final $Res Function(RecipientModel) _then;

/// Create a copy of RecipientModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? district = null,Object? area = null,Object? story = null,Object? needs = null,}) {
  return _then(RecipientModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RecipientKind,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as String,needs: null == needs ? _self.needs : needs // ignore: cast_nullable_to_non_nullable
as List<RecipientNeedModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipientModel].
extension RecipientModelPatterns on RecipientModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipientModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipientModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipientModel value)  $default,){
final _that = this;
switch (_that) {
case _RecipientModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipientModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecipientModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  RecipientKind kind,  String district,  String area,  String story,  List<RecipientNeedModel> needs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipientModel() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.district,_that.area,_that.story,_that.needs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  RecipientKind kind,  String district,  String area,  String story,  List<RecipientNeedModel> needs)  $default,) {final _that = this;
switch (_that) {
case _RecipientModel():
return $default(_that.id,_that.name,_that.kind,_that.district,_that.area,_that.story,_that.needs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  RecipientKind kind,  String district,  String area,  String story,  List<RecipientNeedModel> needs)?  $default,) {final _that = this;
switch (_that) {
case _RecipientModel() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.district,_that.area,_that.story,_that.needs);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RecipientModel implements RecipientModel {
  const _RecipientModel({required this.id, required this.name, required this.kind, required this.district, required this.area, required this.story, required  List<RecipientNeedModel> needs}): _needs = needs;
  factory _RecipientModel.fromJson(Map<String, dynamic> json) => _$RecipientModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  RecipientKind kind;
@override final  String district;
@override final  String area;
@override final  String story;
 final  List<RecipientNeedModel> _needs;
@override List<RecipientNeedModel> get needs {
  if (_needs is EqualUnmodifiableListView) return _needs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_needs);
}


/// Create a copy of RecipientModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipientModelCopyWith<_RecipientModel> get copyWith => __$RecipientModelCopyWithImpl<_RecipientModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipientModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipientModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.district, district) || other.district == district)&&(identical(other.area, area) || other.area == area)&&(identical(other.story, story) || other.story == story)&&const DeepCollectionEquality().equals(other.needs, _needs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,kind,district,area,story,const DeepCollectionEquality().hash(_needs));
}

@override
String toString() {
    return 'RecipientModel(id: $id, name: $name, kind: $kind, district: $district, area: $area, story: $story, needs: $needs)';
}


}

/// @nodoc
abstract mixin class _$RecipientModelCopyWith<$Res> implements $RecipientModelCopyWith<$Res> {
  factory _$RecipientModelCopyWith(_RecipientModel value, $Res Function(_RecipientModel) _then) = __$RecipientModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, RecipientKind kind, String district, String area, String story, List<RecipientNeedModel> needs
});




}
/// @nodoc
class __$RecipientModelCopyWithImpl<$Res>
    implements _$RecipientModelCopyWith<$Res> {
  __$RecipientModelCopyWithImpl(this._self, this._then);

  final _RecipientModel _self;
  final $Res Function(_RecipientModel) _then;

/// Create a copy of RecipientModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? district = null,Object? area = null,Object? story = null,Object? needs = null,}) {
  return _then(_RecipientModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RecipientKind,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as String,needs: null == needs ? _self._needs : needs // ignore: cast_nullable_to_non_nullable
as List<RecipientNeedModel>,
  ));
}


}


/// @nodoc
mixin _$RecipientNeedModel {

 Book get book; String get editionId; int get priceBdt; int get wanted; int get received;
/// Create a copy of RecipientNeedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipientNeedModelCopyWith<RecipientNeedModel> get copyWith => _$RecipientNeedModelCopyWithImpl<RecipientNeedModel>(this as RecipientNeedModel, _$identity);

  /// Serializes this RecipientNeedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RecipientNeedModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipientNeedModel&&(identical(other.book, _this.book) || other.book == _this.book)&&(identical(other.editionId, _this.editionId) || other.editionId == _this.editionId)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.wanted, _this.wanted) || other.wanted == _this.wanted)&&(identical(other.received, _this.received) || other.received == _this.received));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RecipientNeedModel;
  return Object.hash(runtimeType,_this.book,_this.editionId,_this.priceBdt,_this.wanted,_this.received);
}

@override
String toString() {
  final _this = this as RecipientNeedModel;
  return 'RecipientNeedModel(book: ${_this.book}, editionId: ${_this.editionId}, priceBdt: ${_this.priceBdt}, wanted: ${_this.wanted}, received: ${_this.received})';
}


}

/// @nodoc
abstract mixin class $RecipientNeedModelCopyWith<$Res>  {
  factory $RecipientNeedModelCopyWith(RecipientNeedModel value, $Res Function(RecipientNeedModel) _then) = _$RecipientNeedModelCopyWithImpl;
@useResult
$Res call({
 Book book, String editionId, int priceBdt, int wanted, int received
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$RecipientNeedModelCopyWithImpl<$Res>
    implements $RecipientNeedModelCopyWith<$Res> {
  _$RecipientNeedModelCopyWithImpl(this._self, this._then);

  final RecipientNeedModel _self;
  final $Res Function(RecipientNeedModel) _then;

/// Create a copy of RecipientNeedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = null,Object? editionId = null,Object? priceBdt = null,Object? wanted = null,Object? received = null,}) {
  return _then(RecipientNeedModel(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,editionId: null == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,wanted: null == wanted ? _self.wanted : wanted // ignore: cast_nullable_to_non_nullable
as int,received: null == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RecipientNeedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecipientNeedModel].
extension RecipientNeedModelPatterns on RecipientNeedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipientNeedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipientNeedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipientNeedModel value)  $default,){
final _that = this;
switch (_that) {
case _RecipientNeedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipientNeedModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecipientNeedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Book book,  String editionId,  int priceBdt,  int wanted,  int received)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipientNeedModel() when $default != null:
return $default(_that.book,_that.editionId,_that.priceBdt,_that.wanted,_that.received);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Book book,  String editionId,  int priceBdt,  int wanted,  int received)  $default,) {final _that = this;
switch (_that) {
case _RecipientNeedModel():
return $default(_that.book,_that.editionId,_that.priceBdt,_that.wanted,_that.received);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Book book,  String editionId,  int priceBdt,  int wanted,  int received)?  $default,) {final _that = this;
switch (_that) {
case _RecipientNeedModel() when $default != null:
return $default(_that.book,_that.editionId,_that.priceBdt,_that.wanted,_that.received);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RecipientNeedModel implements RecipientNeedModel {
  const _RecipientNeedModel({required this.book, required this.editionId, required this.priceBdt, required this.wanted, required this.received});
  factory _RecipientNeedModel.fromJson(Map<String, dynamic> json) => _$RecipientNeedModelFromJson(json);

@override final  Book book;
@override final  String editionId;
@override final  int priceBdt;
@override final  int wanted;
@override final  int received;

/// Create a copy of RecipientNeedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipientNeedModelCopyWith<_RecipientNeedModel> get copyWith => __$RecipientNeedModelCopyWithImpl<_RecipientNeedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipientNeedModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipientNeedModel&&(identical(other.book, book) || other.book == book)&&(identical(other.editionId, editionId) || other.editionId == editionId)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.wanted, wanted) || other.wanted == wanted)&&(identical(other.received, received) || other.received == received));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,book,editionId,priceBdt,wanted,received);
}

@override
String toString() {
    return 'RecipientNeedModel(book: $book, editionId: $editionId, priceBdt: $priceBdt, wanted: $wanted, received: $received)';
}


}

/// @nodoc
abstract mixin class _$RecipientNeedModelCopyWith<$Res> implements $RecipientNeedModelCopyWith<$Res> {
  factory _$RecipientNeedModelCopyWith(_RecipientNeedModel value, $Res Function(_RecipientNeedModel) _then) = __$RecipientNeedModelCopyWithImpl;
@override @useResult
$Res call({
 Book book, String editionId, int priceBdt, int wanted, int received
});


@override $BookCopyWith<$Res> get book;

}
/// @nodoc
class __$RecipientNeedModelCopyWithImpl<$Res>
    implements _$RecipientNeedModelCopyWith<$Res> {
  __$RecipientNeedModelCopyWithImpl(this._self, this._then);

  final _RecipientNeedModel _self;
  final $Res Function(_RecipientNeedModel) _then;

/// Create a copy of RecipientNeedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = null,Object? editionId = null,Object? priceBdt = null,Object? wanted = null,Object? received = null,}) {
  return _then(_RecipientNeedModel(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,editionId: null == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,wanted: null == wanted ? _self.wanted : wanted // ignore: cast_nullable_to_non_nullable
as int,received: null == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RecipientNeedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// @nodoc
mixin _$DonationModel {

 String get orderNumber; int get totalBdt;
/// Create a copy of DonationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DonationModelCopyWith<DonationModel> get copyWith => _$DonationModelCopyWithImpl<DonationModel>(this as DonationModel, _$identity);

  /// Serializes this DonationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DonationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DonationModel&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.totalBdt, _this.totalBdt) || other.totalBdt == _this.totalBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DonationModel;
  return Object.hash(runtimeType,_this.orderNumber,_this.totalBdt);
}

@override
String toString() {
  final _this = this as DonationModel;
  return 'DonationModel(orderNumber: ${_this.orderNumber}, totalBdt: ${_this.totalBdt})';
}


}

/// @nodoc
abstract mixin class $DonationModelCopyWith<$Res>  {
  factory $DonationModelCopyWith(DonationModel value, $Res Function(DonationModel) _then) = _$DonationModelCopyWithImpl;
@useResult
$Res call({
 String orderNumber, int totalBdt
});




}
/// @nodoc
class _$DonationModelCopyWithImpl<$Res>
    implements $DonationModelCopyWith<$Res> {
  _$DonationModelCopyWithImpl(this._self, this._then);

  final DonationModel _self;
  final $Res Function(DonationModel) _then;

/// Create a copy of DonationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderNumber = null,Object? totalBdt = null,}) {
  return _then(DonationModel(
orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DonationModel].
extension DonationModelPatterns on DonationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DonationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DonationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DonationModel value)  $default,){
final _that = this;
switch (_that) {
case _DonationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DonationModel value)?  $default,){
final _that = this;
switch (_that) {
case _DonationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderNumber,  int totalBdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DonationModel() when $default != null:
return $default(_that.orderNumber,_that.totalBdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderNumber,  int totalBdt)  $default,) {final _that = this;
switch (_that) {
case _DonationModel():
return $default(_that.orderNumber,_that.totalBdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderNumber,  int totalBdt)?  $default,) {final _that = this;
switch (_that) {
case _DonationModel() when $default != null:
return $default(_that.orderNumber,_that.totalBdt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DonationModel implements DonationModel {
  const _DonationModel({required this.orderNumber, required this.totalBdt});
  factory _DonationModel.fromJson(Map<String, dynamic> json) => _$DonationModelFromJson(json);

@override final  String orderNumber;
@override final  int totalBdt;

/// Create a copy of DonationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DonationModelCopyWith<_DonationModel> get copyWith => __$DonationModelCopyWithImpl<_DonationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DonationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DonationModel&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.totalBdt, totalBdt) || other.totalBdt == totalBdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,orderNumber,totalBdt);
}

@override
String toString() {
    return 'DonationModel(orderNumber: $orderNumber, totalBdt: $totalBdt)';
}


}

/// @nodoc
abstract mixin class _$DonationModelCopyWith<$Res> implements $DonationModelCopyWith<$Res> {
  factory _$DonationModelCopyWith(_DonationModel value, $Res Function(_DonationModel) _then) = __$DonationModelCopyWithImpl;
@override @useResult
$Res call({
 String orderNumber, int totalBdt
});




}
/// @nodoc
class __$DonationModelCopyWithImpl<$Res>
    implements _$DonationModelCopyWith<$Res> {
  __$DonationModelCopyWithImpl(this._self, this._then);

  final _DonationModel _self;
  final $Res Function(_DonationModel) _then;

/// Create a copy of DonationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderNumber = null,Object? totalBdt = null,}) {
  return _then(_DonationModel(
orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,totalBdt: null == totalBdt ? _self.totalBdt : totalBdt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
