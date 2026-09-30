import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/features/orders/domain/entities/order_return.dart';
import 'package:waraqah/features/orders/presentation/widgets/return_status_card.dart';
import 'package:waraqah/l10n/app_localizations.dart';

/// A 1×1 transparent PNG.
final _png = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=',
);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('a return shows its photos, and one opens full size', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        localizationsDelegates: AppL10n.localizationsDelegates,
        supportedLocales: AppL10n.supportedLocales,
        home: Scaffold(
          body: ReturnStatusCard(
            request: ReturnRequest(
              reason: ReturnReason.damaged,
              status: ReturnStatus.requested,
              requestedAt: DateTime(2026, 9, 30),
              photos: [_png, _png],
            ),
          ),
        ),
      ),
    );

    expect(find.byType(Image), findsNWidgets(2));
    await tester.tap(find.byType(Image).first);
    await tester.pumpAndSettle();
    expect(find.byType(InteractiveViewer), findsOneWidget);
  });
}
