import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/auth/auth_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/domain/entities/book_question.dart';
import 'package:waraqah/features/catalog/domain/usecases/get_questions.dart';

import 'helpers/app_harness.dart';

final _atomic = CatalogRoutes.bookDetailFor('bk-atomic');

Future<void> _scrollTo(WidgetTester tester, Finder finder) async {
  await tester.scrollUntilVisible(
    finder,
    250,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.ensureVisible(finder);
  await settle(tester);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('newest questions first, Waraqah answers first', () {
    final day = DateTime(2026, 9, 1);
    BookAnswer answer(String id, {bool staff = false}) => BookAnswer(
      id: id,
      text: id,
      authorName: id,
      answeredAt: day,
      isStaff: staff,
    );
    final sorted = sortQuestions([
      BookQuestion(id: 'old', text: '', askerName: '', askedAt: day),
      BookQuestion(
        id: 'new',
        text: '',
        askerName: '',
        askedAt: day.add(const Duration(days: 1)),
        answers: [answer('reader'), answer('staff', staff: true)],
      ),
    ]);
    expect([for (final q in sorted) q.id], ['new', 'old']);
    expect(sorted.first.answers.first.id, 'staff');
  });

  testWidgets('the book page shows questions, with Waraqah marked', (
    tester,
  ) async {
    await openApp(tester, _atomic);
    await _scrollTo(tester, find.text('Questions & answers'));

    expect(find.text('2 questions'), findsOneWidget);
    expect(find.text('Waraqah'), findsOneWidget);
  });

  testWidgets('guests are sent to log in to ask', (tester) async {
    final router = await openApp(tester, _atomic);
    await _scrollTo(tester, find.text('Ask a question'));
    await tester.tap(find.text('Ask a question'));
    await settle(tester);
    expect(pathOf(router), AuthRoutes.login);
  });

  testWidgets('a reader asks, and too short is turned down', (tester) async {
    await openApp(tester, _atomic, role: 'reader');
    await _scrollTo(tester, find.text('Ask a question'));
    await tester.tap(find.text('Ask a question'));
    await settle(tester);

    await tester.enterText(find.byType(TextField), 'Why?');
    await tester.tap(find.text('Post'));
    await settle(tester);
    expect(
      find.text("That's a bit short. Add a few more words."),
      findsOneWidget,
    );

    await tester.enterText(
      find.byType(TextField),
      'Is there an audiobook too?',
    );
    await tester.tap(find.text('Post'));
    await settle(tester);
    expect(find.textContaining('Question posted'), findsOneWidget);
    // The list reloads; scroll back up to the Questions section.
    await tester.scrollUntilVisible(
      find.text('Is there an audiobook too?'),
      -250,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Is there an audiobook too?'), findsOneWidget);
    expect(find.text('3 questions'), findsOneWidget);
  });

  testWidgets('a reader answers on the questions page', (tester) async {
    await openApp(
      tester,
      CatalogRoutes.questionsFor('bk-calculus'),
      role: 'reader',
    );
    expect(find.text('No answer yet'), findsOneWidget);

    await tester.tap(find.text('Answer'));
    await settle(tester);
    await tester.enterText(find.byType(TextField), 'Yes, it comes in the box.');
    await tester.tap(find.text('Post'));
    await settle(tester);

    expect(find.text('Answer posted'), findsOneWidget);
    expect(find.text('Yes, it comes in the box.'), findsOneWidget);
    expect(find.text('No answer yet'), findsNothing);
  });
}
