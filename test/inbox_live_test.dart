import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/inbox/data/sources/inbox_live_source.dart';
import 'package:waraqah/features/inbox/data/sources/inbox_remote_source.dart';

void main() {
  test('the live connection streams a change for each message', () async {
    final dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());
    final remote = InboxRemoteSource(dio);
    final changes = InboxLiveSource(dio).changes();
    final first = changes.first;
    // Give the live connection time to open before changing anything.
    await Future<void>.delayed(const Duration(seconds: 1));

    final thread = await remote.send('th-nabila', 'See you on Saturday!');
    final change = await first.timeout(const Duration(seconds: 3));

    expect(change.threadId, 'th-nabila');
    expect(change.listingId, 'p2p-4');
    expect(thread.messages.last.text, 'See you on Saturday!');
  });
}
