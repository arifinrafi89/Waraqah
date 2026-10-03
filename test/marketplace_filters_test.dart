import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/network/dio_provider.dart';
import 'package:waraqah/features/p2p/p2p_routes.dart';
import 'package:waraqah/features/p2p/presentation/providers/p2p_filter_providers.dart';
import 'package:waraqah/features/p2p/presentation/providers/p2p_providers.dart';
import 'package:waraqah/features/profile/presentation/providers/address_providers.dart';

import 'helpers/app_harness.dart';
import 'helpers/fake_backend.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  Future<ProviderContainer> loaded() async {
    final container = ProviderContainer(
      overrides: [dioProvider.overrideWithValue(FakeBackend().dio)],
    );
    addTearDown(container.dispose);
    container.listen(filteredP2pListingsProvider, (_, _) {});
    await container.read(p2pListingsProvider.future);
    await container.read(geoProvider.future);
    return container;
  }

  List<String> titles(ProviderContainer c) => [
    for (final l in c.read(filteredP2pListingsProvider)) l.title,
  ];

  test('Listings are filed under catalog Categories and Sections', () async {
    final c = await loaded();
    final listings = c.read(p2pListingsProvider).value!;
    final clean = listings.firstWhere((l) => l.title == 'Clean Code');
    expect(
      (clean.categoryId, clean.section),
      ('cat-programming', Section.skillsTech),
    );
    // The reader's Atomic Habits has no Category of its own: its Book's.
    final mine = listings.firstWhere((l) => l.title == 'Atomic Habits');
    expect(mine.section, isNotNull);
  });

  test('location narrows by division, then district', () async {
    final c = await loaded();
    final all = titles(c).length;
    c.read(p2pFilterDivisionProvider.notifier).select('Chattogram');
    expect(titles(c), ['Introduction to Algorithms']);
    c.read(p2pFilterDivisionProvider.notifier).select('Dhaka');
    c.read(p2pFilterDistrictProvider.notifier).select('Gazipur');
    expect(titles(c), isEmpty);
    c.read(p2pFilterDistrictProvider.notifier).select(null);
    expect(titles(c).length, lessThan(all));
  });

  test('Section, then Category, narrows the list', () async {
    final c = await loaded();
    c.read(p2pFilterSectionProvider.notifier).select(Section.skillsTech);
    expect(titles(c), contains('Clean Code'));
    expect(titles(c), isNot(contains('Digital Logic Design')));
    c.read(p2pFilterCategoryProvider.notifier).select('cat-data-systems');
    expect(titles(c), isNot(contains('Clean Code')));
  });

  test('Sort orders what the filters leave by price', () async {
    final c = await loaded();
    c.read(p2pSortProvider.notifier).select(P2pSort.priceLow);
    final prices = [
      for (final l in c.read(filteredP2pListingsProvider)) l.priceBdt,
    ];
    expect(prices, [...prices]..sort());
    c.read(p2pSortProvider.notifier).select(P2pSort.priceHigh);
    expect(c.read(filteredP2pListingsProvider).first.priceBdt, prices.last);
  });

  testWidgets('the filter bar speaks Bangla and resets with "any"', (
    tester,
  ) async {
    await openApp(tester, P2pRoutes.p2p, role: 'reader', locale: 'bn');
    expect(find.text('এলাকা'), findsOneWidget);

    await tester.tap(find.text('এলাকা'));
    await settle(tester);
    await tester.tap(find.text('চট্টগ্রাম').last);
    await settle(tester);
    // The division is chosen, and its districts get their own menu.
    expect(find.text('জেলা'), findsOneWidget);

    await tester.tap(find.text('চট্টগ্রাম').first);
    await settle(tester);
    await tester.tap(find.text('সারা বাংলাদেশ'));
    await settle(tester);
    expect(find.text('এলাকা'), findsOneWidget);
    expect(find.text('জেলা'), findsNothing);
  });
}
