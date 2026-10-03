import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/p2p/p2p_routes.dart';
import 'package:waraqah/features/p2p/presentation/providers/listing_photo_picker.dart';

import 'helpers/app_harness.dart';

/// A 1×1 PNG, so picked photos render.
final Uint8List _png = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=',
);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('a reader lists a book with photos and sees it in review', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      P2pRoutes.myListings,
      role: 'reader',
      overrides: [
        listingPhotoPickerProvider.overrideWithValue(() async => _png),
      ],
    );
    unawaited(router.push(P2pRoutes.addListing));
    await settle(tester);

    await tester.enterText(
      find.byType(TextFormField).first,
      'Structure and Interpretation',
    );
    await tester.tap(find.text('Next').hitTestable());
    await settle(tester);
    await tester.tap(find.text('Next').hitTestable());
    await settle(tester);

    for (final slot in ['Front cover', 'Back cover']) {
      await tester.tap(find.text(slot));
      await settle(tester);
    }
    expect(find.byType(Image), findsNWidgets(2));
    await tester.tap(find.text('Next').hitTestable());
    await settle(tester);

    // No price yet: the form says so instead of sending.
    await tester.tap(find.text('Send for review').hitTestable());
    await settle(tester);
    expect(find.text('Set your price.'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).last, '450');
    await tester.tap(find.text('Send for review').hitTestable());
    await settle(tester);

    expect(pathOf(router), P2pRoutes.myListings);
    expect(find.text('Structure and Interpretation'), findsOneWidget);
    expect(find.text('In review'), findsWidgets);
  });

  testWidgets('a Listing sent back opens in the form to fix', (tester) async {
    final router = await openApp(tester, P2pRoutes.myListings, role: 'reader');
    await tester.dragUntilVisible(
      find.text('Edit and send again'),
      find.byType(ListView),
      const Offset(0, -200),
    );
    await tester.ensureVisible(find.text('Edit and send again'));
    await settle(tester);
    await tester.tap(find.text('Edit and send again'));
    await settle(tester);

    expect(pathOf(router), P2pRoutes.addListing);
    expect(find.text('Edit listing'), findsOneWidget);
    expect(find.text('Head First Java'), findsOneWidget);
  });

  testWidgets('guests log in before selling', (tester) async {
    final router = await openApp(tester, P2pRoutes.addListing);
    expect(pathOf(router), isNot(P2pRoutes.addListing));
  });
}
