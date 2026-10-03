import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:waraqah/app/app.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/app/router/router_provider.dart';
import 'package:waraqah/core/network/dio_provider.dart';
import 'package:waraqah/core/settings/settings_provider.dart';

/// The real app at phone size, signed in as [role] (a guest when `null`),
/// opened straight at [location], with [prefs] already saved on the device
/// and any provider [overrides].
/// Returns the app's router.
Future<GoRouter> openApp(
  WidgetTester tester,
  String location, {
  String? role,
  String? locale,
  Map<String, Object> prefs = const {},
  List<Override> overrides = const [],
}) async {
  tester.view.physicalSize = const Size(375, 812);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  SharedPreferences.setMockInitialValues({
    ...prefs,
    'waraqah.localeCode': ?locale,
    if (role != null)
      'waraqah.session': jsonEncode({
        'id': 'u1',
        'name': 'Test',
        'email': 't@waraqah.test',
        'role': role,
      }),
  });
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
      dioProvider.overrideWithValue(
        Dio()..interceptors.add(FakeApiRoutes.interceptor()),
      ),
      ...overrides,
    ],
  );
  addTearDown(container.dispose);
  final router = container.read(routerProvider)..go(location);

  await tester.pumpWidget(const SizedBox());
  await tester.pumpWidget(
    UncontrolledProviderScope(container: container, child: const WaraqahApp()),
  );
  await settle(tester);
  return router;
}

/// Lets page transitions finish and fake API calls (~900 ms) resolve, without
/// waiting on endless shimmer animations.
Future<void> settle(WidgetTester tester) async {
  for (var i = 0; i < 4; i++) {
    await tester.pump(const Duration(milliseconds: 500));
  }
}

/// The page on top, including pushed ones.
String pathOf(GoRouter router) => router.state.uri.path;
