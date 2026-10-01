import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/ayah_visible_provider.dart';
import '../providers/home_providers.dart';
import 'ayah_card.dart';
import 'ayah_card_skeleton.dart';

/// Ayah of the Day, loaded through its own provider so a slow verse never
/// blocks the rest of the home feed. Nothing when the Reader turned it off.
class AyahSection extends ConsumerWidget {
  const AyahSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    if (!ref.watch(ayahVisibleProvider)) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        Insets.lg,
        Insets.screen,
        0,
      ),
      child: AsyncView(
        value: ref.watch(ayahOfTheDayProvider),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(ayahOfTheDayProvider),
        skeleton: const AyahCardSkeleton(),
        builder: (ayah) =>
            AyahCard(ayah: ayah, onHide: () => _hide(context, ref)),
      ),
    );
  }

  void _hide(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final notifier = ref.read(ayahVisibleProvider.notifier)..set(false);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(l10n.homeAyahHidden),
          action: SnackBarAction(
            label: l10n.commonUndo,
            onPressed: () => notifier.set(true),
          ),
        ),
      );
  }
}
