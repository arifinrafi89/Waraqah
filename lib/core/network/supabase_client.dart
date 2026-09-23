import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Provider exposing the singleton Supabase client.
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

/// Wrapper around Supabase client initialization and session access.
abstract class SupabaseClientWrapper {
  static Future<void> initialize() async {
    final url = dotenv.get('SUPABASE_URL', fallback: '');
    final anonKey = dotenv.get('SUPABASE_ANON_KEY', fallback: '');

    if (url.isNotEmpty && anonKey.isNotEmpty) {
      await Supabase.initialize(url: url, anonKey: anonKey);
    }
  }

  static SupabaseClient get client => Supabase.instance.client;

  static String? get currentAccessToken =>
      client.auth.currentSession?.accessToken;
}
