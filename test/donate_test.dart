import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/auth/auth_routes.dart';
import 'package:waraqah/features/donate/donate_routes.dart';

import 'helpers/app_harness.dart';

final _aloghar = DonateRoutes.recipientFor('rc-aloghar');
const _name = "Aloghar Children's Library";

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('the Donate page lists verified places', (tester) async {
    await openApp(tester, DonateRoutes.donate);

    expect(tester.takeException(), isNull);
    expect(find.text(_name), findsOneWidget);
    expect(find.text('Verified'), findsWidgets);
    // Harry Potter 4 of 10, The Hobbit 1 of 6, Sherlock 5 of 5.
    expect(find.text('10 of 21 books received'), findsOneWidget);
  });

  testWidgets('a reader donates two copies and can track them', (tester) async {
    await openApp(tester, _aloghar, role: 'reader');
    expect(find.text('4 of 10 received'), findsOneWidget);
    expect(find.text('All donated'), findsOneWidget, reason: 'Sherlock');

    await tester.tap(find.widgetWithText(FilledButton, 'Donate').first);
    await settle(tester);
    await tester.tap(find.byTooltip('One more'));
    await tester.tap(find.text('Nagad'));
    await tester.enterText(find.byType(TextField), 'Happy reading!');
    await tester.pump();
    await tester.tap(find.textContaining('Donate ৳'));
    await settle(tester);

    expect(
      find.text('Thank you! Your books are on their way to $_name.'),
      findsOneWidget,
    );
    expect(find.text('6 of 10 received'), findsOneWidget);

    await tester.tap(find.text('Track order'));
    await settle(tester);
    await tester.scrollUntilVisible(find.text('Donation to $_name'), 200);
    expect(find.text('“Happy reading!”'), findsOneWidget);
  });

  testWidgets('guests log in before donating', (tester) async {
    final router = await openApp(tester, _aloghar);
    await tester.tap(find.widgetWithText(FilledButton, 'Donate').first);
    await settle(tester);
    expect(pathOf(router), AuthRoutes.login);
  });

  testWidgets('an unknown place says so', (tester) async {
    await openApp(tester, DonateRoutes.recipientFor('rc-nowhere'));
    expect(find.text("We couldn't find this place."), findsOneWidget);
  });
}
