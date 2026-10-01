// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookAnswerModel _$BookAnswerModelFromJson(Map<String, dynamic> json) =>
    _BookAnswerModel(
      id: json['id'] as String,
      text: json['text'] as String,
      authorName: json['authorName'] as String,
      answeredAt: DateTime.parse(json['answeredAt'] as String),
      isStaff: json['isStaff'] as bool? ?? false,
    );

Map<String, dynamic> _$BookAnswerModelToJson(_BookAnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'authorName': instance.authorName,
      'answeredAt': instance.answeredAt.toIso8601String(),
      'isStaff': instance.isStaff,
    };

_BookQuestionModel _$BookQuestionModelFromJson(Map<String, dynamic> json) =>
    _BookQuestionModel(
      id: json['id'] as String,
      text: json['text'] as String,
      askerName: json['askerName'] as String,
      askedAt: DateTime.parse(json['askedAt'] as String),
      answers:
          (json['answers'] as List<dynamic>?)
              ?.map((e) => BookAnswerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BookAnswerModel>[],
    );

Map<String, dynamic> _$BookQuestionModelToJson(_BookQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'askerName': instance.askerName,
      'askedAt': instance.askedAt.toIso8601String(),
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };
