import '../../../../core/usecase/usecase.dart';
import '../../../auth/domain/entities/app_user.dart';
import '../entities/book_question.dart';
import '../repositories/book_questions_repository.dart';
import 'get_questions.dart';

class PostParams {
  const PostParams({
    required this.bookId,
    required this.text,
    required this.user,
    this.questionId,
  });

  final String bookId;
  final String text;
  final AppUser user;

  /// Set when answering; `null` when asking.
  final String? questionId;
}

/// Asks a question (10–300 characters) or answers one (2–500), trimmed.
/// Throws [PostRejected] when the text doesn't fit.
class PostQuestionOrAnswer extends UseCase<List<BookQuestion>, PostParams> {
  PostQuestionOrAnswer(this._repository);

  final BookQuestionsRepository _repository;

  static const questionLength = (min: 10, max: 300);
  static const answerLength = (min: 2, max: 500);

  @override
  Future<List<BookQuestion>> call(PostParams params) async {
    final text = params.text.trim();
    final questionId = params.questionId;
    final limits = questionId == null ? questionLength : answerLength;
    if (text.length < limits.min) {
      throw const PostRejected(PostProblem.tooShort);
    }
    if (text.length > limits.max) {
      throw const PostRejected(PostProblem.tooLong);
    }
    final updated = questionId == null
        ? await _repository.ask(params.bookId, text, params.user)
        : await _repository.answer(
            params.bookId,
            questionId,
            text,
            params.user,
          );
    return sortQuestions(updated);
  }
}
