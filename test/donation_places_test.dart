import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/admin/admin_routes.dart';
import 'package:waraqah/features/admin/domain/entities/admin_section.dart';
import 'package:waraqah/features/donate/data/sources/donate_admin_fake_api.dart';
import 'package:waraqah/features/donate/data/sources/donate_fake_api.dart';
import 'package:waraqah/features/donate/domain/entities/donate_place_draft.dart';
import 'package:waraqah/features/donate/donate_admin_routes.dart';

import 'helpers/app_harness.dart';
import 'helpers/fake_backend.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  const place = DonatePlaceDraft(
    name: 'Nodi Pathagar',
    district: 'Bogura',
    area: 'Sherpur',
    story: 'A riverside library run by students.',
    needs: [(bookId: 'bk-hobbit', title: '', wanted: 4)],
  );

  test('a place needs a name, a district, a story and a book', () {
    expect(PlaceRules.check(place), isNull);
    expect(PlaceRules.check(place.copyWith(name: 'A')), PlaceProblem.name);
    expect(PlaceRules.check(place.copyWith(needs: [])), PlaceProblem.noNeeds);
  });

  test('Staff add, change and remove places donors see', () async {
    final backend = FakeBackend();
    Future<List<Map>?> post(String path, Map<String, Object?> body) async =>
        (await backend.dio.post<List<dynamic>>(
          path,
          data: body,
        )).data?.cast<Map>();
    Future<List<Map>> places() async =>
        (await backend.dio.get<List<dynamic>>(DonateFakeApi.recipients)).data!
            .cast<Map>();

    final added = (await post(DonateAdminFakeApi.save, {
      'name': place.name,
      'kind': 'library',
      'district': place.district,
      'area': place.area,
      'story': place.story,
      'needs': [
        {'bookId': 'bk-hobbit', 'wanted': 4},
      ],
    }))!;
    final nodi = added.firstWhere((p) => p['name'] == 'Nodi Pathagar');
    expect((await places()).map((p) => p['id']), contains(nodi['id']));

    // Changing Aloghar keeps the copies donors already sent.
    final edited = (await post(DonateAdminFakeApi.save, {
      'id': 'rc-aloghar',
      'name': "Aloghar Children's Library",
      'kind': 'library',
      'district': 'Rangpur',
      'area': 'Pirgachha',
      'story': 'A reading room for village children.',
      'needs': [
        {'bookId': 'bk-hpstone', 'wanted': 20},
      ],
    }))!;
    final need =
        (edited.firstWhere((p) => p['id'] == 'rc-aloghar')['needs'] as List)
                .single
            as Map;
    expect((need['wanted'], need['received']), (20, 4));

    expect(await post(DonateAdminFakeApi.save, {'name': 'X'}), isNull);
    await post(DonateAdminFakeApi.remove, {'id': nodi['id']});
    expect((await places()).map((p) => p['id']), isNot(contains(nodi['id'])));
  });

  testWidgets('support Staff open the places from the Admin area', (
    tester,
  ) async {
    await openApp(tester, AdminRoutes.admin, role: 'support');
    expect(find.text('Donation places'), findsOneWidget);
    await tester.tap(find.text('Donation places'));
    await settle(tester);
    expect(find.text("Aloghar Children's Library"), findsOneWidget);

    await tester.tap(find.text('Add place'));
    await settle(tester);
    await tester.tap(find.text('Save place'));
    await tester.pump();
    expect(
      find.text('Give the place a name (3–80 characters).'),
      findsOneWidget,
    );
  });

  testWidgets('editing a place shows what it has now', (tester) async {
    await openApp(
      tester,
      DonateAdminRoutes.placeFor('rc-aloghar'),
      role: 'superAdmin',
    );
    expect(find.text('Rangpur'), findsOneWidget);
    expect(find.text('Pirgachha'), findsOneWidget);
    expect(find.text('10 copies'), findsOneWidget);
  });

  testWidgets('a catalog manager cannot open them', (tester) async {
    final router = await openApp(
      tester,
      AdminRoutes.section(AdminSection.donations),
      role: 'catalogManager',
    );
    expect(pathOf(router), AdminRoutes.admin);
    expect(find.byType(FloatingActionButton), findsNothing);
  });
}
