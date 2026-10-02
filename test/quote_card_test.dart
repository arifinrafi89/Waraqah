import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/bites/bites_routes.dart';
import 'package:waraqah/features/bites/presentation/widgets/quote/quote_card.dart';
import 'package:waraqah/features/bites/presentation/widgets/quote/quote_card_style.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('the quote card renders filled in and switches style', (
    tester,
  ) async {
    await openApp(
      tester,
      BitesRoutes.quoteFor(text: 'Shared stories', bookId: 'bk-sapiens'),
    );
    expect(find.text('Shared stories'), findsWidgets);
    expect(find.textContaining('Yuval Noah Harari'), findsOneWidget);

    await tester.tap(find.text('Ink'));
    await tester.pump();
    final card = tester.widget<QuoteCard>(find.byType(QuoteCard));
    expect(card.style, QuoteCardStyle.ink);

    expect(find.text('Share image'), findsOneWidget);
  });

  testWidgets('a Bite menu opens the quote card filled in', (tester) async {
    final router = await openApp(tester, '/bites', role: 'reader');
    await tester.tap(find.byTooltip('More').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Make a quote card'));
    await settle(tester);
    expect(pathOf(router), BitesRoutes.quote);
    expect(find.textContaining('wheat chapter'), findsWidgets);
  });
}
