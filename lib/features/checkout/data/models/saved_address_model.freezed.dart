// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedAddressModel {

 String get id; String get label; String get recipient; String get phone; String get line; String get upazila; String get district; String get division;
/// Create a copy of SavedAddressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedAddressModelCopyWith<SavedAddressModel> get copyWith => _$SavedAddressModelCopyWithImpl<SavedAddressModel>(this as SavedAddressModel, _$identity);

  /// Serializes this SavedAddressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SavedAddressModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedAddressModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.recipient, _this.recipient) || other.recipient == _this.recipient)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.line, _this.line) || other.line == _this.line)&&(identical(other.upazila, _this.upazila) || other.upazila == _this.upazila)&&(identical(other.district, _this.district) || other.district == _this.district)&&(identical(other.division, _this.division) || other.division == _this.division));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SavedAddressModel;
  return Object.hash(runtimeType,_this.id,_this.label,_this.recipient,_this.phone,_this.line,_this.upazila,_this.district,_this.division);
}

@override
String toString() {
  final _this = this as SavedAddressModel;
  return 'SavedAddressModel(id: ${_this.id}, label: ${_this.label}, recipient: ${_this.recipient}, phone: ${_this.phone}, line: ${_this.line}, upazila: ${_this.upazila}, district: ${_this.district}, division: ${_this.division})';
}


}

/// @nodoc
abstract mixin class $SavedAddressModelCopyWith<$Res>  {
  factory $SavedAddressModelCopyWith(SavedAddressModel value, $Res Function(SavedAddressModel) _then) = _$SavedAddressModelCopyWithImpl;
@useResult
$Res call({
 String id, String label, String recipient, String phone, String line, String upazila, String district, String division
});




}
/// @nodoc
class _$SavedAddressModelCopyWithImpl<$Res>
    implements $SavedAddressModelCopyWith<$Res> {
  _$SavedAddressModelCopyWithImpl(this._self, this._then);

  final SavedAddressModel _self;
  final $Res Function(SavedAddressModel) _then;

/// Create a copy of SavedAddressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? recipient = null,Object? phone = null,Object? line = null,Object? upazila = null,Object? district = null,Object? division = null,}) {
  return _then(SavedAddressModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String,upazila: null == upazila ? _self.upazila : upazila // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,division: null == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedAddressModel].
extension SavedAddressModelPatterns on SavedAddressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedAddressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedAddressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedAddressModel value)  $default,){
final _that = this;
switch (_that) {
case _SavedAddressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedAddressModel value)?  $default,){
final _that = this;
switch (_that) {
case _SavedAddressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String recipient,  String phone,  String line,  String upazila,  String district,  String division)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedAddressModel() when $default != null:
return $default(_that.id,_that.label,_that.recipient,_that.phone,_that.line,_that.upazila,_that.district,_that.division);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String recipient,  String phone,  String line,  String upazila,  String district,  String division)  $default,) {final _that = this;
switch (_that) {
case _SavedAddressModel():
return $default(_that.id,_that.label,_that.recipient,_that.phone,_that.line,_that.upazila,_that.district,_that.division);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String recipient,  String phone,  String line,  String upazila,  String district,  String division)?  $default,) {final _that = this;
switch (_that) {
case _SavedAddressModel() when $default != null:
return $default(_that.id,_that.label,_that.recipient,_that.phone,_that.line,_that.upazila,_that.district,_that.division);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedAddressModel implements SavedAddressModel {
  const _SavedAddressModel({required this.id, required this.label, required this.recipient, required this.phone, required this.line, required this.upazila, required this.district, required this.division});
  factory _SavedAddressModel.fromJson(Map<String, dynamic> json) => _$SavedAddressModelFromJson(json);

@override final  String id;
@override final  String label;
@override final  String recipient;
@override final  String phone;
@override final  String line;
@override final  String upazila;
@override final  String district;
@override final  String division;

/// Create a copy of SavedAddressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedAddressModelCopyWith<_SavedAddressModel> get copyWith => __$SavedAddressModelCopyWithImpl<_SavedAddressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedAddressModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedAddressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.line, line) || other.line == line)&&(identical(other.upazila, upazila) || other.upazila == upazila)&&(identical(other.district, district) || other.district == district)&&(identical(other.division, division) || other.division == division));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,recipient,phone,line,upazila,district,division);
}

@override
String toString() {
    return 'SavedAddressModel(id: $id, label: $label, recipient: $recipient, phone: $phone, line: $line, upazila: $upazila, district: $district, division: $division)';
}


}

/// @nodoc
abstract mixin class _$SavedAddressModelCopyWith<$Res> implements $SavedAddressModelCopyWith<$Res> {
  factory _$SavedAddressModelCopyWith(_SavedAddressModel value, $Res Function(_SavedAddressModel) _then) = __$SavedAddressModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String recipient, String phone, String line, String upazila, String district, String division
});




}
/// @nodoc
class __$SavedAddressModelCopyWithImpl<$Res>
    implements _$SavedAddressModelCopyWith<$Res> {
  __$SavedAddressModelCopyWithImpl(this._self, this._then);

  final _SavedAddressModel _self;
  final $Res Function(_SavedAddressModel) _then;

/// Create a copy of SavedAddressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? recipient = null,Object? phone = null,Object? line = null,Object? upazila = null,Object? district = null,Object? division = null,}) {
  return _then(_SavedAddressModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String,upazila: null == upazila ? _self.upazila : upazila // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,division: null == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
