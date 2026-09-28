import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/settings/settings_provider.dart';
import '../core/theme/app_theme.dart';
import '../l10n/app_localizations.dart';
import 'router/app_router.dart';

/// Root widget: wires theme, locale and the router together.
///
/// Theme mode and locale are read from [settingsProvider], so flipping either
/// in the Profile tab rebuilds the whole app instantly.
class WaraqahApp extends ConsumerStatefulWidget {
  const WaraqahApp({super.key});

  @override
  ConsumerState<WaraqahApp> createState() => _WaraqahAppState();
}

class _WaraqahAppState extends ConsumerState<WaraqahApp> {
  late final GoRouter _router = AppRouter.create(startSignedIn: false);

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    return MaterialApp.router(
      title: 'Waraqah',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      themeMode: settings.themeMode,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      locale: settings.locale,
      supportedLocales: AppL10n.supportedLocales,
      localizationsDelegates: const [
        AppL10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
