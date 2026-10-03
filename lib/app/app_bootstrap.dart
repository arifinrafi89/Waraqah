import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/api_config.dart';
import '../core/network/auth_interceptor.dart';
import '../core/network/dio_client.dart';
import '../core/network/dio_provider.dart';
import '../core/network/session_tokens.dart';
import '../core/settings/settings_provider.dart';
import '../features/auth/data/sources/session_store.dart';
import '../features/auth/data/sources/stored_session_tokens.dart';
import '../features/auth/presentation/providers/auth_providers.dart';
import 'app.dart';
import 'fake_api_routes.dart';

/// Does the async start-up work and returns the fully wrapped app.
///
/// Keeping this out of `main.dart` leaves that file to a single `runApp` call,
/// and keeping it out of `app.dart` means the widget tree never awaits.
abstract final class AppBootstrap {
  static Future<Widget> start() async {
    final prefs = await SharedPreferences.getInstance();
    final expiry = SessionExpiry();
    return ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        sessionExpiryProvider.overrideWithValue(expiry),
        dioProvider.overrideWithValue(_dio(SessionStore(prefs), expiry)),
      ],
      child: const WaraqahApp(),
    );
  }

  /// With no `API_BASE_URL` the fake API answers every request (as before). With one, requests
  /// go to the backend carrying the signed-in session's token, refreshed once on a 401.
  static Dio _dio(SessionStore store, SessionExpiry expiry) {
    final dio = DioClient.create();
    if (ApiConfig.useFakeApi) {
      return dio..interceptors.add(FakeApiRoutes.interceptor());
    }
    final tokens = StoredSessionTokens(store, DioClient.create(), expiry);
    return dio..interceptors.insert(0, AuthInterceptor(tokens, dio));
  }
}
