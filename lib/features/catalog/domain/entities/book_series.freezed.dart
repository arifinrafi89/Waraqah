// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeriesEntry {

 int get position; String get title; String? get bookId; int get coverSeed;
/// Create a copy of SeriesEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesEntryCopyWith<SeriesEntry> get copyWith => _$SeriesEntryCopyWithImpl<SeriesEntry>(this as SeriesEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SeriesEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesEntry&&(identical(other.position, _this.position) || other.position == _this.position)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.coverSeed, _this.coverSeed) || other.coverSeed == _this.coverSeed));
}


@override
int get hashCode {
  final _this = this as SeriesEntry;
  return Object.hash(runtimeType,_this.position,_this.title,_this.bookId,_this.coverSeed);
}

@override
String toString() {
  final _this = this as SeriesEntry;
  return 'SeriesEntry(position: ${_this.position}, title: ${_this.title}, bookId: ${_this.bookId}, coverSeed: ${_this.coverSeed})';
}


}

/// @nodoc
abstract mixin class $SeriesEntryCopyWith<$Res>  {
  factory $SeriesEntryCopyWith(SeriesEntry value, $Res Function(SeriesEntry) _then) = _$SeriesEntryCopyWithImpl;
@useResult
$Res call({
 int position, String title, String? bookId, int coverSeed
});




}
/// @nodoc
class _$SeriesEntryCopyWithImpl<$Res>
    implements $SeriesEntryCopyWith<$Res> {
  _$SeriesEntryCopyWithImpl(this._self, this._then);

  final SeriesEntry _self;
  final $Res Function(SeriesEntry) _then;

/// Create a copy of SeriesEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? title = null,Object? bookId = freezed,Object? coverSeed = null,}) {
  return _then(SeriesEntry(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesEntry].
extension SeriesEntryPatterns on SeriesEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesEntry value)  $default,){
final _that = this;
switch (_that) {
case _SeriesEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesEntry value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int position,  String title,  String? bookId,  int coverSeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesEntry() when $default != null:
return $default(_that.position,_that.title,_that.bookId,_that.coverSeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int position,  String title,  String? bookId,  int coverSeed)  $default,) {final _that = this;
switch (_that) {
case _SeriesEntry():
return $default(_that.position,_that.title,_that.bookId,_that.coverSeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int position,  String title,  String? bookId,  int coverSeed)?  $default,) {final _that = this;
switch (_that) {
case _SeriesEntry() when $default != null:
return $default(_that.position,_that.title,_that.bookId,_that.coverSeed);case _:
  return null;

}
}

}

/// @nodoc


class _SeriesEntry implements SeriesEntry {
  const _SeriesEntry({required this.position, required this.title, this.bookId, this.coverSeed = 0});
  

@override final  int position;
@override final  String title;
@override final  String? bookId;
@override@JsonKey() final  int coverSeed;

/// Create a copy of SeriesEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesEntryCopyWith<_SeriesEntry> get copyWith => __$SeriesEntryCopyWithImpl<_SeriesEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesEntry&&(identical(other.position, position) || other.position == position)&&(identical(other.title, title) || other.title == title)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.coverSeed, coverSeed) || other.coverSeed == coverSeed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,position,title,bookId,coverSeed);
}

@override
String toString() {
    return 'SeriesEntry(position: $position, title: $title, bookId: $bookId, coverSeed: $coverSeed)';
}


}

/// @nodoc
abstract mixin class _$SeriesEntryCopyWith<$Res> implements $SeriesEntryCopyWith<$Res> {
  factory _$SeriesEntryCopyWith(_SeriesEntry value, $Res Function(_SeriesEntry) _then) = __$SeriesEntryCopyWithImpl;
@override @useResult
$Res call({
 int position, String title, String? bookId, int coverSeed
});




}
/// @nodoc
class __$SeriesEntryCopyWithImpl<$Res>
    implements _$SeriesEntryCopyWith<$Res> {
  __$SeriesEntryCopyWithImpl(this._self, this._then);

  final _SeriesEntry _self;
  final $Res Function(_SeriesEntry) _then;

/// Create a copy of SeriesEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? title = null,Object? bookId = freezed,Object? coverSeed = null,}) {
  return _then(_SeriesEntry(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String?,coverSeed: null == coverSeed ? _self.coverSeed : coverSeed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BookSeries {

 String get id; String get name; List<SeriesEntry> get entries;
/// Create a copy of BookSeries
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookSeriesCopyWith<BookSeries> get copyWith => _$BookSeriesCopyWithImpl<BookSeries>(this as BookSeries, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BookSeries;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookSeries&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}


@override
int get hashCode {
  final _this = this as BookSeries;
  return Object.hash(runtimeType,_this.id,_this.name,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as BookSeries;
  return 'BookSeries(id: ${_this.id}, name: ${_this.name}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $BookSeriesCopyWith<$Res>  {
  factory $BookSeriesCopyWith(BookSeries value, $Res Function(BookSeries) _then) = _$BookSeriesCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<SeriesEntry> entries
});




}
/// @nodoc
class _$BookSeriesCopyWithImpl<$Res>
    implements $BookSeriesCopyWith<$Res> {
  _$BookSeriesCopyWithImpl(this._self, this._then);

  final BookSeries _self;
  final $Res Function(BookSeries) _then;

/// Create a copy of BookSeries
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? entries = null,}) {
  return _then(BookSeries(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<SeriesEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookSeries].
extension BookSeriesPatterns on BookSeries {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookSeries value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookSeries() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookSeries value)  $default,){
final _that = this;
switch (_that) {
case _BookSeries():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookSeries value)?  $default,){
final _that = this;
switch (_that) {
case _BookSeries() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<SeriesEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookSeries() when $default != null:
return $default(_that.id,_that.name,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<SeriesEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _BookSeries():
return $default(_that.id,_that.name,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<SeriesEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _BookSeries() when $default != null:
return $default(_that.id,_that.name,_that.entries);case _:
  return null;

}
}

}

/// @nodoc


class _BookSeries implements BookSeries {
  const _BookSeries({required this.id, required this.name, required  List<SeriesEntry> entries}): _entries = entries;
  

@override final  String id;
@override final  String name;
 final  List<SeriesEntry> _entries;
@override List<SeriesEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of BookSeries
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookSeriesCopyWith<_BookSeries> get copyWith => __$BookSeriesCopyWithImpl<_BookSeries>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookSeries&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.entries, _entries));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'BookSeries(id: $id, name: $name, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$BookSeriesCopyWith<$Res> implements $BookSeriesCopyWith<$Res> {
  factory _$BookSeriesCopyWith(_BookSeries value, $Res Function(_BookSeries) _then) = __$BookSeriesCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<SeriesEntry> entries
});




}
/// @nodoc
class __$BookSeriesCopyWithImpl<$Res>
    implements _$BookSeriesCopyWith<$Res> {
  __$BookSeriesCopyWithImpl(this._self, this._then);

  final _BookSeries _self;
  final $Res Function(_BookSeries) _then;

/// Create a copy of BookSeries
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? entries = null,}) {
  return _then(_BookSeries(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<SeriesEntry>,
  ));
}


}

// dart format on
