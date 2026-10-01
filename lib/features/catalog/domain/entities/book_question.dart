import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_question.freezed.dart';

/// An answer to a reader's question. Staff answers carry a Waraqah badge.
@freezed
abstract class BookAnswer with _$BookAnswer {
  const factory BookAnswer({
    required String id,
    required String text,
    required String authorName,
    required DateTime answeredAt,
    @Default(false) bool isStaff,
  }) = _BookAnswer;
}

/// A question a reader asked about a book, with its answers.
@freezed
abstract class BookQuestion with _$BookQuestion {
  const factory BookQuestion({
    required String id,
    required String text,
    required String askerName,
    required DateTime askedAt,
    @Default(<BookAnswer>[]) List<BookAnswer> answers,
  }) = _BookQuestion;
}

/// What's wrong with a question or answer before it's posted.
enum PostProblem { tooShort, tooLong }

class PostRejected implements Exception {
  const PostRejected(this.problem);

  final PostProblem problem;
}
