import '../../../auth/domain/entities/app_user.dart';
import '../entities/book_question.dart';

/// Questions and answers about one book. Posting answers the updated list.
abstract interface class BookQuestionsRepository {
  Future<List<BookQuestion>> questions(String bookId);

  Future<List<BookQuestion>> ask(String bookId, String text, AppUser asker);

  Future<List<BookQuestion>> answer(
    String bookId,
    String questionId,
    String text,
    AppUser author,
  );
}
