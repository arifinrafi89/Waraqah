import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../core/settings/settings_controller.dart';
import '../core/settings/settings_store.dart';
import 'app.dart';

/// Does the async start-up work and returns the fully wrapped app.
///
/// Keeping this out of `main.dart` leaves that file to a single `runApp` call,
/// and keeping it out of `app.dart` means the widget tree never awaits.
abstract final class AppBootstrap {
  static Future<Widget> start() async {
    final store = await SettingsStore.open();
    return ProviderScope(
      child: ChangeNotifierProvider(
        create: (_) => SettingsController(store),
        child: const WaraqahApp(),
      ),
    );
  }
}
