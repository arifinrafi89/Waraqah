import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/alerts/domain/entities/app_notification.dart';
import 'package:waraqah/features/alerts/presentation/providers/notification_providers.dart';

import 'helpers/app_harness.dart';

class _NotificationSenderProbe extends ConsumerStatefulWidget {
  const _NotificationSenderProbe();

  @override
  ConsumerState<_NotificationSenderProbe> createState() =>
      _NotificationSenderProbeState();
}

class _NotificationSenderProbeState
    extends ConsumerState<_NotificationSenderProbe> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${ref.watch(unreadNotificationCountProvider)}'),
        ElevatedButton(
          onPressed: () => sendNotification(
            ref,
            const NotificationRequest(
              kind: NotificationKind.newMessage,
              title: 'New message',
              message: 'A reader replied to your listing.',
            ),
          ),
          child: const Text('Send'),
        ),
      ],
    );
  }
}

void main() {
  testWidgets('notification centre shows event types and marks items read', (
    tester,
  ) async {
    await openApp(tester, '/notifications', role: 'reader');

    expect(find.text('Notification centre'), findsOneWidget);
    expect(find.text('Order on its way'), findsOneWidget);
    expect(find.text('Listing approved'), findsOneWidget);
    expect(find.text('New message'), findsOneWidget);

    await tester.tap(find.text('Order on its way'));
    await tester.pump();
    expect(find.text('Mark all read'), findsOneWidget);
  });

  testWidgets('other features can send a notification through the public API', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: _NotificationSenderProbe())),
    );
    await tester.pump();

    expect(find.text('2'), findsOneWidget);
    await tester.tap(find.text('Send'));
    await tester.pump();
    expect(find.text('3'), findsOneWidget);
  });
}
