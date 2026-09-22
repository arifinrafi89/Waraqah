import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/home_providers.dart';
import '../widgets/ayah_card.dart';
import '../widgets/ayah_card_skeleton.dart';

/// Ayah of the Day, loaded through its own provider so a slow verse never
/// blocks the rest of the home feed.
class AyahSection extends ConsumerWidget {
  const AyahSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Insets.screen, 4, Insets.screen, 0),
      child: AsyncView(
        value: ref.watch(ayahOfTheDayProvider),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(ayahOfTheDayProvider),
        skeleton: const AyahCardSkeleton(),
        builder: (ayah) => AyahCard(ayah: ayah),
      ),
    );
  }
}
