import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog/data/sources/collection_fixtures.dart';
import 'package:waraqah/features/home/data/sources/home_fake_api.dart';
import 'package:waraqah/features/home/domain/entities/banner.dart';
import 'package:waraqah/features/home/home_routes.dart';
import 'package:waraqah/features/home/presentation/widgets/banner_card.dart';

import 'helpers/app_harness.dart';

bool _exists(Map<String, dynamic> target) {
  final value = target['value'] as String;
  return switch (target['kind']) {
    'collection' => CollectionFixtures.all.any((c) => c.id == value),
    'section' => Section.values.any((s) => s.name == value),
    'book' => BookFixtures.all.any((b) => b.id == value),
    'search' => value.isNotEmpty,
    _ => false,
  };
}

/// Opens Home, swipes to Banner [index] and taps it.
Future<void> _tapBanner(WidgetTester tester, int index, String title) async {
  for (var i = 0; i < index; i++) {
    await tester.fling(find.byType(PageView), const Offset(-300, 0), 1000);
    await settle(tester);
  }
  await tester.tap(
    find.descendant(of: find.byType(BannerCard), matching: find.text(title)),
  );
  await settle(tester);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('/home/banners returns 3 Banners with targets that exist', () async {
    final dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());
    final banners = (await dio.get<List<dynamic>>(HomeFakeApi.banners)).data!;
    expect(banners, hasLength(3));
    for (final b in banners.cast<Map<String, dynamic>>()) {
      expect(
        _exists(b['target'] as Map<String, dynamic>),
        isTrue,
        reason: '$b',
      );
    }
  });

  test('a search target opens Search with that query', () {
    const target = BannerTarget(BannerTargetKind.search, 'sapiens');
    expect(bannerRoute(target), CatalogRoutes.searchFor(query: 'sapiens'));
  });

  for (final (index, title, path) in [
    (0, 'Hadith collections', CatalogRoutes.collectionFor('col-hadith')),
    (1, 'Admission season', CatalogRoutes.sectionFor(Section.admissionJobPrep)),
    (2, 'Sapiens, now in Bangla', CatalogRoutes.bookDetailFor('bk-sapiens')),
  ]) {
    testWidgets('tapping the "$title" Banner opens its page', (tester) async {
      final router = await openApp(tester, HomeRoutes.home);
      expect(find.byType(BannerCard), findsWidgets);

      await _tapBanner(tester, index, title);
      expect(pathOf(router), path);
      await tester.pump(const Duration(seconds: 5));
    });
  }
}
