// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Recipient {

 String get id; String get name; RecipientKind get kind; String get district; String get area;/// Who they are and who reads the books, in a sentence or two.
 String get story; List<RecipientNeed> get needs;
/// Create a copy of Recipient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipientCopyWith<Recipient> get copyWith => _$RecipientCopyWithImpl<Recipient>(this as Recipient, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Recipient;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipient&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.district, _this.district) || other.district == _this.district)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.story, _this.story) || other.story == _this.story)&&const DeepCollectionEquality().equals(other.needs, _this.needs));
}


@override
int get hashCode {
  final _this = this as Recipient;
  return Object.hash(runtimeType,_this.id,_this.name,_this.kind,_this.district,_this.area,_this.story,const DeepCollectionEquality().hash(_this.needs));
}

@override
String toString() {
  final _this = this as Recipient;
  return 'Recipient(id: ${_this.id}, name: ${_this.name}, kind: ${_this.kind}, district: ${_this.district}, area: ${_this.area}, story: ${_this.story}, needs: ${_this.needs})';
}


}

/// @nodoc
abstract mixin class $RecipientCopyWith<$Res>  {
  factory $RecipientCopyWith(Recipient value, $Res Function(Recipient) _then) = _$RecipientCopyWithImpl;
@useResult
$Res call({
 String id, String name, RecipientKind kind, String district, String area, String story, List<RecipientNeed> needs
});




}
/// @nodoc
class _$RecipientCopyWithImpl<$Res>
    implements $RecipientCopyWith<$Res> {
  _$RecipientCopyWithImpl(this._self, this._then);

  final Recipient _self;
  final $Res Function(Recipient) _then;

/// Create a copy of Recipient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? district = null,Object? area = null,Object? story = null,Object? needs = null,}) {
  return _then(Recipient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RecipientKind,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as String,needs: null == needs ? _self.needs : needs // ignore: cast_nullable_to_non_nullable
as List<RecipientNeed>,
  ));
}

}


/// Adds pattern-matching-related methods to [Recipient].
extension RecipientPatterns on Recipient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recipient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recipient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recipient value)  $default,){
final _that = this;
switch (_that) {
case _Recipient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recipient value)?  $default,){
final _that = this;
switch (_that) {
case _Recipient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  RecipientKind kind,  String district,  String area,  String story,  List<RecipientNeed> needs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recipient() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  RecipientKind kind,  String district,  String area,  String story,  List<RecipientNeed> needs)  $default,) {final _that = this;
switch (_that) {
case _Recipient():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  RecipientKind kind,  String district,  String area,  String story,  List<RecipientNeed> needs)?  $default,) {final _that = this;
switch (_that) {
case _Recipient() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.district,_that.area,_that.story,_that.needs);case _:
  return null;

}
}

}

/// @nodoc


class _Recipient extends Recipient {
  const _Recipient({required this.id, required this.name, required this.kind, required this.district, required this.area, required this.story, required  List<RecipientNeed> needs}): _needs = needs,super._();
  

@override final  String id;
@override final  String name;
@override final  RecipientKind kind;
@override final  String district;
@override final  String area;
/// Who they are and who reads the books, in a sentence or two.
@override final  String story;
 final  List<RecipientNeed> _needs;
@override List<RecipientNeed> get needs {
  if (_needs is EqualUnmodifiableListView) return _needs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_needs);
}


/// Create a copy of Recipient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipientCopyWith<_Recipient> get copyWith => __$RecipientCopyWithImpl<_Recipient>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.district, district) || other.district == district)&&(identical(other.area, area) || other.area == area)&&(identical(other.story, story) || other.story == story)&&const DeepCollectionEquality().equals(other.needs, _needs));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,kind,district,area,story,const DeepCollectionEquality().hash(_needs));
}

@override
String toString() {
    return 'Recipient(id: $id, name: $name, kind: $kind, district: $district, area: $area, story: $story, needs: $needs)';
}


}

/// @nodoc
abstract mixin class _$RecipientCopyWith<$Res> implements $RecipientCopyWith<$Res> {
  factory _$RecipientCopyWith(_Recipient value, $Res Function(_Recipient) _then) = __$RecipientCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, RecipientKind kind, String district, String area, String story, List<RecipientNeed> needs
});




}
/// @nodoc
class __$RecipientCopyWithImpl<$Res>
    implements _$RecipientCopyWith<$Res> {
  __$RecipientCopyWithImpl(this._self, this._then);

  final _Recipient _self;
  final $Res Function(_Recipient) _then;

/// Create a copy of Recipient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? district = null,Object? area = null,Object? story = null,Object? needs = null,}) {
  return _then(_Recipient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RecipientKind,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as String,needs: null == needs ? _self._needs : needs // ignore: cast_nullable_to_non_nullable
as List<RecipientNeed>,
  ));
}


}

/// @nodoc
mixin _$RecipientNeed {

 Book get book; String get editionId; int get priceBdt; int get wanted; int get received;
/// Create a copy of RecipientNeed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipientNeedCopyWith<RecipientNeed> get copyWith => _$RecipientNeedCopyWithImpl<RecipientNeed>(this as RecipientNeed, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RecipientNeed;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipientNeed&&(identical(other.book, _this.book) || other.book == _this.book)&&(identical(other.editionId, _this.editionId) || other.editionId == _this.editionId)&&(identical(other.priceBdt, _this.priceBdt) || other.priceBdt == _this.priceBdt)&&(identical(other.wanted, _this.wanted) || other.wanted == _this.wanted)&&(identical(other.received, _this.received) || other.received == _this.received));
}


@override
int get hashCode {
  final _this = this as RecipientNeed;
  return Object.hash(runtimeType,_this.book,_this.editionId,_this.priceBdt,_this.wanted,_this.received);
}

@override
String toString() {
  final _this = this as RecipientNeed;
  return 'RecipientNeed(book: ${_this.book}, editionId: ${_this.editionId}, priceBdt: ${_this.priceBdt}, wanted: ${_this.wanted}, received: ${_this.received})';
}


}

/// @nodoc
abstract mixin class $RecipientNeedCopyWith<$Res>  {
  factory $RecipientNeedCopyWith(RecipientNeed value, $Res Function(RecipientNeed) _then) = _$RecipientNeedCopyWithImpl;
@useResult
$Res call({
 Book book, String editionId, int priceBdt, int wanted, int received
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$RecipientNeedCopyWithImpl<$Res>
    implements $RecipientNeedCopyWith<$Res> {
  _$RecipientNeedCopyWithImpl(this._self, this._then);

  final RecipientNeed _self;
  final $Res Function(RecipientNeed) _then;

/// Create a copy of RecipientNeed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = null,Object? editionId = null,Object? priceBdt = null,Object? wanted = null,Object? received = null,}) {
  return _then(RecipientNeed(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,editionId: null == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,wanted: null == wanted ? _self.wanted : wanted // ignore: cast_nullable_to_non_nullable
as int,received: null == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RecipientNeed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecipientNeed].
extension RecipientNeedPatterns on RecipientNeed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipientNeed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipientNeed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipientNeed value)  $default,){
final _that = this;
switch (_that) {
case _RecipientNeed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipientNeed value)?  $default,){
final _that = this;
switch (_that) {
case _RecipientNeed() when $default != null:
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
case _RecipientNeed() when $default != null:
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
case _RecipientNeed():
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
case _RecipientNeed() when $default != null:
return $default(_that.book,_that.editionId,_that.priceBdt,_that.wanted,_that.received);case _:
  return null;

}
}

}

/// @nodoc


class _RecipientNeed extends RecipientNeed {
  const _RecipientNeed({required this.book, required this.editionId, required this.priceBdt, required this.wanted, required this.received}): super._();
  

@override final  Book book;
@override final  String editionId;
@override final  int priceBdt;
@override final  int wanted;
@override final  int received;

/// Create a copy of RecipientNeed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipientNeedCopyWith<_RecipientNeed> get copyWith => __$RecipientNeedCopyWithImpl<_RecipientNeed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipientNeed&&(identical(other.book, book) || other.book == book)&&(identical(other.editionId, editionId) || other.editionId == editionId)&&(identical(other.priceBdt, priceBdt) || other.priceBdt == priceBdt)&&(identical(other.wanted, wanted) || other.wanted == wanted)&&(identical(other.received, received) || other.received == received));
}


@override
int get hashCode {
    return Object.hash(runtimeType,book,editionId,priceBdt,wanted,received);
}

@override
String toString() {
    return 'RecipientNeed(book: $book, editionId: $editionId, priceBdt: $priceBdt, wanted: $wanted, received: $received)';
}


}

/// @nodoc
abstract mixin class _$RecipientNeedCopyWith<$Res> implements $RecipientNeedCopyWith<$Res> {
  factory _$RecipientNeedCopyWith(_RecipientNeed value, $Res Function(_RecipientNeed) _then) = __$RecipientNeedCopyWithImpl;
@override @useResult
$Res call({
 Book book, String editionId, int priceBdt, int wanted, int received
});


@override $BookCopyWith<$Res> get book;

}
/// @nodoc
class __$RecipientNeedCopyWithImpl<$Res>
    implements _$RecipientNeedCopyWith<$Res> {
  __$RecipientNeedCopyWithImpl(this._self, this._then);

  final _RecipientNeed _self;
  final $Res Function(_RecipientNeed) _then;

/// Create a copy of RecipientNeed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = null,Object? editionId = null,Object? priceBdt = null,Object? wanted = null,Object? received = null,}) {
  return _then(_RecipientNeed(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,editionId: null == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as String,priceBdt: null == priceBdt ? _self.priceBdt : priceBdt // ignore: cast_nullable_to_non_nullable
as int,wanted: null == wanted ? _self.wanted : wanted // ignore: cast_nullable_to_non_nullable
as int,received: null == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RecipientNeed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

// dart format on
