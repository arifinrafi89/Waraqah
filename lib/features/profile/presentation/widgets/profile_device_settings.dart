import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/settings/settings_provider.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/segmented_selector.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/presentation/widgets/ayah_switch_tile.dart';
import 'settings_group.dart';

/// Settings kept on the device, for Guests too: theme, language and Home's
/// Ayah of the Day.
class ProfileDeviceSettings extends ConsumerWidget {
  const ProfileDeviceSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final settings = ref.watch(settingsProvider);
    final notifier = ref.watch(settingsProvider.notifier);
    return Column(
      spacing: Insets.xl,
      children: [
        SettingsGroup(
          label: l10n.profileAppearance,
          icon: Icons.contrast_rounded,
          child: SegmentedSelector<ThemeMode>(
            options: const [ThemeMode.light, ThemeMode.dark, ThemeMode.system],
            labels: [
              l10n.profileThemeLight,
              l10n.profileThemeDark,
              l10n.profileThemeSystem,
            ],
            value: settings.themeMode,
            onChanged: notifier.setThemeMode,
          ),
        ),
        SettingsGroup(
          label: l10n.profileLanguage,
          icon: Icons.translate_rounded,
          child: SegmentedSelector<String>(
            options: const ['en', 'bn'],
            labels: [l10n.profileEnglish, l10n.profileBangla],
            value: Localizations.localeOf(context).languageCode,
            onChanged: (code) => notifier.setLocale(Locale(code)),
          ),
        ),
        SettingsGroup(
          label: l10n.homeSettingsTitle,
          icon: Icons.home_rounded,
          child: Material(
            color: context.palette.surface,
            child: const AyahSwitchTile(),
          ),
        ),
      ],
    );
  }
}
