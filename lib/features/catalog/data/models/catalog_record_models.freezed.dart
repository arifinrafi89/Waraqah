// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_record_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryModel {

 String get id; Section get section; String get nameEn; String get nameBn;
/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<CategoryModel> get copyWith => _$CategoryModelCopyWithImpl<CategoryModel>(this as CategoryModel, _$identity);

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CategoryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.section, _this.section) || other.section == _this.section)&&(identical(other.nameEn, _this.nameEn) || other.nameEn == _this.nameEn)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CategoryModel;
  return Object.hash(runtimeType,_this.id,_this.section,_this.nameEn,_this.nameBn);
}

@override
String toString() {
  final _this = this as CategoryModel;
  return 'CategoryModel(id: ${_this.id}, section: ${_this.section}, nameEn: ${_this.nameEn}, nameBn: ${_this.nameBn})';
}


}

/// @nodoc
abstract mixin class $CategoryModelCopyWith<$Res>  {
  factory $CategoryModelCopyWith(CategoryModel value, $Res Function(CategoryModel) _then) = _$CategoryModelCopyWithImpl;
@useResult
$Res call({
 String id, Section section, String nameEn, String nameBn
});




}
/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._self, this._then);

  final CategoryModel _self;
  final $Res Function(CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? section = null,Object? nameEn = null,Object? nameBn = null,}) {
  return _then(CategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryModel].
extension CategoryModelPatterns on CategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Section section,  String nameEn,  String nameBn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
return $default(_that.id,_that.section,_that.nameEn,_that.nameBn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Section section,  String nameEn,  String nameBn)  $default,) {final _that = this;
switch (_that) {
case _CategoryModel():
return $default(_that.id,_that.section,_that.nameEn,_that.nameBn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Section section,  String nameEn,  String nameBn)?  $default,) {final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
return $default(_that.id,_that.section,_that.nameEn,_that.nameBn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryModel implements CategoryModel {
  const _CategoryModel({required this.id, required this.section, required this.nameEn, required this.nameBn});
  factory _CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

@override final  String id;
@override final  Section section;
@override final  String nameEn;
@override final  String nameBn;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryModelCopyWith<_CategoryModel> get copyWith => __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.section, section) || other.section == section)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,section,nameEn,nameBn);
}

@override
String toString() {
    return 'CategoryModel(id: $id, section: $section, nameEn: $nameEn, nameBn: $nameBn)';
}


}

/// @nodoc
abstract mixin class _$CategoryModelCopyWith<$Res> implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(_CategoryModel value, $Res Function(_CategoryModel) _then) = __$CategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, Section section, String nameEn, String nameBn
});




}
/// @nodoc
class __$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(this._self, this._then);

  final _CategoryModel _self;
  final $Res Function(_CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? section = null,Object? nameEn = null,Object? nameBn = null,}) {
  return _then(_CategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuthorModel {

 String get id; String get name; String? get nameBn; String? get bio;
/// Create a copy of AuthorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorModelCopyWith<AuthorModel> get copyWith => _$AuthorModelCopyWithImpl<AuthorModel>(this as AuthorModel, _$identity);

  /// Serializes this AuthorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuthorModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthorModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn)&&(identical(other.bio, _this.bio) || other.bio == _this.bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuthorModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.nameBn,_this.bio);
}

@override
String toString() {
  final _this = this as AuthorModel;
  return 'AuthorModel(id: ${_this.id}, name: ${_this.name}, nameBn: ${_this.nameBn}, bio: ${_this.bio})';
}


}

/// @nodoc
abstract mixin class $AuthorModelCopyWith<$Res>  {
  factory $AuthorModelCopyWith(AuthorModel value, $Res Function(AuthorModel) _then) = _$AuthorModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? nameBn, String? bio
});




}
/// @nodoc
class _$AuthorModelCopyWithImpl<$Res>
    implements $AuthorModelCopyWith<$Res> {
  _$AuthorModelCopyWithImpl(this._self, this._then);

  final AuthorModel _self;
  final $Res Function(AuthorModel) _then;

/// Create a copy of AuthorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameBn = freezed,Object? bio = freezed,}) {
  return _then(AuthorModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: freezed == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthorModel].
extension AuthorModelPatterns on AuthorModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthorModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthorModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthorModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthorModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthorModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? nameBn,  String? bio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthorModel() when $default != null:
return $default(_that.id,_that.name,_that.nameBn,_that.bio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? nameBn,  String? bio)  $default,) {final _that = this;
switch (_that) {
case _AuthorModel():
return $default(_that.id,_that.name,_that.nameBn,_that.bio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? nameBn,  String? bio)?  $default,) {final _that = this;
switch (_that) {
case _AuthorModel() when $default != null:
return $default(_that.id,_that.name,_that.nameBn,_that.bio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthorModel implements AuthorModel {
  const _AuthorModel({required this.id, required this.name, this.nameBn, this.bio});
  factory _AuthorModel.fromJson(Map<String, dynamic> json) => _$AuthorModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? nameBn;
@override final  String? bio;

/// Create a copy of AuthorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorModelCopyWith<_AuthorModel> get copyWith => __$AuthorModelCopyWithImpl<_AuthorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthorModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,nameBn,bio);
}

@override
String toString() {
    return 'AuthorModel(id: $id, name: $name, nameBn: $nameBn, bio: $bio)';
}


}

/// @nodoc
abstract mixin class _$AuthorModelCopyWith<$Res> implements $AuthorModelCopyWith<$Res> {
  factory _$AuthorModelCopyWith(_AuthorModel value, $Res Function(_AuthorModel) _then) = __$AuthorModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? nameBn, String? bio
});




}
/// @nodoc
class __$AuthorModelCopyWithImpl<$Res>
    implements _$AuthorModelCopyWith<$Res> {
  __$AuthorModelCopyWithImpl(this._self, this._then);

  final _AuthorModel _self;
  final $Res Function(_AuthorModel) _then;

/// Create a copy of AuthorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameBn = freezed,Object? bio = freezed,}) {
  return _then(_AuthorModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: freezed == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PublisherModel {

 String get id; String get name; String? get nameBn;
/// Create a copy of PublisherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublisherModelCopyWith<PublisherModel> get copyWith => _$PublisherModelCopyWithImpl<PublisherModel>(this as PublisherModel, _$identity);

  /// Serializes this PublisherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PublisherModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublisherModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameBn, _this.nameBn) || other.nameBn == _this.nameBn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PublisherModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.nameBn);
}

@override
String toString() {
  final _this = this as PublisherModel;
  return 'PublisherModel(id: ${_this.id}, name: ${_this.name}, nameBn: ${_this.nameBn})';
}


}

/// @nodoc
abstract mixin class $PublisherModelCopyWith<$Res>  {
  factory $PublisherModelCopyWith(PublisherModel value, $Res Function(PublisherModel) _then) = _$PublisherModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? nameBn
});




}
/// @nodoc
class _$PublisherModelCopyWithImpl<$Res>
    implements $PublisherModelCopyWith<$Res> {
  _$PublisherModelCopyWithImpl(this._self, this._then);

  final PublisherModel _self;
  final $Res Function(PublisherModel) _then;

/// Create a copy of PublisherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameBn = freezed,}) {
  return _then(PublisherModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: freezed == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PublisherModel].
extension PublisherModelPatterns on PublisherModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublisherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublisherModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublisherModel value)  $default,){
final _that = this;
switch (_that) {
case _PublisherModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublisherModel value)?  $default,){
final _that = this;
switch (_that) {
case _PublisherModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? nameBn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublisherModel() when $default != null:
return $default(_that.id,_that.name,_that.nameBn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? nameBn)  $default,) {final _that = this;
switch (_that) {
case _PublisherModel():
return $default(_that.id,_that.name,_that.nameBn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? nameBn)?  $default,) {final _that = this;
switch (_that) {
case _PublisherModel() when $default != null:
return $default(_that.id,_that.name,_that.nameBn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublisherModel implements PublisherModel {
  const _PublisherModel({required this.id, required this.name, this.nameBn});
  factory _PublisherModel.fromJson(Map<String, dynamic> json) => _$PublisherModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? nameBn;

/// Create a copy of PublisherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublisherModelCopyWith<_PublisherModel> get copyWith => __$PublisherModelCopyWithImpl<_PublisherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublisherModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublisherModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,nameBn);
}

@override
String toString() {
    return 'PublisherModel(id: $id, name: $name, nameBn: $nameBn)';
}


}

/// @nodoc
abstract mixin class _$PublisherModelCopyWith<$Res> implements $PublisherModelCopyWith<$Res> {
  factory _$PublisherModelCopyWith(_PublisherModel value, $Res Function(_PublisherModel) _then) = __$PublisherModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? nameBn
});




}
/// @nodoc
class __$PublisherModelCopyWithImpl<$Res>
    implements _$PublisherModelCopyWith<$Res> {
  __$PublisherModelCopyWithImpl(this._self, this._then);

  final _PublisherModel _self;
  final $Res Function(_PublisherModel) _then;

/// Create a copy of PublisherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameBn = freezed,}) {
  return _then(_PublisherModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameBn: freezed == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
