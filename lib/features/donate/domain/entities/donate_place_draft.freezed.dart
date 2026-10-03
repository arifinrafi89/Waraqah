// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donate_place_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DonatePlaceDraft {

/// Empty for a new place.
 String get id; String get name; RecipientKind get kind; String get district; String get area; String get story; List<PlaceNeedDraft> get needs;
/// Create a copy of DonatePlaceDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DonatePlaceDraftCopyWith<DonatePlaceDraft> get copyWith => _$DonatePlaceDraftCopyWithImpl<DonatePlaceDraft>(this as DonatePlaceDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DonatePlaceDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DonatePlaceDraft&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.district, _this.district) || other.district == _this.district)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.story, _this.story) || other.story == _this.story)&&const DeepCollectionEquality().equals(other.needs, _this.needs));
}


@override
int get hashCode {
  final _this = this as DonatePlaceDraft;
  return Object.hash(runtimeType,_this.id,_this.name,_this.kind,_this.district,_this.area,_this.story,const DeepCollectionEquality().hash(_this.needs));
}

@override
String toString() {
  final _this = this as DonatePlaceDraft;
  return 'DonatePlaceDraft(id: ${_this.id}, name: ${_this.name}, kind: ${_this.kind}, district: ${_this.district}, area: ${_this.area}, story: ${_this.story}, needs: ${_this.needs})';
}


}

/// @nodoc
abstract mixin class $DonatePlaceDraftCopyWith<$Res>  {
  factory $DonatePlaceDraftCopyWith(DonatePlaceDraft value, $Res Function(DonatePlaceDraft) _then) = _$DonatePlaceDraftCopyWithImpl;
@useResult
$Res call({
 String id, String name, RecipientKind kind, String district, String area, String story, List<PlaceNeedDraft> needs
});




}
/// @nodoc
class _$DonatePlaceDraftCopyWithImpl<$Res>
    implements $DonatePlaceDraftCopyWith<$Res> {
  _$DonatePlaceDraftCopyWithImpl(this._self, this._then);

  final DonatePlaceDraft _self;
  final $Res Function(DonatePlaceDraft) _then;

/// Create a copy of DonatePlaceDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? district = null,Object? area = null,Object? story = null,Object? needs = null,}) {
  return _then(DonatePlaceDraft(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RecipientKind,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as String,needs: null == needs ? _self.needs : needs // ignore: cast_nullable_to_non_nullable
as List<PlaceNeedDraft>,
  ));
}

}


/// Adds pattern-matching-related methods to [DonatePlaceDraft].
extension DonatePlaceDraftPatterns on DonatePlaceDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DonatePlaceDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DonatePlaceDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DonatePlaceDraft value)  $default,){
final _that = this;
switch (_that) {
case _DonatePlaceDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DonatePlaceDraft value)?  $default,){
final _that = this;
switch (_that) {
case _DonatePlaceDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  RecipientKind kind,  String district,  String area,  String story,  List<PlaceNeedDraft> needs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DonatePlaceDraft() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  RecipientKind kind,  String district,  String area,  String story,  List<PlaceNeedDraft> needs)  $default,) {final _that = this;
switch (_that) {
case _DonatePlaceDraft():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  RecipientKind kind,  String district,  String area,  String story,  List<PlaceNeedDraft> needs)?  $default,) {final _that = this;
switch (_that) {
case _DonatePlaceDraft() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.district,_that.area,_that.story,_that.needs);case _:
  return null;

}
}

}

/// @nodoc


class _DonatePlaceDraft implements DonatePlaceDraft {
  const _DonatePlaceDraft({this.id = '', this.name = '', this.kind = RecipientKind.library, this.district = '', this.area = '', this.story = '',  List<PlaceNeedDraft> needs = const <PlaceNeedDraft>[]}): _needs = needs;
  

/// Empty for a new place.
@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  RecipientKind kind;
@override@JsonKey() final  String district;
@override@JsonKey() final  String area;
@override@JsonKey() final  String story;
 final  List<PlaceNeedDraft> _needs;
@override@JsonKey() List<PlaceNeedDraft> get needs {
  if (_needs is EqualUnmodifiableListView) return _needs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_needs);
}


/// Create a copy of DonatePlaceDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DonatePlaceDraftCopyWith<_DonatePlaceDraft> get copyWith => __$DonatePlaceDraftCopyWithImpl<_DonatePlaceDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DonatePlaceDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.district, district) || other.district == district)&&(identical(other.area, area) || other.area == area)&&(identical(other.story, story) || other.story == story)&&const DeepCollectionEquality().equals(other.needs, _needs));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,kind,district,area,story,const DeepCollectionEquality().hash(_needs));
}

@override
String toString() {
    return 'DonatePlaceDraft(id: $id, name: $name, kind: $kind, district: $district, area: $area, story: $story, needs: $needs)';
}


}

/// @nodoc
abstract mixin class _$DonatePlaceDraftCopyWith<$Res> implements $DonatePlaceDraftCopyWith<$Res> {
  factory _$DonatePlaceDraftCopyWith(_DonatePlaceDraft value, $Res Function(_DonatePlaceDraft) _then) = __$DonatePlaceDraftCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, RecipientKind kind, String district, String area, String story, List<PlaceNeedDraft> needs
});




}
/// @nodoc
class __$DonatePlaceDraftCopyWithImpl<$Res>
    implements _$DonatePlaceDraftCopyWith<$Res> {
  __$DonatePlaceDraftCopyWithImpl(this._self, this._then);

  final _DonatePlaceDraft _self;
  final $Res Function(_DonatePlaceDraft) _then;

/// Create a copy of DonatePlaceDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? district = null,Object? area = null,Object? story = null,Object? needs = null,}) {
  return _then(_DonatePlaceDraft(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RecipientKind,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as String,needs: null == needs ? _self._needs : needs // ignore: cast_nullable_to_non_nullable
as List<PlaceNeedDraft>,
  ));
}


}

// dart format on
