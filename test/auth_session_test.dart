import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/core/network/dio_provider.dart';
import 'package:waraqah/core/settings/settings_provider.dart';
import 'package:waraqah/features/auth/domain/entities/user_role.dart';
import 'package:waraqah/features/auth/presentation/providers/auth_providers.dart';

/// A fresh app state on top of [prefs], using the same fake API as the app.
ProviderContainer _container(SharedPreferences prefs) {
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
      dioProvider.overrideWithValue(
        Dio()..interceptors.add(FakeApiRoutes.interceptor()),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  late SharedPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  });

  test('starts as a guest', () {
    expect(_container(prefs).read(sessionProvider), isNull);
  });

  test('a demo staff email signs in with its role', () async {
    final container = _container(prefs);
    await container
        .read(sessionProvider.notifier)
        .signIn(email: ' Admin@Waraqah.test ', password: 'x');

    final user = container.read(sessionProvider)!;
    expect(user.email, 'admin@waraqah.test');
    expect(user.role, UserRole.superAdmin);
    expect(container.read(isStaffProvider), isTrue);
  });

  test('any other email signs in as a reader', () async {
    final container = _container(prefs);
    await container
        .read(sessionProvider.notifier)
        .signIn(email: 'nadia@example.com', password: 'x');

    expect(container.read(sessionProvider)!.role, UserRole.reader);
    expect(container.read(isStaffProvider), isFalse);
  });

  test('the session survives a restart and ends on sign-out', () async {
    await _container(prefs)
        .read(sessionProvider.notifier)
        .signIn(email: 'moderator@waraqah.test', password: 'x');

    final restarted = _container(prefs);
    expect(restarted.read(sessionProvider)!.role, UserRole.moderator);

    await restarted.read(sessionProvider.notifier).signOut();
    expect(restarted.read(sessionProvider), isNull);
    expect(_container(prefs).read(sessionProvider), isNull);
  });

  test('a corrupt saved session counts as signed out', () {
    SharedPreferences.setMockInitialValues({'waraqah.session': 'not json'});
    return SharedPreferences.getInstance().then(
      (corrupt) => expect(_container(corrupt).read(sessionProvider), isNull),
    );
  });
}
