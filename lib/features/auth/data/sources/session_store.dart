import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/app_user_model.dart';

/// Remembers the signed-in account between launches.
///
/// Only the account is stored for now. When the Go backend issues tokens,
/// they belong in secure storage, not here.
class SessionStore {
  SessionStore(this._prefs);

  static const _key = 'waraqah.session';

  final SharedPreferences _prefs;

  AppUserModel? read() {
    final raw = _prefs.getString(_key);
    if (raw == null) return null;
    try {
      return AppUserModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      // A corrupt or outdated entry just means "signed out".
      return null;
    }
  }

  Future<void> write(AppUserModel user) =>
      _prefs.setString(_key, jsonEncode(user.toJson()));

  Future<void> clear() => _prefs.remove(_key);
}
