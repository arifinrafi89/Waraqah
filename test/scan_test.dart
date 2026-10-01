import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/p2p/p2p_routes.dart';
import 'package:waraqah/features/scan/domain/entities/isbn.dart';
import 'package:waraqah/features/scan/domain/entities/scanned_book.dart';
import 'package:waraqah/features/scan/domain/repositories/scan_repository.dart';
import 'package:waraqah/features/scan/domain/usecases/look_up_isbn.dart';
import 'package:waraqah/features/scan/scan_routes.dart';

import 'helpers/app_harness.dart';

const _calculus = '9789840001491';

Future<void> _find(WidgetTester tester, String isbn) async {
  await tester.enterText(find.byType(TextField).last, isbn);
  await tester.tap(find.text('Find'));
  await settle(tester);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('ISBNs are checked, and ISBN-10s become ISBN-13s', () {
    expect(Isbn.normalize(_calculus), _calculus);
    expect(Isbn.normalize('978-984-000-149-1'), _calculus);
    expect(Isbn.normalize('9789840001492'), isNull, reason: 'check digit');
    expect(Isbn.normalize('1234567890128'), isNull, reason: 'not a book');
    expect(Isbn.normalize('0-306-40615-2'), '9780306406157');
    expect(Isbn.normalize('080442957x'), '9780804429573');
    expect(Isbn.normalize('hello'), isNull);
  });

  test('looking up something that isn\'t an ISBN fails', () {
    expect(() => LookUpIsbn(_NoBooks()).call('42'), throwsFormatException);
  });

  testWidgets('a typed ISBN finds the book, then sells a copy', (tester) async {
    final router = await openApp(tester, ScanRoutes.scan, role: 'reader');
    expect(find.textContaining('camera isn\'t available'), findsOneWidget);

    await _find(tester, '12345');
    expect(find.textContaining("isn't a valid ISBN"), findsOneWidget);

    await _find(tester, _calculus);
    expect(find.text('Calculus: Early Transcendentals'), findsWidgets);
    expect(find.text('James Stewart'), findsOneWidget);

    await tester.tap(find.text('Sell your copy'));
    await settle(tester);
    expect(pathOf(router), P2pRoutes.addListing);
    expect(find.text('Calculus: Early Transcendentals'), findsOneWidget);
  });

  testWidgets('a book Waraqah lacks can be requested', (tester) async {
    await openApp(tester, ScanRoutes.scan, role: 'reader');
    await _find(tester, '9780306406157');
    expect(find.text("We don't have this book yet"), findsOneWidget);
    expect(find.text('Request this book'), findsOneWidget);
  });

  testWidgets('the add-listing form fills in from the scanner', (tester) async {
    final router = await openApp(tester, P2pRoutes.addListing, role: 'reader');
    await tester.tap(find.text('Scan a book'));
    await settle(tester);
    expect(pathOf(router), ScanRoutes.scan);

    await _find(tester, _calculus);
    await tester.tap(find.text('Sell your copy'));
    await settle(tester);
    expect(pathOf(router), P2pRoutes.addListing);
    expect(find.text('Calculus: Early Transcendentals'), findsOneWidget);
  });
}

class _NoBooks implements ScanRepository {
  @override
  Future<ScannedBook?> lookUp(String isbn) async => null;
}
