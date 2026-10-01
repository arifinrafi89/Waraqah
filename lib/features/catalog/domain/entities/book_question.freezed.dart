// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookAnswer {

 String get id; String get text; String get authorName; DateTime get answeredAt; bool get isStaff;
/// Create a copy of BookAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookAnswerCopyWith<BookAnswer> get copyWith => _$BookAnswerCopyWithImpl<BookAnswer>(this as BookAnswer, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BookAnswer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookAnswer&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.authorName, _this.authorName) || other.authorName == _this.authorName)&&(identical(other.answeredAt, _this.answeredAt) || other.answeredAt == _this.answeredAt)&&(identical(other.isStaff, _this.isStaff) || other.isStaff == _this.isStaff));
}


@override
int get hashCode {
  final _this = this as BookAnswer;
  return Object.hash(runtimeType,_this.id,_this.text,_this.authorName,_this.answeredAt,_this.isStaff);
}

@override
String toString() {
  final _this = this as BookAnswer;
  return 'BookAnswer(id: ${_this.id}, text: ${_this.text}, authorName: ${_this.authorName}, answeredAt: ${_this.answeredAt}, isStaff: ${_this.isStaff})';
}


}

/// @nodoc
abstract mixin class $BookAnswerCopyWith<$Res>  {
  factory $BookAnswerCopyWith(BookAnswer value, $Res Function(BookAnswer) _then) = _$BookAnswerCopyWithImpl;
@useResult
$Res call({
 String id, String text, String authorName, DateTime answeredAt, bool isStaff
});




}
/// @nodoc
class _$BookAnswerCopyWithImpl<$Res>
    implements $BookAnswerCopyWith<$Res> {
  _$BookAnswerCopyWithImpl(this._self, this._then);

  final BookAnswer _self;
  final $Res Function(BookAnswer) _then;

/// Create a copy of BookAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? authorName = null,Object? answeredAt = null,Object? isStaff = null,}) {
  return _then(BookAnswer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,answeredAt: null == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,isStaff: null == isStaff ? _self.isStaff : isStaff // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BookAnswer].
extension BookAnswerPatterns on BookAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookAnswer value)  $default,){
final _that = this;
switch (_that) {
case _BookAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _BookAnswer() when $default != null:
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
case _BookAnswer() when $default != null:
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
case _BookAnswer():
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
case _BookAnswer() when $default != null:
return $default(_that.id,_that.text,_that.authorName,_that.answeredAt,_that.isStaff);case _:
  return null;

}
}

}

/// @nodoc


class _BookAnswer implements BookAnswer {
  const _BookAnswer({required this.id, required this.text, required this.authorName, required this.answeredAt, this.isStaff = false});
  

@override final  String id;
@override final  String text;
@override final  String authorName;
@override final  DateTime answeredAt;
@override@JsonKey() final  bool isStaff;

/// Create a copy of BookAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookAnswerCopyWith<_BookAnswer> get copyWith => __$BookAnswerCopyWithImpl<_BookAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookAnswer&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.isStaff, isStaff) || other.isStaff == isStaff));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,text,authorName,answeredAt,isStaff);
}

@override
String toString() {
    return 'BookAnswer(id: $id, text: $text, authorName: $authorName, answeredAt: $answeredAt, isStaff: $isStaff)';
}


}

/// @nodoc
abstract mixin class _$BookAnswerCopyWith<$Res> implements $BookAnswerCopyWith<$Res> {
  factory _$BookAnswerCopyWith(_BookAnswer value, $Res Function(_BookAnswer) _then) = __$BookAnswerCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, String authorName, DateTime answeredAt, bool isStaff
});




}
/// @nodoc
class __$BookAnswerCopyWithImpl<$Res>
    implements _$BookAnswerCopyWith<$Res> {
  __$BookAnswerCopyWithImpl(this._self, this._then);

  final _BookAnswer _self;
  final $Res Function(_BookAnswer) _then;

/// Create a copy of BookAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? authorName = null,Object? answeredAt = null,Object? isStaff = null,}) {
  return _then(_BookAnswer(
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
mixin _$BookQuestion {

 String get id; String get text; String get askerName; DateTime get askedAt; List<BookAnswer> get answers;
/// Create a copy of BookQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookQuestionCopyWith<BookQuestion> get copyWith => _$BookQuestionCopyWithImpl<BookQuestion>(this as BookQuestion, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BookQuestion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookQuestion&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.askerName, _this.askerName) || other.askerName == _this.askerName)&&(identical(other.askedAt, _this.askedAt) || other.askedAt == _this.askedAt)&&const DeepCollectionEquality().equals(other.answers, _this.answers));
}


@override
int get hashCode {
  final _this = this as BookQuestion;
  return Object.hash(runtimeType,_this.id,_this.text,_this.askerName,_this.askedAt,const DeepCollectionEquality().hash(_this.answers));
}

@override
String toString() {
  final _this = this as BookQuestion;
  return 'BookQuestion(id: ${_this.id}, text: ${_this.text}, askerName: ${_this.askerName}, askedAt: ${_this.askedAt}, answers: ${_this.answers})';
}


}

/// @nodoc
abstract mixin class $BookQuestionCopyWith<$Res>  {
  factory $BookQuestionCopyWith(BookQuestion value, $Res Function(BookQuestion) _then) = _$BookQuestionCopyWithImpl;
@useResult
$Res call({
 String id, String text, String askerName, DateTime askedAt, List<BookAnswer> answers
});




}
/// @nodoc
class _$BookQuestionCopyWithImpl<$Res>
    implements $BookQuestionCopyWith<$Res> {
  _$BookQuestionCopyWithImpl(this._self, this._then);

  final BookQuestion _self;
  final $Res Function(BookQuestion) _then;

/// Create a copy of BookQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? askerName = null,Object? askedAt = null,Object? answers = null,}) {
  return _then(BookQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,askerName: null == askerName ? _self.askerName : askerName // ignore: cast_nullable_to_non_nullable
as String,askedAt: null == askedAt ? _self.askedAt : askedAt // ignore: cast_nullable_to_non_nullable
as DateTime,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<BookAnswer>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookQuestion].
extension BookQuestionPatterns on BookQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookQuestion value)  $default,){
final _that = this;
switch (_that) {
case _BookQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _BookQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  String askerName,  DateTime askedAt,  List<BookAnswer> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookQuestion() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  String askerName,  DateTime askedAt,  List<BookAnswer> answers)  $default,) {final _that = this;
switch (_that) {
case _BookQuestion():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  String askerName,  DateTime askedAt,  List<BookAnswer> answers)?  $default,) {final _that = this;
switch (_that) {
case _BookQuestion() when $default != null:
return $default(_that.id,_that.text,_that.askerName,_that.askedAt,_that.answers);case _:
  return null;

}
}

}

/// @nodoc


class _BookQuestion implements BookQuestion {
  const _BookQuestion({required this.id, required this.text, required this.askerName, required this.askedAt,  List<BookAnswer> answers = const <BookAnswer>[]}): _answers = answers;
  

@override final  String id;
@override final  String text;
@override final  String askerName;
@override final  DateTime askedAt;
 final  List<BookAnswer> _answers;
@override@JsonKey() List<BookAnswer> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}


/// Create a copy of BookQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookQuestionCopyWith<_BookQuestion> get copyWith => __$BookQuestionCopyWithImpl<_BookQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.askerName, askerName) || other.askerName == askerName)&&(identical(other.askedAt, askedAt) || other.askedAt == askedAt)&&const DeepCollectionEquality().equals(other.answers, _answers));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,text,askerName,askedAt,const DeepCollectionEquality().hash(_answers));
}

@override
String toString() {
    return 'BookQuestion(id: $id, text: $text, askerName: $askerName, askedAt: $askedAt, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$BookQuestionCopyWith<$Res> implements $BookQuestionCopyWith<$Res> {
  factory _$BookQuestionCopyWith(_BookQuestion value, $Res Function(_BookQuestion) _then) = __$BookQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, String askerName, DateTime askedAt, List<BookAnswer> answers
});




}
/// @nodoc
class __$BookQuestionCopyWithImpl<$Res>
    implements _$BookQuestionCopyWith<$Res> {
  __$BookQuestionCopyWithImpl(this._self, this._then);

  final _BookQuestion _self;
  final $Res Function(_BookQuestion) _then;

/// Create a copy of BookQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? askerName = null,Object? askedAt = null,Object? answers = null,}) {
  return _then(_BookQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,askerName: null == askerName ? _self.askerName : askerName // ignore: cast_nullable_to_non_nullable
as String,askedAt: null == askedAt ? _self.askedAt : askedAt // ignore: cast_nullable_to_non_nullable
as DateTime,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<BookAnswer>,
  ));
}


}

// dart format on
