import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/settings/settings_controller.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../core/widgets/waraqah_wordmark.dart';

/// Home's top bar: the wordmark, plus quick theme and language toggles and the
/// cart. The two toggles read and write [SettingsController] through `provider`.
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    return ScreenAppBar(
      leading: const WaraqahWordmark(),
      actions: [
        AppIconButton(
          icon: isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          tooltip: isDark ? 'Light mode' : 'Dark mode',
          onPressed: () => settings.setThemeMode(
            isDark ? ThemeMode.light : ThemeMode.dark,
          ),
        ),
        const SizedBox(width: 8),
        AppIconButton(
          icon: Icons.translate_rounded,
          tooltip: isBangla ? 'English' : 'বাংলা',
          onPressed: () =>
              settings.setLocale(Locale(isBangla ? 'en' : 'bn')),
        ),
        const SizedBox(width: 8),
        AppIconButton(
          icon: Icons.shopping_bag_outlined,
          badgeCount: 2,
          onPressed: () {},
        ),
      ],
    );
  }
}
