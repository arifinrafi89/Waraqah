import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/inbox/data/sources/inbox_fake_api.dart';
import 'package:waraqah/features/inbox/inbox_routes.dart';
import 'package:waraqah/features/report/data/sources/report_fake_api.dart';

import 'helpers/app_harness.dart';
import 'helpers/fake_backend.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('no messages, chats or deals with a blocked reader', () async {
    final backend = FakeBackend();
    Future<Object?> post(String path, Map<String, Object?> body) async =>
        (await backend.dio.post<Object?>(path, data: body)).data;

    await backend.post(ReportFakeApi.block, {'readerId': 'p-sadia'});
    expect(
      await post(InboxFakeApi.send, {'threadId': 'th-sadia', 'text': 'Hi'}),
      isNull,
    );
    // Rafi isn't blocked: still fine.
    expect(
      await post(InboxFakeApi.send, {'threadId': 'th-rafi', 'text': 'Hi'}),
      isNotNull,
    );

    await backend.post(ReportFakeApi.block, {'readerId': 'p-tanvir'});
    expect(await post(InboxFakeApi.open, {'listingId': 'p2p-1'}), isNull);
  });

  testWidgets('blocking from a thread swaps the message box for a note', (
    tester,
  ) async {
    await openApp(tester, InboxRoutes.threadFor('th-sadia'), role: 'reader');
    expect(find.byType(TextField), findsOneWidget);

    await tester.tap(find.byTooltip('More options'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Block Sadia'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Block'));
    await settle(tester);

    expect(find.textContaining('Unblock to message'), findsOneWidget);
    expect(find.byType(TextField), findsNothing);
  });
}
