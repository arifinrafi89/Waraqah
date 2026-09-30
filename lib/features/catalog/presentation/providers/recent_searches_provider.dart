import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/settings/settings_provider.dart';

const _key = 'waraqah.recentSearches';
const _max = 8;

/// The Reader's last searches, newest first, kept on the device (not per
/// account) so they survive restarts for Guests and Readers alike.
class RecentSearchesNotifier extends Notifier<List<String>> {
  @override
  List<String> build() =>
      ref.watch(sharedPreferencesProvider).getStringList(_key) ?? const [];

  /// Saves [query] at the top; a repeat (ignoring case) moves up, not twice.
  Future<void> add(String query) {
    final q = query.trim();
    if (q.isEmpty) return Future.value();
    return _set(
      [
        q,
        ...state.where((s) => s.toLowerCase() != q.toLowerCase()),
      ].take(_max).toList(),
    );
  }

  Future<void> remove(String query) =>
      _set([...state.where((s) => s != query)]);

  Future<void> clear() => _set(const []);

  Future<void> _set(List<String> list) {
    state = list;
    return ref.read(sharedPreferencesProvider).setStringList(_key, list);
  }
}

final recentSearchesProvider =
    NotifierProvider<RecentSearchesNotifier, List<String>>(
      RecentSearchesNotifier.new,
    );
