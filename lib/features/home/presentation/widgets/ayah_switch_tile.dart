import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../providers/ayah_visible_provider.dart';

/// "Show Ayah of the Day" switch, for the Profile page's Home settings.
class AyahSwitchTile extends ConsumerWidget {
  const AyahSwitchTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SwitchListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(AppL10n.of(context)!.homeShowAyah),
    value: ref.watch(ayahVisibleProvider),
    onChanged: ref.read(ayahVisibleProvider.notifier).set,
  );
}
