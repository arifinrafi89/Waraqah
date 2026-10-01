import '../../../../core/usecase/usecase.dart';
import '../entities/book_question.dart';
import '../repositories/book_questions_repository.dart';

/// A book's questions, newest first; within each, Waraqah's answers first.
class GetQuestions extends UseCase<List<BookQuestion>, String> {
  GetQuestions(this._repository);

  final BookQuestionsRepository _repository;

  @override
  Future<List<BookQuestion>> call(String params) async =>
      sortQuestions(await _repository.questions(params));
}

List<BookQuestion> sortQuestions(List<BookQuestion> questions) => [
  for (final q in [
    ...questions,
  ]..sort((a, b) => b.askedAt.compareTo(a.askedAt)))
    q.copyWith(
      answers: [...q.answers]
        ..sort((a, b) => a.isStaff == b.isStaff ? 0 : (a.isStaff ? -1 : 1)),
    ),
];
