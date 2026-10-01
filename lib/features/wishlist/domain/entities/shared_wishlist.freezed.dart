// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_wishlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SharedWishlist {

/// Goes in the link: `/wishlist/shared/<id>`.
 String get id; String get ownerName; List<Book> get books;
/// Create a copy of SharedWishlist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SharedWishlistCopyWith<SharedWishlist> get copyWith => _$SharedWishlistCopyWithImpl<SharedWishlist>(this as SharedWishlist, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SharedWishlist;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharedWishlist&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.ownerName, _this.ownerName) || other.ownerName == _this.ownerName)&&const DeepCollectionEquality().equals(other.books, _this.books));
}


@override
int get hashCode {
  final _this = this as SharedWishlist;
  return Object.hash(runtimeType,_this.id,_this.ownerName,const DeepCollectionEquality().hash(_this.books));
}

@override
String toString() {
  final _this = this as SharedWishlist;
  return 'SharedWishlist(id: ${_this.id}, ownerName: ${_this.ownerName}, books: ${_this.books})';
}


}

/// @nodoc
abstract mixin class $SharedWishlistCopyWith<$Res>  {
  factory $SharedWishlistCopyWith(SharedWishlist value, $Res Function(SharedWishlist) _then) = _$SharedWishlistCopyWithImpl;
@useResult
$Res call({
 String id, String ownerName, List<Book> books
});




}
/// @nodoc
class _$SharedWishlistCopyWithImpl<$Res>
    implements $SharedWishlistCopyWith<$Res> {
  _$SharedWishlistCopyWithImpl(this._self, this._then);

  final SharedWishlist _self;
  final $Res Function(SharedWishlist) _then;

/// Create a copy of SharedWishlist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerName = null,Object? books = null,}) {
  return _then(SharedWishlist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}

}


/// Adds pattern-matching-related methods to [SharedWishlist].
extension SharedWishlistPatterns on SharedWishlist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SharedWishlist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SharedWishlist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SharedWishlist value)  $default,){
final _that = this;
switch (_that) {
case _SharedWishlist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SharedWishlist value)?  $default,){
final _that = this;
switch (_that) {
case _SharedWishlist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerName,  List<Book> books)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SharedWishlist() when $default != null:
return $default(_that.id,_that.ownerName,_that.books);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerName,  List<Book> books)  $default,) {final _that = this;
switch (_that) {
case _SharedWishlist():
return $default(_that.id,_that.ownerName,_that.books);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerName,  List<Book> books)?  $default,) {final _that = this;
switch (_that) {
case _SharedWishlist() when $default != null:
return $default(_that.id,_that.ownerName,_that.books);case _:
  return null;

}
}

}

/// @nodoc


class _SharedWishlist implements SharedWishlist {
  const _SharedWishlist({required this.id, required this.ownerName, required  List<Book> books}): _books = books;
  

/// Goes in the link: `/wishlist/shared/<id>`.
@override final  String id;
@override final  String ownerName;
 final  List<Book> _books;
@override List<Book> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of SharedWishlist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SharedWishlistCopyWith<_SharedWishlist> get copyWith => __$SharedWishlistCopyWithImpl<_SharedWishlist>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SharedWishlist&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&const DeepCollectionEquality().equals(other.books, _books));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,ownerName,const DeepCollectionEquality().hash(_books));
}

@override
String toString() {
    return 'SharedWishlist(id: $id, ownerName: $ownerName, books: $books)';
}


}

/// @nodoc
abstract mixin class _$SharedWishlistCopyWith<$Res> implements $SharedWishlistCopyWith<$Res> {
  factory _$SharedWishlistCopyWith(_SharedWishlist value, $Res Function(_SharedWishlist) _then) = __$SharedWishlistCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerName, List<Book> books
});




}
/// @nodoc
class __$SharedWishlistCopyWithImpl<$Res>
    implements _$SharedWishlistCopyWith<$Res> {
  __$SharedWishlistCopyWithImpl(this._self, this._then);

  final _SharedWishlist _self;
  final $Res Function(_SharedWishlist) _then;

/// Create a copy of SharedWishlist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerName = null,Object? books = null,}) {
  return _then(_SharedWishlist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}


}

// dart format on
