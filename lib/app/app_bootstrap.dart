import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/dio_client.dart';
import '../core/network/dio_provider.dart';
import '../core/settings/settings_provider.dart';
import 'app.dart';
import 'fake_api_routes.dart';

/// Does the async start-up work and returns the fully wrapped app.
///
/// Keeping this out of `main.dart` leaves that file to a single `runApp` call,
/// and keeping it out of `app.dart` means the widget tree never awaits.
abstract final class AppBootstrap {
  static Future<Widget> start() async {
    final prefs = await SharedPreferences.getInstance();
    return ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        dioProvider.overrideWithValue(
          DioClient.create()..interceptors.add(FakeApiRoutes.interceptor()),
        ),
      ],
      child: const WaraqahApp(),
    );
  }
}
