import 'package:dio/dio.dart';

import '../../../../core/network/session_tokens.dart';
import '../models/app_user_model.dart';
import 'session_store.dart';

/// The tokens kept with the saved session; [refresh] asks `POST /auth/refresh` for new ones.
class StoredSessionTokens implements SessionTokens {
  StoredSessionTokens(this._store, this._refreshDio, this._expiry);

  final SessionStore _store;

  /// A client without the auth interceptor, so refreshing can never loop.
  final Dio _refreshDio;
  final SessionExpiry _expiry;

  @override
  String? get accessToken => _store.read()?.accessToken;

  @override
  Future<String?> refresh() async {
    final user = _store.read();
    final token = user?.refreshToken;
    if (user == null || token == null) return null;
    try {
      final response = await _refreshDio.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: {'refreshToken': token},
      );
      final data = response.data;
      if (data == null) return null;
      await _store.write(_withTokens(user, data));
      return data['accessToken'] as String?;
    } on DioException catch (e) {
      // Only a refusal ends the session; a dropped connection may work next time.
      if (e.response?.statusCode == 401) {
        await _store.clear();
        _expiry.expire();
      }
      return null;
    }
  }

  AppUserModel _withTokens(AppUserModel user, Map<String, dynamic> data) =>
      user.copyWith(
        accessToken: data['accessToken'] as String?,
        refreshToken: data['refreshToken'] as String?,
        expiresAt: data['expiresAt'] as String?,
      );
}
