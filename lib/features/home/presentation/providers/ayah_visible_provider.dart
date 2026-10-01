import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/settings/settings_provider.dart';

const _key = 'waraqah.showAyah';

/// Whether Home shows Ayah of the Day (on by default). Kept on the device,
/// not per account, so Guests can turn it off too.
class AyahVisibleNotifier extends Notifier<bool> {
  @override
  bool build() => ref.watch(sharedPreferencesProvider).getBool(_key) ?? true;

  Future<void> set(bool visible) {
    state = visible;
    return ref.read(sharedPreferencesProvider).setBool(_key, visible);
  }
}

final ayahVisibleProvider = NotifierProvider<AyahVisibleNotifier, bool>(
  AyahVisibleNotifier.new,
);
