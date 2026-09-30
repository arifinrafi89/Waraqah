import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/book_question.dart';

part 'book_question_model.freezed.dart';
part 'book_question_model.g.dart';

@freezed
abstract class BookAnswerModel with _$BookAnswerModel {
  const factory BookAnswerModel({
    required String id,
    required String text,
    required String authorName,
    required DateTime answeredAt,
    @Default(false) bool isStaff,
  }) = _BookAnswerModel;

  factory BookAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$BookAnswerModelFromJson(json);
}

@freezed
abstract class BookQuestionModel with _$BookQuestionModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory BookQuestionModel({
    required String id,
    required String text,
    required String askerName,
    required DateTime askedAt,
    @Default(<BookAnswerModel>[]) List<BookAnswerModel> answers,
  }) = _BookQuestionModel;

  factory BookQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$BookQuestionModelFromJson(json);
}

extension BookQuestionModelX on BookQuestionModel {
  BookQuestion toEntity() => BookQuestion(
    id: id,
    text: text,
    askerName: askerName,
    askedAt: askedAt,
    answers: [
      for (final a in answers)
        BookAnswer(
          id: a.id,
          text: a.text,
          authorName: a.authorName,
          answeredAt: a.answeredAt,
          isStaff: a.isStaff,
        ),
    ],
  );
}
