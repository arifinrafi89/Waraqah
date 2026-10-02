import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/bites/presentation/providers/quote_providers.dart';
import 'package:waraqah/features/bites/presentation/widgets/quote/quote_share.dart';
import 'package:waraqah/l10n/app_localizations.dart';

/// Rendering a PNG needs real time, so this runs on a plain app: the real
/// one's Google Fonts fail to load in tests once real time passes.
void main() {
  testWidgets('Share renders the card and hands the sharer a PNG', (
    tester,
  ) async {
    final shared = <Uint8List>[];
    final boundary = GlobalKey();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quoteSharerProvider.overrideWithValue((png) async => shared.add(png)),
        ],
        child: MaterialApp(
          localizationsDelegates: AppL10n.localizationsDelegates,
          supportedLocales: AppL10n.supportedLocales,
          home: Consumer(
            builder: (context, ref, _) => Column(
              children: [
                RepaintBoundary(
                  key: boundary,
                  child: const SizedBox.square(
                    dimension: 40,
                    child: ColoredBox(color: Colors.teal),
                  ),
                ),
                TextButton(
                  onPressed: () => shareQuoteCard(context, ref, boundary),
                  child: const Text('share'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('share'));
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 500)),
    );
    expect(shared, hasLength(1));
    // A PNG starts with 0x89 'P' 'N' 'G'.
    expect(shared.single.sublist(0, 4), [0x89, 0x50, 0x4E, 0x47]);
  });
}
