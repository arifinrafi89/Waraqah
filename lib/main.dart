import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final initialThemeState = readPersistedThemeState(prefs);

  runApp(
    ProviderScope(
      overrides: [
        themeControllerProvider.overrideWith(
          () => ThemeController(initialThemeState),
        ),
      ],
      child: const WaraqahApp(),
    ),
  );
}

class WaraqahApp extends ConsumerWidget {
  const WaraqahApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeControllerProvider);
    return MaterialApp.router(
      title: 'Waraqah',
      debugShowCheckedModeBanner: false,
      // One theme at a time: ThemeController resolves the persisted mode to a
      // single family, so darkTheme/themeMode would only fight it.
      theme: AppTheme.themeFor(themeState.activeFamily),
      routerConfig: AppRouter.router,
    );
  }
}
