import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/settings/settings_provider.dart';
import '../core/theme/app_theme.dart';
import '../l10n/app_localizations.dart';
import 'router/router_provider.dart';

/// Root widget: wires theme, locale and the router together.
///
/// Theme mode and locale are read from [settingsProvider], so flipping either
/// in the Profile tab rebuilds the whole app instantly. The router comes from
/// [routerProvider], which follows the signed-in session.
class WaraqahApp extends ConsumerWidget {
  const WaraqahApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return MaterialApp.router(
      title: 'Waraqah',
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routerProvider),
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
