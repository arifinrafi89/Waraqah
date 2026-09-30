import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:waraqah/core/settings/settings_provider.dart';
import 'package:waraqah/features/catalog/presentation/providers/recent_searches_provider.dart';

ProviderContainer _container(SharedPreferences prefs) {
  final container = ProviderContainer(
    overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
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

  test('newest first; a repeat ignoring case moves to the top', () async {
    final c = _container(prefs);
    final n = c.read(recentSearchesProvider.notifier);
    await n.add('sapiens');
    await n.add('matilda');
    await n.add('SAPIENS');
    expect(c.read(recentSearchesProvider), ['SAPIENS', 'matilda']);
  });

  test('blank searches are ignored', () async {
    final c = _container(prefs);
    await c.read(recentSearchesProvider.notifier).add('  ');
    expect(c.read(recentSearchesProvider), isEmpty);
  });

  test('keeps at most 8', () async {
    final c = _container(prefs);
    for (var i = 1; i <= 10; i++) {
      await c.read(recentSearchesProvider.notifier).add('q$i');
    }
    final list = c.read(recentSearchesProvider);
    expect(list.length, 8);
    expect([list.first, list.last], ['q10', 'q3']);
  });

  test('remove one and clear all', () async {
    final c = _container(prefs);
    final n = c.read(recentSearchesProvider.notifier);
    await n.add('a');
    await n.add('b');
    await n.remove('a');
    expect(c.read(recentSearchesProvider), ['b']);
    await n.clear();
    expect(c.read(recentSearchesProvider), isEmpty);
  });

  test('survive a restart', () async {
    await _container(prefs).read(recentSearchesProvider.notifier).add('a');
    expect(_container(prefs).read(recentSearchesProvider), ['a']);
  });
}
