import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/settings/settings_controller.dart';
import '../core/theme/app_theme.dart';
import '../l10n/app_localizations.dart';
import 'router/app_router.dart';

/// Root widget: wires theme, locale and the router together.
///
/// Theme mode and locale are read from [SettingsController] through the
/// `provider` package, so flipping either in the Profile tab rebuilds the whole
/// app instantly.
class WaraqahApp extends StatefulWidget {
  const WaraqahApp({super.key});

  @override
  State<WaraqahApp> createState() => _WaraqahAppState();
}

class _WaraqahAppState extends State<WaraqahApp> {
  late final GoRouter _router = AppRouter.create(startSignedIn: false);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
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
