// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookAnswerModel {

 String get id; String get text; String get authorName; DateTime get answeredAt; bool get isStaff;
/// Create a copy of BookAnswerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookAnswerModelCopyWith<BookAnswerModel> get copyWith => _$BookAnswerModelCopyWithImpl<BookAnswerModel>(this as BookAnswerModel, _$identity);

  /// Serializes this BookAnswerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookAnswerModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookAnswerModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.authorName, _this.authorName) || other.authorName == _this.authorName)&&(identical(other.answeredAt, _this.answeredAt) || other.answeredAt == _this.answeredAt)&&(identical(other.isStaff, _this.isStaff) || other.isStaff == _this.isStaff));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookAnswerModel;
  return Object.hash(runtimeType,_this.id,_this.text,_this.authorName,_this.answeredAt,_this.isStaff);
}

@override
String toString() {
  final _this = this as BookAnswerModel;
  return 'BookAnswerModel(id: ${_this.id}, text: ${_this.text}, authorName: ${_this.authorName}, answeredAt: ${_this.answeredAt}, isStaff: ${_this.isStaff})';
}


}

/// @nodoc
abstract mixin class $BookAnswerModelCopyWith<$Res>  {
  factory $BookAnswerModelCopyWith(BookAnswerModel value, $Res Function(BookAnswerModel) _then) = _$BookAnswerModelCopyWithImpl;
@useResult
$Res call({
 String id, String text, String authorName, DateTime answeredAt, bool isStaff
});




}
/// @nodoc
class _$BookAnswerModelCopyWithImpl<$Res>
    implements $BookAnswerModelCopyWith<$Res> {
  _$BookAnswerModelCopyWithImpl(this._self, this._then);

  final BookAnswerModel _self;
  final $Res Function(BookAnswerModel) _then;

/// Create a copy of BookAnswerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? authorName = null,Object? answeredAt = null,Object? isStaff = null,}) {
  return _then(BookAnswerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,answeredAt: null == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,isStaff: null == isStaff ? _self.isStaff : isStaff // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BookAnswerModel].
extension BookAnswerModelPatterns on BookAnswerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookAnswerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookAnswerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookAnswerModel value)  $default,){
final _that = this;
switch (_that) {
case _BookAnswerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookAnswerModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookAnswerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  String authorName,  DateTime answeredAt,  bool isStaff)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookAnswerModel() when $default != null:
return $default(_that.id,_that.text,_that.authorName,_that.answeredAt,_that.isStaff);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  String authorName,  DateTime answeredAt,  bool isStaff)  $default,) {final _that = this;
switch (_that) {
case _BookAnswerModel():
return $default(_that.id,_that.text,_that.authorName,_that.answeredAt,_that.isStaff);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  String authorName,  DateTime answeredAt,  bool isStaff)?  $default,) {final _that = this;
switch (_that) {
case _BookAnswerModel() when $default != null:
return $default(_that.id,_that.text,_that.authorName,_that.answeredAt,_that.isStaff);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookAnswerModel implements BookAnswerModel {
  const _BookAnswerModel({required this.id, required this.text, required this.authorName, required this.answeredAt, this.isStaff = false});
  factory _BookAnswerModel.fromJson(Map<String, dynamic> json) => _$BookAnswerModelFromJson(json);

@override final  String id;
@override final  String text;
@override final  String authorName;
@override final  DateTime answeredAt;
@override@JsonKey() final  bool isStaff;

/// Create a copy of BookAnswerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookAnswerModelCopyWith<_BookAnswerModel> get copyWith => __$BookAnswerModelCopyWithImpl<_BookAnswerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookAnswerModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookAnswerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.isStaff, isStaff) || other.isStaff == isStaff));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,text,authorName,answeredAt,isStaff);
}

@override
String toString() {
    return 'BookAnswerModel(id: $id, text: $text, authorName: $authorName, answeredAt: $answeredAt, isStaff: $isStaff)';
}


}

/// @nodoc
abstract mixin class _$BookAnswerModelCopyWith<$Res> implements $BookAnswerModelCopyWith<$Res> {
  factory _$BookAnswerModelCopyWith(_BookAnswerModel value, $Res Function(_BookAnswerModel) _then) = __$BookAnswerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, String authorName, DateTime answeredAt, bool isStaff
});




}
/// @nodoc
class __$BookAnswerModelCopyWithImpl<$Res>
    implements _$BookAnswerModelCopyWith<$Res> {
  __$BookAnswerModelCopyWithImpl(this._self, this._then);

  final _BookAnswerModel _self;
  final $Res Function(_BookAnswerModel) _then;

/// Create a copy of BookAnswerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? authorName = null,Object? answeredAt = null,Object? isStaff = null,}) {
  return _then(_BookAnswerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,answeredAt: null == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,isStaff: null == isStaff ? _self.isStaff : isStaff // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BookQuestionModel {

 String get id; String get text; String get askerName; DateTime get askedAt; List<BookAnswerModel> get answers;
/// Create a copy of BookQuestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookQuestionModelCopyWith<BookQuestionModel> get copyWith => _$BookQuestionModelCopyWithImpl<BookQuestionModel>(this as BookQuestionModel, _$identity);

  /// Serializes this BookQuestionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookQuestionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookQuestionModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.askerName, _this.askerName) || other.askerName == _this.askerName)&&(identical(other.askedAt, _this.askedAt) || other.askedAt == _this.askedAt)&&const DeepCollectionEquality().equals(other.answers, _this.answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookQuestionModel;
  return Object.hash(runtimeType,_this.id,_this.text,_this.askerName,_this.askedAt,const DeepCollectionEquality().hash(_this.answers));
}

@override
String toString() {
  final _this = this as BookQuestionModel;
  return 'BookQuestionModel(id: ${_this.id}, text: ${_this.text}, askerName: ${_this.askerName}, askedAt: ${_this.askedAt}, answers: ${_this.answers})';
}


}

/// @nodoc
abstract mixin class $BookQuestionModelCopyWith<$Res>  {
  factory $BookQuestionModelCopyWith(BookQuestionModel value, $Res Function(BookQuestionModel) _then) = _$BookQuestionModelCopyWithImpl;
@useResult
$Res call({
 String id, String text, String askerName, DateTime askedAt, List<BookAnswerModel> answers
});




}
/// @nodoc
class _$BookQuestionModelCopyWithImpl<$Res>
    implements $BookQuestionModelCopyWith<$Res> {
  _$BookQuestionModelCopyWithImpl(this._self, this._then);

  final BookQuestionModel _self;
  final $Res Function(BookQuestionModel) _then;

/// Create a copy of BookQuestionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? askerName = null,Object? askedAt = null,Object? answers = null,}) {
  return _then(BookQuestionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,askerName: null == askerName ? _self.askerName : askerName // ignore: cast_nullable_to_non_nullable
as String,askedAt: null == askedAt ? _self.askedAt : askedAt // ignore: cast_nullable_to_non_nullable
as DateTime,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<BookAnswerModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookQuestionModel].
extension BookQuestionModelPatterns on BookQuestionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookQuestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookQuestionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookQuestionModel value)  $default,){
final _that = this;
switch (_that) {
case _BookQuestionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookQuestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookQuestionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  String askerName,  DateTime askedAt,  List<BookAnswerModel> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookQuestionModel() when $default != null:
return $default(_that.id,_that.text,_that.askerName,_that.askedAt,_that.answers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  String askerName,  DateTime askedAt,  List<BookAnswerModel> answers)  $default,) {final _that = this;
switch (_that) {
case _BookQuestionModel():
return $default(_that.id,_that.text,_that.askerName,_that.askedAt,_that.answers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  String askerName,  DateTime askedAt,  List<BookAnswerModel> answers)?  $default,) {final _that = this;
switch (_that) {
case _BookQuestionModel() when $default != null:
return $default(_that.id,_that.text,_that.askerName,_that.askedAt,_that.answers);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BookQuestionModel implements BookQuestionModel {
  const _BookQuestionModel({required this.id, required this.text, required this.askerName, required this.askedAt,  List<BookAnswerModel> answers = const <BookAnswerModel>[]}): _answers = answers;
  factory _BookQuestionModel.fromJson(Map<String, dynamic> json) => _$BookQuestionModelFromJson(json);

@override final  String id;
@override final  String text;
@override final  String askerName;
@override final  DateTime askedAt;
 final  List<BookAnswerModel> _answers;
@override@JsonKey() List<BookAnswerModel> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}


/// Create a copy of BookQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookQuestionModelCopyWith<_BookQuestionModel> get copyWith => __$BookQuestionModelCopyWithImpl<_BookQuestionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookQuestionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookQuestionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.askerName, askerName) || other.askerName == askerName)&&(identical(other.askedAt, askedAt) || other.askedAt == askedAt)&&const DeepCollectionEquality().equals(other.answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,text,askerName,askedAt,const DeepCollectionEquality().hash(_answers));
}

@override
String toString() {
    return 'BookQuestionModel(id: $id, text: $text, askerName: $askerName, askedAt: $askedAt, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$BookQuestionModelCopyWith<$Res> implements $BookQuestionModelCopyWith<$Res> {
  factory _$BookQuestionModelCopyWith(_BookQuestionModel value, $Res Function(_BookQuestionModel) _then) = __$BookQuestionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, String askerName, DateTime askedAt, List<BookAnswerModel> answers
});




}
/// @nodoc
class __$BookQuestionModelCopyWithImpl<$Res>
    implements _$BookQuestionModelCopyWith<$Res> {
  __$BookQuestionModelCopyWithImpl(this._self, this._then);

  final _BookQuestionModel _self;
  final $Res Function(_BookQuestionModel) _then;

/// Create a copy of BookQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? askerName = null,Object? askedAt = null,Object? answers = null,}) {
  return _then(_BookQuestionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,askerName: null == askerName ? _self.askerName : askerName // ignore: cast_nullable_to_non_nullable
as String,askedAt: null == askedAt ? _self.askedAt : askedAt // ignore: cast_nullable_to_non_nullable
as DateTime,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<BookAnswerModel>,
  ));
}


}

// dart format on
