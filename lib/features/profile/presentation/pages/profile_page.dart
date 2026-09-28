import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/settings/settings_controller.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../core/widgets/segmented_selector.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/profile_header.dart';
import '../widgets/settings_group.dart';

/// Screen 5 — Profile. Also the home of the theme and language switchers, both
/// wired to [SettingsController] via the `provider` package.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final settings = context.watch<SettingsController>();
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          ScreenAppBar(title: l10n.profileTitle),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(
                Insets.screen,
                0,
                Insets.screen,
                Sizes.navClearance,
              ),
              children: [
                ProfileHeader(
                  name: 'Farhan Shahriyar',
                  campus: "CSE '22 · Islamic University of Technology",
                  stats: {
                    l10n.profileBooksRead: '14',
                    l10n.profileBitesPosted: '23',
                    l10n.profileListings: '3',
                  },
                ),
                const SizedBox(height: Insets.xl),
                SettingsGroup(
                  label: l10n.profileAppearance,
                  icon: Icons.contrast_rounded,
                  child: SegmentedSelector<ThemeMode>(
                    options: const [
                      ThemeMode.light,
                      ThemeMode.dark,
                      ThemeMode.system,
                    ],
                    labels: [
                      l10n.profileThemeLight,
                      l10n.profileThemeDark,
                      l10n.profileThemeSystem,
                    ],
                    value: settings.themeMode,
                    onChanged: settings.setThemeMode,
                  ),
                ),
                const SizedBox(height: Insets.xl),
                SettingsGroup(
                  label: l10n.profileLanguage,
                  icon: Icons.translate_rounded,
                  child: SegmentedSelector<String>(
                    options: const ['en', 'bn'],
                    labels: [l10n.profileEnglish, l10n.profileBangla],
                    value: Localizations.localeOf(context).languageCode,
                    onChanged: (code) => settings.setLocale(Locale(code)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
