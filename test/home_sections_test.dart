import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/home/home_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('Home shows the 8 Sections; a chip opens its Section page', (
    tester,
  ) async {
    final router = await openApp(tester, HomeRoutes.home);
    expect(find.byType(ActionChip), findsNWidgets(Section.values.length));

    await tester.tap(find.widgetWithText(ActionChip, 'Religious'));
    await settle(tester);

    expect(pathOf(router), CatalogRoutes.sectionFor(Section.religious));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Section chips read in Bangla', (tester) async {
    await openApp(tester, HomeRoutes.home, locale: 'bn');
    expect(find.widgetWithText(ActionChip, 'ধর্মীয়'), findsOneWidget);
  });
}
