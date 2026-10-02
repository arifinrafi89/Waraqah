import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/notifications/domain/entities/notification_kind.dart';
import 'package:waraqah/features/readers/readers_routes.dart';

import 'helpers/app_harness.dart';
import 'helpers/fake_backend.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  group('API', () {
    late FakeBackend api;

    setUp(() => api = FakeBackend());

    Future<Map<String, dynamic>?> reader(String id) async =>
        (await api.dio.get<Map<String, dynamic>>(
          '/readers/detail',
          queryParameters: {'id': id},
        )).data;

    Future<Map<String, dynamic>?> follow(String id, bool on) async =>
        (await api.dio.post<Map<String, dynamic>>(
          '/readers/follow',
          data: {'id': id, 'follow': on},
        )).data;

    Future<Set<Object?>> followingAuthors() async => {
      for (final b in (await api.dio.get<List<dynamic>>(
        '/bites',
        queryParameters: {'feed': 'following'},
      )).data!)
        (b as Map)['authorId'],
    };

    test('Following shows only followed authors', () async {
      expect(await followingAuthors(), {'p-tanvir', 'p-nabila', 'p-talha'});
    });

    test('follow updates the counts and the Following feed', () async {
      final before = (await reader('p-arif'))!['followers'] as int;
      final after = await follow('p-arif', true);
      expect(after!['isFollowing'], isTrue);
      expect(after['followers'], before + 1);
      expect(await followingAuthors(), contains('p-arif'));
      await follow('p-arif', false);
      expect(await followingAuthors(), isNot(contains('p-arif')));
    });

    test('follow tells the followed reader', () async {
      await follow('p-rakib', true);
      expect(api.sent('p-rakib', NotificationKind.newFollower), hasLength(1));
    });

    test("you can't follow yourself or a reader you blocked", () async {
      expect(await follow('me', true), isNull);
      api.stores.reports.block('p-sadia');
      expect(await follow('p-sadia', true), isNull);
    });

    test('a private profile sends only the name', () async {
      final rafi = await reader('p-rafi');
      expect(rafi!['profileVisible'], isFalse);
      expect(rafi['area'], '');
      expect(rafi['biteCount'], 0);
      final me = await reader('me');
      expect(me!['isMe'], isTrue);
      expect(me['biteCount'], 2);
    });

    test('comments and replies tell the author, never yourself', () async {
      Future<void> comment(String bite, [String? parent]) => api.post(
        '/bites/comments/post',
        {'biteId': bite, 'text': 'Nice', 'parentId': ?parent},
      );
      await comment('bt-5');
      expect(api.sent('p-arif', NotificationKind.biteComment), hasLength(1));
      await comment('bt-1', 'cm-1');
      expect(api.sent('p-nabila', NotificationKind.commentReply), hasLength(1));
      await comment('bt-me-1');
      expect(api.sent('me', NotificationKind.biteComment), isEmpty);
    });
  });

  testWidgets('follow from the Reader page', (tester) async {
    await openApp(tester, ReadersRoutes.readerFor('p-arif'), role: 'reader');
    expect(find.text('Arif'), findsWidgets);
    expect(find.textContaining('Mirpur'), findsWidgets);
    await tester.tap(find.text('Follow'));
    await settle(tester);
    expect(find.text('Following'), findsOneWidget);
  });

  testWidgets('a private profile hides its details', (tester) async {
    await openApp(tester, ReadersRoutes.readerFor('p-rafi'));
    expect(
      find.text('This reader keeps their profile private.'),
      findsOneWidget,
    );
    expect(find.text('Follow'), findsOneWidget);
    expect(find.text('Bites'), findsNothing);
  });

  testWidgets('a Bite author opens their Reader page', (tester) async {
    final router = await openApp(tester, '/bites', role: 'reader');
    await tester.tap(find.text('Tanvir').first);
    await settle(tester);
    expect(pathOf(router), ReadersRoutes.reader);
    expect(find.text('Following'), findsOneWidget);
    expect(find.byType(FilledButton), findsNothing);
    await settle(tester); // their Bites load after the page
  });
}
