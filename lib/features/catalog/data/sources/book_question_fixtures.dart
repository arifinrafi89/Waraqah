import '../models/book_question_model.dart';

/// Starting questions for the fake API, dated relative to [now] so they
/// always look recent.
abstract final class BookQuestionFixtures {
  static Map<String, List<BookQuestionModel>> seed(DateTime now) {
    DateTime ago(int days) => now.subtract(Duration(days: days));
    return {
      'bk-atomic': [
        BookQuestionModel(
          id: 'q-atomic-1',
          text: 'Is the Bangla translation as easy to read as the English one?',
          askerName: 'Sadia',
          askedAt: ago(12),
          answers: [
            BookAnswerModel(
              id: 'a-atomic-1',
              text:
                  'We only stock the English edition for now. A Bangla '
                  'edition is on our request list.',
              authorName: 'Waraqah',
              answeredAt: ago(11),
              isStaff: true,
            ),
          ],
        ),
        BookQuestionModel(
          id: 'q-atomic-2',
          text: 'Is the hardcover worth it over the paperback for gifting?',
          askerName: 'Imran',
          askedAt: ago(4),
          answers: [
            BookAnswerModel(
              id: 'a-atomic-2',
              text:
                  'I gave the hardcover as an Eid gift. It feels much '
                  'sturdier and the paper is thicker.',
              authorName: 'Nusrat',
              answeredAt: ago(3),
            ),
          ],
        ),
      ],
      'bk-calculus': [
        BookQuestionModel(
          id: 'q-calculus-1',
          text: 'Does this edition include the solutions manual?',
          askerName: 'Tanvir',
          askedAt: ago(20),
        ),
      ],
    };
  }
}
