import '../../../auth/domain/entities/app_user.dart';
import '../../domain/entities/book_question.dart';
import '../../domain/repositories/book_questions_repository.dart';
import '../models/book_question_model.dart';
import '../sources/book_questions_source.dart';

/// No cache: new questions and answers should show at once.
class BookQuestionsRepositoryImpl implements BookQuestionsRepository {
  BookQuestionsRepositoryImpl(this._source);

  final BookQuestionsSource _source;

  @override
  Future<List<BookQuestion>> questions(String bookId) async =>
      _entities(await _source.questions(bookId));

  @override
  Future<List<BookQuestion>> ask(
    String bookId,
    String text,
    AppUser asker,
  ) async => _entities(await _source.ask(bookId, text, asker));

  @override
  Future<List<BookQuestion>> answer(
    String bookId,
    String questionId,
    String text,
    AppUser author,
  ) async => _entities(await _source.answer(bookId, questionId, text, author));

  List<BookQuestion> _entities(List<BookQuestionModel> models) => [
    for (final model in models) model.toEntity(),
  ];
}
