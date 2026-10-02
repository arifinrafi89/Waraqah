import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/settings/settings_provider.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/waraqah_wordmark.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/presentation/widgets/cart_button.dart';
import '../../../notifications/presentation/widgets/notification_bell.dart';

/// Home's top bar: the wordmark, plus quick theme and language toggles, the
/// notification bell and the cart. The two toggles read and write [settingsProvider].
class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final settings = ref.watch(settingsProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      child: Row(
        children: [
          const Expanded(child: WaraqahWordmark()),
          AppIconButton(
            icon: isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            tooltip: isDark
                ? l10n.homeAppBarLightMode
                : l10n.homeAppBarDarkMode,
            onPressed: () => settings.setThemeMode(
              isDark ? ThemeMode.light : ThemeMode.dark,
            ),
          ),
          const SizedBox(width: 8),
          AppIconButton(
            icon: Icons.translate_rounded,
            tooltip: isBangla ? l10n.homeAppBarEnglish : l10n.homeAppBarBangla,
            onPressed: () => settings.setLocale(Locale(isBangla ? 'en' : 'bn')),
          ),
          const SizedBox(width: 8),
          const NotificationBell(),
          const SizedBox(width: 8),
          const CartButton(),
        ],
      ),
    );
  }
}
