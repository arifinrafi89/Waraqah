// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelf_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShelfEntryModel {

 Book get book; Shelf get shelf; DateTime get addedAt; DateTime? get finishedAt; int get progress; int? get pagesRead; int? get totalPages;
/// Create a copy of ShelfEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelfEntryModelCopyWith<ShelfEntryModel> get copyWith => _$ShelfEntryModelCopyWithImpl<ShelfEntryModel>(this as ShelfEntryModel, _$identity);

  /// Serializes this ShelfEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShelfEntryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShelfEntryModel&&(identical(other.book, _this.book) || other.book == _this.book)&&(identical(other.shelf, _this.shelf) || other.shelf == _this.shelf)&&(identical(other.addedAt, _this.addedAt) || other.addedAt == _this.addedAt)&&(identical(other.finishedAt, _this.finishedAt) || other.finishedAt == _this.finishedAt)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&(identical(other.pagesRead, _this.pagesRead) || other.pagesRead == _this.pagesRead)&&(identical(other.totalPages, _this.totalPages) || other.totalPages == _this.totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShelfEntryModel;
  return Object.hash(runtimeType,_this.book,_this.shelf,_this.addedAt,_this.finishedAt,_this.progress,_this.pagesRead,_this.totalPages);
}

@override
String toString() {
  final _this = this as ShelfEntryModel;
  return 'ShelfEntryModel(book: ${_this.book}, shelf: ${_this.shelf}, addedAt: ${_this.addedAt}, finishedAt: ${_this.finishedAt}, progress: ${_this.progress}, pagesRead: ${_this.pagesRead}, totalPages: ${_this.totalPages})';
}


}

/// @nodoc
abstract mixin class $ShelfEntryModelCopyWith<$Res>  {
  factory $ShelfEntryModelCopyWith(ShelfEntryModel value, $Res Function(ShelfEntryModel) _then) = _$ShelfEntryModelCopyWithImpl;
@useResult
$Res call({
 Book book, Shelf shelf, DateTime addedAt, DateTime? finishedAt, int progress, int? pagesRead, int? totalPages
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$ShelfEntryModelCopyWithImpl<$Res>
    implements $ShelfEntryModelCopyWith<$Res> {
  _$ShelfEntryModelCopyWithImpl(this._self, this._then);

  final ShelfEntryModel _self;
  final $Res Function(ShelfEntryModel) _then;

/// Create a copy of ShelfEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = null,Object? shelf = null,Object? addedAt = null,Object? finishedAt = freezed,Object? progress = null,Object? pagesRead = freezed,Object? totalPages = freezed,}) {
  return _then(ShelfEntryModel(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,shelf: null == shelf ? _self.shelf : shelf // ignore: cast_nullable_to_non_nullable
as Shelf,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,pagesRead: freezed == pagesRead ? _self.pagesRead : pagesRead // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ShelfEntryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShelfEntryModel].
extension ShelfEntryModelPatterns on ShelfEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShelfEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShelfEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShelfEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _ShelfEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShelfEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShelfEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Book book,  Shelf shelf,  DateTime addedAt,  DateTime? finishedAt,  int progress,  int? pagesRead,  int? totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShelfEntryModel() when $default != null:
return $default(_that.book,_that.shelf,_that.addedAt,_that.finishedAt,_that.progress,_that.pagesRead,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Book book,  Shelf shelf,  DateTime addedAt,  DateTime? finishedAt,  int progress,  int? pagesRead,  int? totalPages)  $default,) {final _that = this;
switch (_that) {
case _ShelfEntryModel():
return $default(_that.book,_that.shelf,_that.addedAt,_that.finishedAt,_that.progress,_that.pagesRead,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Book book,  Shelf shelf,  DateTime addedAt,  DateTime? finishedAt,  int progress,  int? pagesRead,  int? totalPages)?  $default,) {final _that = this;
switch (_that) {
case _ShelfEntryModel() when $default != null:
return $default(_that.book,_that.shelf,_that.addedAt,_that.finishedAt,_that.progress,_that.pagesRead,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ShelfEntryModel implements ShelfEntryModel {
  const _ShelfEntryModel({required this.book, required this.shelf, required this.addedAt, this.finishedAt, this.progress = 0, this.pagesRead, this.totalPages});
  factory _ShelfEntryModel.fromJson(Map<String, dynamic> json) => _$ShelfEntryModelFromJson(json);

@override final  Book book;
@override final  Shelf shelf;
@override final  DateTime addedAt;
@override final  DateTime? finishedAt;
@override@JsonKey() final  int progress;
@override final  int? pagesRead;
@override final  int? totalPages;

/// Create a copy of ShelfEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShelfEntryModelCopyWith<_ShelfEntryModel> get copyWith => __$ShelfEntryModelCopyWithImpl<_ShelfEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShelfEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShelfEntryModel&&(identical(other.book, book) || other.book == book)&&(identical(other.shelf, shelf) || other.shelf == shelf)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.pagesRead, pagesRead) || other.pagesRead == pagesRead)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,book,shelf,addedAt,finishedAt,progress,pagesRead,totalPages);
}

@override
String toString() {
    return 'ShelfEntryModel(book: $book, shelf: $shelf, addedAt: $addedAt, finishedAt: $finishedAt, progress: $progress, pagesRead: $pagesRead, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$ShelfEntryModelCopyWith<$Res> implements $ShelfEntryModelCopyWith<$Res> {
  factory _$ShelfEntryModelCopyWith(_ShelfEntryModel value, $Res Function(_ShelfEntryModel) _then) = __$ShelfEntryModelCopyWithImpl;
@override @useResult
$Res call({
 Book book, Shelf shelf, DateTime addedAt, DateTime? finishedAt, int progress, int? pagesRead, int? totalPages
});


@override $BookCopyWith<$Res> get book;

}
/// @nodoc
class __$ShelfEntryModelCopyWithImpl<$Res>
    implements _$ShelfEntryModelCopyWith<$Res> {
  __$ShelfEntryModelCopyWithImpl(this._self, this._then);

  final _ShelfEntryModel _self;
  final $Res Function(_ShelfEntryModel) _then;

/// Create a copy of ShelfEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = null,Object? shelf = null,Object? addedAt = null,Object? finishedAt = freezed,Object? progress = null,Object? pagesRead = freezed,Object? totalPages = freezed,}) {
  return _then(_ShelfEntryModel(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,shelf: null == shelf ? _self.shelf : shelf // ignore: cast_nullable_to_non_nullable
as Shelf,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,pagesRead: freezed == pagesRead ? _self.pagesRead : pagesRead // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ShelfEntryModel
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
