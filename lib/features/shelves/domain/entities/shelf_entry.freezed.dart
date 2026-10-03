// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelf_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShelfEntry {

 Book get book; Shelf get shelf; DateTime get addedAt;/// When it moved to Finished.
 DateTime? get finishedAt;
/// Create a copy of ShelfEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelfEntryCopyWith<ShelfEntry> get copyWith => _$ShelfEntryCopyWithImpl<ShelfEntry>(this as ShelfEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ShelfEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShelfEntry&&(identical(other.book, _this.book) || other.book == _this.book)&&(identical(other.shelf, _this.shelf) || other.shelf == _this.shelf)&&(identical(other.addedAt, _this.addedAt) || other.addedAt == _this.addedAt)&&(identical(other.finishedAt, _this.finishedAt) || other.finishedAt == _this.finishedAt));
}


@override
int get hashCode {
  final _this = this as ShelfEntry;
  return Object.hash(runtimeType,_this.book,_this.shelf,_this.addedAt,_this.finishedAt);
}

@override
String toString() {
  final _this = this as ShelfEntry;
  return 'ShelfEntry(book: ${_this.book}, shelf: ${_this.shelf}, addedAt: ${_this.addedAt}, finishedAt: ${_this.finishedAt})';
}


}

/// @nodoc
abstract mixin class $ShelfEntryCopyWith<$Res>  {
  factory $ShelfEntryCopyWith(ShelfEntry value, $Res Function(ShelfEntry) _then) = _$ShelfEntryCopyWithImpl;
@useResult
$Res call({
 Book book, Shelf shelf, DateTime addedAt, DateTime? finishedAt
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$ShelfEntryCopyWithImpl<$Res>
    implements $ShelfEntryCopyWith<$Res> {
  _$ShelfEntryCopyWithImpl(this._self, this._then);

  final ShelfEntry _self;
  final $Res Function(ShelfEntry) _then;

/// Create a copy of ShelfEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = null,Object? shelf = null,Object? addedAt = null,Object? finishedAt = freezed,}) {
  return _then(ShelfEntry(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,shelf: null == shelf ? _self.shelf : shelf // ignore: cast_nullable_to_non_nullable
as Shelf,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ShelfEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShelfEntry].
extension ShelfEntryPatterns on ShelfEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShelfEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShelfEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShelfEntry value)  $default,){
final _that = this;
switch (_that) {
case _ShelfEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShelfEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ShelfEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Book book,  Shelf shelf,  DateTime addedAt,  DateTime? finishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShelfEntry() when $default != null:
return $default(_that.book,_that.shelf,_that.addedAt,_that.finishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Book book,  Shelf shelf,  DateTime addedAt,  DateTime? finishedAt)  $default,) {final _that = this;
switch (_that) {
case _ShelfEntry():
return $default(_that.book,_that.shelf,_that.addedAt,_that.finishedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Book book,  Shelf shelf,  DateTime addedAt,  DateTime? finishedAt)?  $default,) {final _that = this;
switch (_that) {
case _ShelfEntry() when $default != null:
return $default(_that.book,_that.shelf,_that.addedAt,_that.finishedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ShelfEntry implements ShelfEntry {
  const _ShelfEntry({required this.book, required this.shelf, required this.addedAt, this.finishedAt});
  

@override final  Book book;
@override final  Shelf shelf;
@override final  DateTime addedAt;
/// When it moved to Finished.
@override final  DateTime? finishedAt;

/// Create a copy of ShelfEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShelfEntryCopyWith<_ShelfEntry> get copyWith => __$ShelfEntryCopyWithImpl<_ShelfEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShelfEntry&&(identical(other.book, book) || other.book == book)&&(identical(other.shelf, shelf) || other.shelf == shelf)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,book,shelf,addedAt,finishedAt);
}

@override
String toString() {
    return 'ShelfEntry(book: $book, shelf: $shelf, addedAt: $addedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class _$ShelfEntryCopyWith<$Res> implements $ShelfEntryCopyWith<$Res> {
  factory _$ShelfEntryCopyWith(_ShelfEntry value, $Res Function(_ShelfEntry) _then) = __$ShelfEntryCopyWithImpl;
@override @useResult
$Res call({
 Book book, Shelf shelf, DateTime addedAt, DateTime? finishedAt
});


@override $BookCopyWith<$Res> get book;

}
/// @nodoc
class __$ShelfEntryCopyWithImpl<$Res>
    implements _$ShelfEntryCopyWith<$Res> {
  __$ShelfEntryCopyWithImpl(this._self, this._then);

  final _ShelfEntry _self;
  final $Res Function(_ShelfEntry) _then;

/// Create a copy of ShelfEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = null,Object? shelf = null,Object? addedAt = null,Object? finishedAt = freezed,}) {
  return _then(_ShelfEntry(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,shelf: null == shelf ? _self.shelf : shelf // ignore: cast_nullable_to_non_nullable
as Shelf,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ShelfEntry
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
