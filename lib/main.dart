import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/router/app_router.dart';
import 'core/network/supabase_client.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables (.env)
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // If .env is missing or fails to load, fallback to defaults
  }

  // Initialize Supabase client
  try {
    await SupabaseClientWrapper.initialize();
  } catch (_) {
    // Supabase can fail gracefully during initial local development
  }

  runApp(const ProviderScope(child: WaraqahApp()));
}

class WaraqahApp extends StatelessWidget {
  const WaraqahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Waraqah',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
